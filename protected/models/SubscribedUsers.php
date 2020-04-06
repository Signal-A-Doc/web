<?php

/**
 * This is the model class for table "tbl_subscribed_users".
 *
 * @property integer $id
 * @property integer $plan_id
 * @property integer $doctor_id
 * @property integer $payment_status
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id
 
 * === Related data ===
 * @property User $createdBy
 */
namespace app\models;

use Yii;
use app\models\User;
use yii\helpers\ArrayHelper;
use app\modules\payment\models\Transaction;
use Stripe\Stripe;
use app\models\search\AppointmentPlans;

class SubscribedUsers extends \app\components\TActiveRecord
{

    const PAYMENT_STATUS_UNPAID = 0;

    const PAYMENT_STATUS_PAID = 1;

    public function __toString()
    {
        return (string) $this->plan_id;
    }

    public static function getPlanOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Plan::findActive ()->all (), 'id', 'title' );
    }

    public function getPlan()
    {
        $list = self::getPlanOptions();
        return isset($list[$this->plan_id]) ? $list[$this->plan_id] : 'Not Defined';
    }

    public static function getDoctorOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Doctor::findActive ()->all (), 'id', 'title' );
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => "New",
            self::STATE_ACTIVE => "Active",
            self::STATE_DELETED => "Archived"
        ];
    }

    public function getState()
    {
        $list = self::getStateOptions();
        return isset($list[$this->state_id]) ? $list[$this->state_id] : 'Not Defined';
    }

    public function getStateBadge()
    {
        $list = [
            self::STATE_INACTIVE => "primary",
            self::STATE_ACTIVE => "success",
            self::STATE_DELETED => "danger"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : 'Not Defined';
    }

    const TYPE_DOCTOR = 1;

    const TYPE_PATIENT = 2;

    public static function getTypeOptions()
    {
        return [
            self::TYPE_DOCTOR => "doctor",
            self::TYPE_PATIENT => "patient"
        ];
        // return ArrayHelper::Map ( Type::findActive ()->all (), 'id', 'title' );
    }

    public function getType()
    {
        $list = self::getTypeOptions();
        return isset($list[$this->type_id]) ? $list[$this->type_id] : 'Not Defined';
    }

    public function beforeValidate()
    {
        if ($this->isNewRecord) {
            if (! isset($this->created_on))
                $this->created_on = date('Y-m-d H:i:s');
            if (! isset($this->updated_on))
                $this->updated_on = date('Y-m-d H:i:s');
            if (! isset($this->created_by_id))
                $this->created_by_id = Yii::$app->user->id;
        } else {
            $this->updated_on = date('Y-m-d H:i:s');
        }
        return parent::beforeValidate();
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%subscribed_users}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'plan_id',
                    'doctor_id',
                    'created_on',
                    'updated_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'plan_id',
                    
                    'payment_status',
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'created_on',
                    'updated_on'
                ],
                'safe'
            ],
            [
                [
                    'created_by_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => [
                    'created_by_id' => 'id'
                ]
            ],
            [
                [
                    'state_id'
                ],
                'in',
                'range' => array_keys(self::getStateOptions())
            ],
            [
                [
                    'type_id'
                ],
                'in',
                'range' => array_keys(self::getTypeOptions())
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'plan_id' => Yii::t('app', 'Plan'),
            'doctor_id' => Yii::t('app', 'Doctor'),
            'payment_status' => Yii::t('app', 'Payment Status'),
            'state_id' => Yii::t('app', 'State'),
            'type_id' => Yii::t('app', 'Type'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Created By')
        ];
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), [
            'id' => 'created_by_id'
        ]);
    }

    public function getUserPlan()
    {
        return $this->hasOne(Subscription::className(), [
            'id' => 'plan_id'
        ]);
    }

    public function getPatientPlan()
    {
        return $this->hasOne(AppointmentPlans::className(), [
            'id' => 'plan_id'
        ]);
    }

    public function getDoctor()
    {
        return $this->hasOne(User::className(), [
            'id' => 'doctor_id'
        ]);
    }

    public static function getHasManyRelations()
    {
        $relations = [];
        return $relations;
    }

    public static function getHasOneRelations()
    {
        $relations = [];
        $relations['id'] = [
            'feeds',
            'Feed',
            'model_id'
        ];
        $relations['created_by_id'] = [
            'createdBy',
            'User',
            'id'
        ];
        return $relations;
    }

    public function getFeeds()
    {
        return $this->hasMany(Feed::className(), [
            'model_id' => 'id'
        ])->andWhere([
            'model_type' => self::className()
        ]);
    }

    public function beforeDelete()
    {
        return parent::beforeDelete();
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['plan_id'] = $this->plan_id;
        
        $json['price'] = ! empty($this->patientPlan) ? $this->patientPlan->amount : '';
        
        $json['doctor_id'] = $this->doctor_id;
        $json['payment_status'] = $this->payment_status;
        $json['state_id'] = $this->state_id;
        $json['type_id'] = $this->type_id;
        $json['created_on'] = $this->created_on;
        $json['created_by_id'] = $this->created_by_id;
        if ($with_relations) {
            // createdBy
            $list = $this->createdBy;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['createdBy'] = $relationData;
            } else {
                $json['CreatedBy'] = $list;
            }
        }
        return $json;
    }

    public function sendPlanPurchaseMail()
    {
        $email = $this->doctor->email;
        
        $sub = "Plan Purchased By New User";
        EmailQueue::add([
            'to' => $email,
            'from' => \Yii::$app->params['adminEmail'],
            'subject' => $sub,
            'view' => 'planPurchase',
            'viewArgs' => [
                'user' => $this
            ]
        ], true);
    }
}
