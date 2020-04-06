<?php

/**
 * This is the model class for table "tbl_promocode".
 *
 * @property integer $id
 * @property integer $patient_id
 * @property string $promocode
 * @property string $discount
 * @property string $description
 * @property string $valid_till
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

class Promocode extends \app\components\TActiveRecord
{

    const DISCOUNT_FULL = 100;

    public function __toString()
    {
        return (string) $this->promocode;
    }

    const TYPE_PROMOCODE = 1;

    const TYPE_DOCCODE = 2;

    public static function getPatientOptions()
    {
        return [
            self::TYPE_PROMOCODE => "Promo Code",
            self::TYPE_DOCCODE => "Doc Code"
        ];
        // return ArrayHelper::Map ( Patient::findActive ()->all (), 'id', 'title' );
    }

    public function getPatient()
    {
        $list = self::getPatientOptions();
        return isset($list[$this->patient_id]) ? $list[$this->patient_id] : 'Not Defined';
    }

    const STATE_ACTIVE = 1;

    const STATE_EXPIRED = 2;

    public static function getStateOptions()
    {
        return [
            
            self::STATE_ACTIVE => "Active",
            self::STATE_EXPIRED => "Expired"
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
            
            self::STATE_ACTIVE => "success",
            self::STATE_EXPIRED => "danger"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : 'Not Defined';
    }

    public static function getTypeOptions()
    {
        return [
            self::TYPE_PROMOCODE => "Promo Code",
            self::TYPE_DOCCODE => "Doc Code"
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
        return '{{%promocode}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    
                    'promocode',
                    'discount',
                    'valid_till',
                    'created_on',
                    'updated_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                
                [
                    'promocode'
                ],
                'unique',
                'message' => \Yii::t('app', "This {attribute} has already been taken")
            
            ],
            [
                [
                    
                    'patient_id',
                    'state_id',
                    'discount',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'discount'
                ],
                'integer',
                'min' => 0,
                'max' => 100,
                'message' => \Yii::t('app', 'Discount must be in range 1-100')
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
                    'promocode',
                    
                    'description',
                    'valid_till'
                ],
                'string',
                'max' => 256
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
                    'promocode',
                    'discount',
                    'description',
                    'valid_till'
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
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'patient_id' => Yii::t('app', 'Patient'),
            'promocode' => Yii::t('app', 'Promo / Doccode'),
            'discount' => Yii::t('app', 'Discount in percentage'),
            'description' => Yii::t('app', 'Description'),
            'valid_till' => Yii::t('app', 'Valid Till'),
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
        $json['patient_id'] = $this->patient_id;
        $json['promocode'] = $this->promocode;
        $json['discount'] = $this->discount;
        $json['description'] = $this->description;
        $json['valid_till'] = $this->valid_till;
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
}
