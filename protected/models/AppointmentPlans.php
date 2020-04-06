<?php

/**
 * This is the model class for table "tbl_appointment_plans".
 *
 * @property integer $id
 * @property integer $doctor_id
 * @property string $amount
 * @property string $description
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id

 * === Related data ===
 * @property User $createdBy
 * @property User $doctor
 */
namespace app\models;

use Yii;
use app\models\User;
use yii\helpers\ArrayHelper;

class AppointmentPlans extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->doctor_id;
    }

    public static function getDoctorOptions()
    {
        return ArrayHelper::Map(User::find()->where([
            'role_id' => User::ROLE_DOCTOR
        ])->all(), 'id', 'full_name');
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => \Yii::t('app', "Inactive"),
            self::STATE_ACTIVE => \Yii::t('app', "Active")
        ];
    }

    public function getState()
    {
        $list = self::getStateOptions();
        return isset($list[$this->state_id]) ? $list[$this->state_id] : \Yii::t('app', 'Not Defined');
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
        ]) : \Yii::t('app', 'Not Defined');
    }

    const TYPE_MONTHLY = 1;

    const TYPE_QUARTERLY = 2;

    const TYPE_HALF_YEARLY = 3;

    const TYPE_YEARLY = 4;

    public static function getTypeOptions()
    {
        return [
            self::TYPE_MONTHLY => \Yii::t('app', "Monthly"),
            self::TYPE_QUARTERLY => \Yii::t('app', "Quarterly"),
            self::TYPE_HALF_YEARLY => \Yii::t('app', "Half Yearly"),
            self::TYPE_YEARLY => \Yii::t('app', "Yearly")
        ];
    }

    public function getType()
    {
        $list = self::getTypeOptions();
        return isset($list[$this->type_id]) ? $list[$this->type_id] : \Yii::t('app', 'Not Defined');
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
     *
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%appointment_plans}}';
    }

    /**
     *
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'doctor_id',
                    'amount',
                    'description',
                    'created_on',
                    'updated_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'doctor_id',
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
                    'amount'
                ],
                'double'
            ],
            [
                [
                    'description'
                ],
                'string'
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
                    'doctor_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => [
                    'doctor_id' => 'id'
                ]
            ],
            [
                [
                    'amount',
                    'description'
                ],
                'trim'
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
     *
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'doctor_id' => Yii::t('app', 'Doctor'),
            'amount' => Yii::t('app', 'Amount'),
            'description' => Yii::t('app', 'Description'),
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

    /**
     *
     * @return \yii\db\ActiveQuery
     */
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
        $relations['doctor_id'] = [
            'doctor',
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
        $json['doctor_id'] = $this->doctor_id;
        $json['amount'] = $this->amount;
        $json['description'] = strip_tags($this->description);
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
            // doctor
            $list = $this->doctor;

            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['doctor'] = $relationData;
            } else {
                $json['Doctor'] = $list;
            }
        }
        return $json;
    }
}
