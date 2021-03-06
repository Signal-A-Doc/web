<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author    : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */
namespace app\models;
use app\models\CategoryQuestionRepeateType;

use Yii;

/**
 * This is the model class for table "tbl_category_question".
 *
 * @property integer $id
 * @property string $title
 * @property integer $category_id
 * @property integer $state_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id === Related data ===
 * @property Category $createdBy
 * @property User $createdBy0
 */
class CategoryQuestion extends \app\components\TActiveRecord
{

    public $repeated_type;
    public function __toString()
    {
        return (string) $this->title;
    }

    public static function getCategoryOptions()
    {
        $query = Category::find()->where([
            'type_id' => Category::TYPE_SYMPTOMS,
            'state_id' => Category::STATE_ACTIVE
        ])->each();

        $category = [];

        foreach ($query as $cat) {

            $category[$cat->id] = $cat->title;
        }

        return $category;
    }

    public function getCategory()
    {
        $list = self::getCategoryOptions();
        return isset($list[$this->category_id]) ? $list[$this->category_id] : 'Not Defined';
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    const TYPE_RADIO = 0;

    const TYPE_TEXT = 1;

    const TYPE_CHECKBOX = 2;

    const TYPE_DROPDOWN = 3;
    
    const TYPE_REPEAT = 5;
    const TYPE_TIME = 6;

    public static function getTypeOptions()
    {
        return [
            self::TYPE_RADIO => "Radio",
            self::TYPE_TEXT => "Text",
            self::TYPE_CHECKBOX => "Checkbox",
            self::TYPE_DROPDOWN => "Dropdown",
            self::TYPE_REPEAT => "Repeat"
        ];
    }

    public function getType()
    {
        $list = self::getTypeOptions();
        return isset($list[$this->type_id]) ? $list[$this->type_id] : 'Not Defined';
    }

    public static function getQuestionTypeOptions()
    {
        return [
            self::TYPE_TEXT => "Text",
            self::TYPE_TIME => "Time"
        ];
    }

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => "New",
            self::STATE_ACTIVE => "Active",
            self::STATE_DELETED => "Deleted"
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
            self::STATE_INACTIVE => "secondary",
            self::STATE_ACTIVE => "success",
            self::STATE_DELETED => "danger"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'badge badge-' . $list[$this->state_id]
        ]) : 'Not Defined';
    }

    public static function getActionOptions()
    {
        return [
            self::STATE_INACTIVE => "Deactivate",
            self::STATE_ACTIVE => "Activate",
            self::STATE_DELETED => "Delete"
        ];
    }

    public function beforeValidate()
    {
        if ($this->isNewRecord) {
            if (empty($this->created_on)) {
                $this->created_on = date('Y-m-d H:i:s');
            }
            if (empty($this->updated_on)) {
                $this->updated_on = date('Y-m-d H:i:s');
            }
            if (empty($this->created_by_id)) {
                $this->created_by_id = self::getCurrentUser();
            }
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
        return '{{%category_question}}';
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
                    'title',
                    'category_id',
                    'state_id',
                    'created_on',
                    'updated_on',
                ],
                'required'
            ],
            [
                'repeated_type', 
                'required', 
                'when' => function ($model) {
                     return $model->type_id == CategoryQuestion::TYPE_REPEAT;
                },
                'whenClient' => "function (attribute, value) {
                  return $('categoryquestion-type_id').val() == '".CategoryQuestion::TYPE_REPEAT."';
                }"
            ],
            [
                [
                    'category_id',
                    'state_id',
                    'created_by_id',
                    'type_id'
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
                    'title'
                ],
                'trim'
            ],
            [
                [
                    'state_id'
                ],
                'in',
                'range' => array_keys(self::getStateOptions())
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
            'category_id' => Yii::t('app', 'Category'),
            'state_id' => Yii::t('app', 'State'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Created By'),
            'type_id' => Yii::t('app', 'Type')
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
    * @return \yii\db\ActiveQuery
    */
    public function getRepeaterType()
    {
        return $this->hasMany(CategoryQuestionRepeateType::className(), ['category_question_id' => 'id']);
    }

    public function getCategories()
    {
        return $this->hasOne(Category::className(), [
            'id' => 'category_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy0()
    {
        return $this->hasOne(User::className(), [
            'id' => 'created_by_id'
        ]);
    }

    public static function getHasManyRelations()
    {
        $relations = [];

        $relations['feeds'] = [
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

        $relations['category_id'] = [
            'categories',
            'Category',
            'id'
        ];

        return $relations;
    }

    public function beforeDelete()
    {
        if (! parent::beforeDelete()) {
            return false;
        }
        
        CategoryAnswer::deleteRelatedAll([
            'question_id' => $this->id
        ]);
        
        // TODO : start here
        return true;
    }

    public function beforeSave($insert)
    {
        if (! parent::beforeSave($insert)) {
            return false;
        }
        // TODO : start here

        return true;
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['title'] = $this->title;
        $json['category_id'] = $this->category_id;
        $json['state_id'] = $this->state_id;
        $json['created_on'] = $this->created_on;
        $json['created_by_id'] = $this->created_by_id;

        // type_id
        $json['type_id'] = $this->type_id;

        if ($with_relations) {
            $list = $this->repeaterType;

                if ( is_array($list))
                {
                    $relationData = [];
                    foreach( $list as $item)
                    {
                        $relationData []    = $item->asJson();
                    }
                    $json['repeaterType']     = $relationData;
                }
                else
                {
                    $json['repeaterType']     = $list;
                }
        }
        return $json;
    }

    public static function addTestData($count = 1)
    {
        $faker = \Faker\Factory::create();
        $states = array_keys(self::getStateOptions());
        for ($i = 0; $i < $count; $i ++) {
            $model = new self();

            $model->title = $faker->text(10);
            $model->category_id = 1;
            $model->state_id = $states[rand(0, count($states))];
            $model->save();
        }
    }

    public static function addData($data)
    {
        $faker = \Faker\Factory::create();
        if (self::find()->count() != 0)
            return;
        foreach ($data as $item) {
            $model = new self();

            $model->title = isset($item['title']) ? $item['title'] : $faker->text(10);

            $model->category_id = isset($item['category_id']) ? $item['category_id'] : 1;
                            $model->state_id = self::STATE_ACTIVE;
            $model->save();
        }
    }   
}
