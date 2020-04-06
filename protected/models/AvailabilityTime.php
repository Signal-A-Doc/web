<?php

/**
 * This is the model class for table "tbl_availability_time".
 *
 * @property integer $id
 * @property integer $doctor_availability_id
 * @property string $time
 * @property string $price
 * @property string $description
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id
 
 * === Related data ===
 * @property User $createdBy
 * @property Doctoravailability $doctorAvailability
 */
namespace app\models;

use Yii;

class AvailabilityTime extends \app\components\TActiveRecord
{

    public $time;
    public function __toString()
    {
        return (string) $this->doctor_availability_id;
    }

    public static function getDoctorAvailabilityOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( DoctorAvailability::findActive ()->all (), 'id', 'title' );
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => \Yii::t('app', "New"),
            self::STATE_ACTIVE => \Yii::t('app', "Active"),
            self::STATE_DELETED => \Yii::t('app', "Archived")
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

    public static function getTypeOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Type::findActive ()->all (), 'id', 'title' );
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
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%availability_time}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'doctor_availability_id',
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                 //   'time',
                   // 'price',
                    'created_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [ 
                    'time',
                    'price',
                    'created_on',
                    'updated_on',
                    'time',
                    'end_time',
                    'start_time',
                    'date'
                ],
                'safe'
            ],
            [
                [
                    'time',
                    'price',
                    'description'
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
                    'doctor_availability_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => DoctorAvailability::className(),
                'targetAttribute' => [
                    'doctor_availability_id' => 'id'
                ]
            ],
            [
                [
                    'time',
                    'price',
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
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'doctor_availability_id' => Yii::t('app', 'Doctor Availability'),
            'time' => Yii::t('app', 'Time'),
            'price' => Yii::t('app', 'Price'),
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
    public function getDoctorAvailability()
    {
        return $this->hasOne(DoctorAvailability::className(), [
            'id' => 'doctor_availability_id'
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
        $relations['doctor_availability_id'] = [
            'doctorAvailability',
            'Doctoravailability',
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
        $json['doctor_availability_id'] = $this->doctor_availability_id;
        $json['start_time'] = $this->start_time;
        $json['end_time'] = $this->end_time;
        $json['date'] = $this->date;
        $json['price'] = $this->price;
        //$json['description'] = $this->description;
        // $json['state_id'] = $this->state_id;
        // $json['type_id'] = $this->type_id;
        // $json['created_on'] = $this->created_on;
        // $json['created_by_id'] = $this->created_by_id;
        if ($with_relations) {
            // createdBy
//            $list = $this->createdBy;
            
//             if (is_array($list)) {
//                 $relationData = [];
//                 foreach ($list as $item) {
//                     $relationData[] = $item->asJson();
//                 }
//                 $json['createdBy'] = $relationData;
//             } else {
//                 $json['CreatedBy'] = $list;
//             }
//             // doctorAvailability
//             $list = $this->doctorAvailability;
            
//             if (is_array($list)) {
//                 $relationData = [];
//                 foreach ($list as $item) {
//                     $relationData[] = $item->asJson();
//                 }
//                 $json['doctorAvailability'] = $relationData;
//             } else {
//                 $json['DoctorAvailability'] = $list;
//             }
        }
        return $json;
    }

    public function getTimeSlots()
    {
        $times = AvailabilityTime::find()->where([
            'date' => $this->date,
            'doctor_availability_id' => $this->doctor_availability_id
        ])->all();
        
        if (! empty($times)) {
            foreach ($times as $time) {
                $list[] = [
                    'start_time' => $time->start_time,
                    'end_time' => $this->end_time
                ];
            }
        }
        return ! empty($list) ? $list : null;
    }
}
