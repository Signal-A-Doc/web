<?php

/**
 * This is the model class for table "tbl_category".
 *
 * @property integer $id
 * @property string $title
 * @property string $image_file
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id

 * === Related data ===
 * @property User $createdBy
 */
namespace app\models;
use app\models\SubCategory;

use Yii;

class Category extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->title;
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    const TYPE_SYMPTOMS = 1;

    const TYPE_DEPARTMENT = 2;

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
            self::STATE_ACTIVE => "success"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : \Yii::t('app', 'Not Defined');
    }

    public static function getTypeOptions()
    {
        return [
            self::TYPE_SYMPTOMS => "Symptoms",
            self::TYPE_DEPARTMENT => "Medical Speciliazation"
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
        return '{{%category}}';
    }

    /**
     *
     * @inheritdoc
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();

        $scenarios['add'] = [
            'title',
            'image_file',
            'created_by_id',
            'description'
        ];

        $scenarios['update'] = [
            'title',
            'image_file',
            'created_by_id',
            'description'
        ];

        return $scenarios;
    }

    public function rules()
    {
        return [
            [
                [
                    'title'
                ],
                'required'
            ],
            [
                [
                    'title'
                ],
                'unique'
            ],
            [
                [

                    'image_file'
                ],
                'required',
                'on' => 'add'
            ],
            [
                [
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
                    'title'
                ],
                'string',
                'max' => 255
            ],
            [
                [
                    'description'
                ],
                'string',
                'max' => 512
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
                    'title'
                ],
                'trim'
            ],
            [
                [
                    'image_file'
                ],
                'file',
                'skipOnEmpty' => true,
                'extensions' => 'png, jpg,jpeg'
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
            'title' => Yii::t('app', 'Title'),
            'image_file' => Yii::t('app', 'Image File'),
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
        SubCategory::deleteRelatedAll([
            'category_id' => $this->id
        ]);

        Patientsymptom::deleteRelatedAll([
            'category_id' => $this->id
        ]);
        
        Illness::deleteRelatedAll([
            'category_id' => $this->id
        ]);

        CategoryQuestion::deleteRelatedAll([
            'category_id' => $this->id
        ]);
        
        Doctorspecialization::deleteRelatedAll([
            'category_id' => $this->id
        ]);
        
        
        return parent::beforeDelete();
    }

    public function getSymptoms()
    {
        $symptoms = Illness::find()->where(['category_id' => $this->id]);
        return $symptoms;
        /*return $this->hasMany(Illness::className(), [
            'category_id' => $this->id
        ]);*/
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['title'] = $this->title;
        if (! empty($this->image_file)) {
            $json['image_file'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'user/download',
                'profile_file' => $this->image_file
            ]);
        } else {
            $json['image_file'] = '';
        }
        $json['state_id'] = $this->state_id;
        $json['type_id'] = $this->type_id;
        $json['created_on'] = $this->created_on;
        $json['created_by_id'] = $this->created_by_id;
        return $json;
    }
}
