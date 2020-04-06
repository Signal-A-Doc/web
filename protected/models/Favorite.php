<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author    : Shiv Charan Panjeta < shiv@toxsl.com >
 */

/**
 * This is the model class for table "tbl_favorite".
 *
 * @property integer $id
 * @property integer $doctor_id
 * @property string $model_type
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id === Related data ===
 * @property User $createdBy
 * @property User $doctor
 */
namespace app\models;

use Yii;
use app\models\User;
use yii\helpers\ArrayHelper;

class Favorite extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->doctor_id;
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

    const TYPE_FAVOURTITE = 1;

    const TYPE_UNFAVOURTITE = 2;

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

    public static function getTypeOptions()
    {
        return [
            self::TYPE_FAVOURTITE => "Favourite",
            self::TYPE_UNFAVOURTITE => "Unfavourite"
        ];
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
     *
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%favorite}}';
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
                    // 'model_type',
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
                    'model_type'
                ],
                'string',
                'max' => 255
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
                    'model_type'
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
            'model_type' => Yii::t('app', 'Model Type'),
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
        $relations['id'] = [
            'feeds',
            'Feed',
            'model_id'
        ];
        return $relations;
    }

    public static function getHasOneRelations()
    {
        $relations = [];
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
        // $json['doctor_id'] = $this->doctor_id;
        // $json['model_type'] = $this->model_type;
        // $json['state_id'] = $this->state_id;
        // $json['type_id'] = $this->type_id;
        // $json['created_on'] = $this->created_on;
        // $json['created_by_id'] = $this->created_by_id;
        $json['doctor'] = $this->doctor->asJson();
        if ($with_relations) {
            // createdBy
            // $list = $this->createdBy;

            // if (is_array($list)) {
            // $relationData = [];
            // foreach ($list as $item) {
            // $relationData[] = $item->asJson();
            // }
            // $json['createdBy'] = $relationData;
            // } else {
            // $json['CreatedBy'] = $list;
            // }
            // doctor
            // $list = $this->doctor;

            // if (is_array($list)) {
            // $relationData = [];
            // foreach ($list as $item) {
            // $relationData[] = $item->asJson();
            // }
            // $json['doctor'] = $relationData;
            // } else {
            // $json['Doctor'] = $list;
            // }
        }
        return $json;
    }
}
