<?php

/**
 * This is the model class for table "tbl_file".
 *
 * @property integer $id
 * @property string $title
 * @property string $file
 * @property string $size
 * @property string $extension
 * @property integer $model_id
 * @property string $model_type
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id
 
 * === Related data ===
 * @property User $createdBy
 */
namespace app\models;

use app\models\User;
use Yii;
use yii\helpers\StringHelper;
use yii\web\UploadedFile;
use yii\helpers\VarDumper;

class File extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->title;
    }

    public static function getModelOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Model::findActive ()->all (), 'id', 'title' );
    }

    public function getModel()
    {
        $list = self::getModelOptions();
        return isset($list[$this->model_id]) ? $list[$this->model_id] : 'Not Defined';
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
        return isset($list[$this->type_id]) ? $list[$this->type_id] : 'Not Defined';
    }

    public static function getCreatedByOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( CreatedBy::findActive ()->all (), 'id', 'title' );
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
        return '{{%file}}';
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
                    'file',
                    // 'size',
                    // 'extension',
                    'model_id',
                    'model_type',
                    // 'state_id',
                    // 'type_id',
                    'created_on',
                    'updated_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'model_id',
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
                    'title',
                    'file',
                    // 'size',
                    'extension',
                    'model_type'
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
                    'title',
                    'file',
                    'size',
                    'extension',
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
            'file' => Yii::t('app', 'file'),
            'size' => Yii::t('app', 'Size'),
            'extension' => Yii::t('app', 'Extension'),
            'model_id' => Yii::t('app', 'Model'),
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

    public static function getHasManyRelations()
    {
        $relations = [];
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
        return $relations;
    }

    public function beforeDelete()
    {
        return parent::beforeDelete();
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['title'] = $this->title;
        $json['file'] = $this->file;
        $json['size'] = $this->size;
        $json['extension'] = $this->extension;
        $json['model_id'] = $this->model_id;
        $json['model_type'] = $this->model_type;
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

    public function uploadFiles($image, $model, $deleteOld = false)
    {
        if ($deleteOld == true) {
            $existings = File::find()->where([
                'model_id' => $model->id,
                'model_type' => get_class($model)
            ])
                ->limit(100)
                ->all();
            if ($existings) {
                foreach ($existings as $exist) {
                    $exist->delete();
                }
            }
        }
        
        if (isset($image)) {
            
            foreach ($image as $uploaded_file) {
                $imagefile = new self();
                $path = UPLOAD_PATH;
                $fileName = time() . '-' . $uploaded_file->name;
                $filename = $path . $fileName;
                if (file_exists($filename))
                    unlink($filename);
                $uploaded_file->saveAs($filename);
                $imagefile->model_id = $model->id;
                $imagefile->model_type = get_class($model);
                $imagefile->created_by_id = \Yii::$app->user->id;
                $imagefile->size = $uploaded_file->size;
                $imagefile->title = $fileName;
                $imagefile->file = $fileName;
                if (! $imagefile->save()) {
                    print_R($imagefile->getErrorsString());
                    exit();
                }
            }
        }
    }

    public static function add($model, $data = null, $filename = null)
    {
        $old = File::find()->where([
            'model_type' => get_class($model),
            'model_id' => $model->id,
            'file' => basename($filename)
        ])->one();
        
        if ($old) {
            return $old;
        }
        $attachment = new File();
        $attachment->loadDefaultValues();
        $attachment->model_id = $model->id;
        $attachment->model_type = get_class($model);
        $attachment->type_id = 0;
        if ($data) {
            
            if ($data instanceof UploadedFile) {
                $attachment->file = $data->basename . '.' . $data->extension;
                $filename = UPLOAD_PATH . yii\helpers\StringHelper::basename($attachment->model_type) . '_' . $attachment->model_id . '_' . $attachment->file;
                $filename = str_replace(' ', '-', $filename);
                if (file_exists($filename))
                    unlink($filename);
                $data->saveAs($filename);
            } else {
                $attachment->file = basename($filename);
                $filename = UPLOAD_PATH . yii\helpers\StringHelper::basename($attachment->model_type) . '_' . $attachment->model_id . '_' . $attachment->file;
                $filename = str_replace(' ', '-', $filename);
                if (file_exists($filename))
                    unlink($filename);
                file_put_contents($filename, $data);
            }
        }
        $attachment->size = @filesize($filename);
        $attachment->file = basename($filename);
        
        if (! $attachment->save()) {
            VarDumper::dump($attachment->errors);
            return null;
        }
        return $attachment;
    }
}
