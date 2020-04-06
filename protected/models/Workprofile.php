<?php

/**
 * This is the model class for table "tbl_work_profile".
 *
 * @property integer $id
 * @property integer $professional_status
 * @property string $professional_indemnity
 * @property integer $MDCN_folio_number
 * @property string $MDCN_certificate
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id

 * === Related data ===
 * @property User $createdBy
 * @property Doctorprofessionalstatus $professionalStatus
 */
namespace app\models;

use Yii;
use app\models\User;
use app\models\Doctorprofessionalstatus;
use yii\helpers\ArrayHelper;

class Workprofile extends \app\components\TActiveRecord
{

    public $MDCN_certificate_file;

    public $file_type;

    public function __toString()
    {
        return (string) $this->professional_status;
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    const MDCN_CERTIFICATE_YES = 1;

    const MDCN_CERTIFICATE_NO = 0;

    const IMAGE_TYPE_PROFESSIONAL_INDEMINITY = 1;

    const IMAGE_TYPE_MDCN_CERTIFICATE = 2;

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

    public static function getProfessionalStatusOption()
    {
        return ArrayHelper::Map(Doctorprofessionalstatus::findActive()->each(), 'id', 'title');
    }

    public static function getProfessionalState($professional_status)
    {
        $list = self::getProfessionalStatusOption();
        return isset($list[$professional_status]) ? $list[$professional_status] : 'Not Defined';
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
        return '{{%work_profile}}';
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
                    'professional_status',
                    'professional_indemnity',
                    'MDCN_folio_number',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'professional_status',
                    'MDCN_folio_number',
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'created_on',
                    'updated_on',
                    'MDCN_folio_number',
                    'registeration_number',
                    'issued_date',
                    'expiry_date',
                    'profile_summary',
                    'MDCN_certificate_file',
                    'professional_indemnity_certificate',
                    'file_type'
                ],
                'safe'
            ],
            [
                [
                    'professional_indemnity'
                ],
                'string',
                'max' => 255
            ],
            [
                [
                    'MDCN_certificate'
                ],
                'string',
                'max' => 1024
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
                    'professional_status'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => Doctorprofessionalstatus::className(),
                'targetAttribute' => [
                    'professional_status' => 'id'
                ]
            ],
            [
                [
                    'professional_indemnity',
                    'MDCN_certificate',
                    'type_id'
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
            'professional_status' => Yii::t('app', 'Professional Status'),
            'professional_indemnity' => Yii::t('app', 'Professional Indemnity'),
            'MDCN_folio_number' => Yii::t('app', 'Mdcn Folio Number'),
            'MDCN_certificate' => Yii::t('app', 'Mdcn Certificate'),
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
    public function getProfessionalStatus()
    {
        return $this->hasOne(Doctorprofessionalstatus::className(), [
            'id' => 'professional_status'
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
        $relations['professional_status'] = [
            'professionalStatus',
            'Doctorprofessionalstatus',
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
        $json['professional_status'] = $this->professional_status;
        $json['professionalStatus'] = $this->getProfessionalState($this->professional_status);
        $json['professional_indemnity'] = $this->professional_indemnity;
        $json['professional_indemnity_certificate'] = $this->professional_indemnity_certificate;
        if (! empty($this->professional_indemnity_certificate)) {
            $json['professional_indemnity_certificate'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'workprofile/download',
                'work_profile_file' => $this->professional_indemnity_certificate
            ]);
        } else {
            $json['professional_indemnity_certificate'] = \Yii::$app->urlManager->createAbsoluteUrl('themes/base/img/default.jpeg');
        }
        $json['MDCN_folio_number'] = $this->MDCN_folio_number;
        $json['MDCN_certificate'] = $this->MDCN_certificate;
        if (! empty($this->professional_indemnity_certificate)) {
            $json['MDCN_certificate'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'workprofile/download',
                'work_profile_file' => $this->MDCN_certificate
            ]);
        } else {
            $json['MDCN_certificate'] = \Yii::$app->urlManager->createAbsoluteUrl('themes/base/img/default.jpeg');
        }
        $json['registeration_number'] = $this->registeration_number;
        $json['issued_date'] = $this->issued_date;
        $json['expiry_date'] = $this->expiry_date;
        $json['profile_summary'] = $this->profile_summary;
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
            // professionalStatus
            $list = $this->professionalStatus;

            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['professionalStatus'] = $relationData;
            } else {
                $json['ProfessionalStatus'] = $list;
            }
        }
        return $json;
    }
}
