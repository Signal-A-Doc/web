<?php

/**
 * This is the model class for table "tbl_appointment".
 *
 * @property integer $id
 * @property integer $doctor_id
 * @property string $name
 * @property string $health_issue
 * @property integer $age
 * @property integer $gender
 * @property string $date
 * @property string $time
 * @property integer $type_id
 * @property integer $state_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id

 * === Related data ===
 * @property User $createdBy
 * @property User $doctor
 * @property Appointmentillness[] $appointmentillnesses
 */
namespace app\models;

use app\modules\payment\models\Transaction;
use Yii;
use yii\base\Exception;

class Appointment extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->name;
    }

    public static function getDoctorOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
    }

    public static function getTypeOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
    }

    public function getType()
    {
        $list = self::getTypeOptions();
        return isset($list[$this->type_id]) ? $list[$this->type_id] : \Yii::t('app', 'Not Defined');
    }

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    const STATE_PENDING = 3;

    const STATE_ACCEPT = 4;

    const STATE_REJECT = 5;

    const STATE_COMPLETED = 6;

    const STATE_RESCHEDULE = 8;

    const STATE_CANCELLED = 7;

    const STATE_RESCHEDULE_PENDING = 9;

    const STATE_RESCHEDULE_REJECT = 10;

    const TYPE_MYSELF = 0;

    const TYPE_WIFE = 1;

    const TYPE_KIDS = 2;

    const TYPE_PARENTS = 3;

    const TYPE_RELATIVES = 4;

    const TYPE_OTHER = 5;

    const GENDER_MALE = 0;

    const GENDER_FEMALE = 1;

    const PAYMENT_STATUS_UNPAID = 0;

    const PAYMENT_STATUS_PAID = 1;

    const REQUEST_TYPE_APPOINTMENT = 1;

    const REQUEST_TYPE_PLAN = 2;

    public static function getStateOptions()
    {
        return [

            self::STATE_PENDING => \Yii::t('app', "Pending"),
            self::STATE_ACCEPT => \Yii::t('app', "Accept"),
            self::STATE_REJECT => \Yii::t('app', "Raject"),
            self::STATE_COMPLETED => \Yii::t('app', "Completed"),
            self::STATE_RESCHEDULE => \Yii::t('app', "Reschedule"),
            self::STATE_CANCELLED => \Yii::t('app', "Cancelled")
        ];
    }

    public function getState()
    {
        $list = self::getStateOptions();
        return isset($list[$this->state_id]) ? $list[$this->state_id] : \Yii::t('app', 'Not Defined');
    }

    public static function getPaymentOptions()
    {
        return [
            self::PAYMENT_STATUS_UNPAID => \Yii::t('app', "Unpaid"),
            self::PAYMENT_STATUS_PAID => \Yii::t('app', "Paid")
        ];
    }

    public function getPayment()
    {
        $list = self::getPaymentOptions();
        return isset($list[$this->payment_status]) ? $list[$this->payment_status] : \Yii::t('app', 'Not Defined');
    }

    public function getStateBadge()
    {
        $list = [
            self::STATE_PENDING => "primary",
            self::STATE_ACCEPT => "success",
            self::STATE_REJECT => "danger",
            self::STATE_COMPLETED => "primary",
            self::STATE_RESCHEDULE => "success",
            self::STATE_CANCELLED => "danger"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : \Yii::t('app', 'Not Defined');
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
        return '{{%appointment}}';
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
                    'doctor_id'
                    // 'name',
                    // 'age',
                    // 'gender'
                ],
                'required'
            ],
            [
                [
                    'doctor_id',
                    'age',
                    'gender',
                    'type_id',
                    'state_id',
                    'created_by_id',
                    'availability_time_id',
                    'payment_status',
                    'discount',
                    'patient_id'
                ],
                'integer'
            ],
            [
                [
                    'date',
                    'time',
                    'price',
                    'availability_id',
                    'created_on',
                    'reschedule_reason',
                    'updated_on',
                    'document_ids',
                    'final_price',
                    'doctor_notes'
                ],
                'safe'
            ],
            [
                [
                    'name',
                    'reschedule_reason',
                    'health_issue',
                    'cancel_reason',
                    'prescription_image'
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
                    'name',
                    'health_issue'
                ],
                'trim'
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
            'name' => Yii::t('app', 'Patient Name'),
            'health_issue' => Yii::t('app', 'Health Issue'),
            'age' => Yii::t('app', 'Age'),
            'gender' => Yii::t('app', 'Gender'),
            'date' => Yii::t('app', 'Date'),
            'time' => Yii::t('app', 'Time'),
            'type_id' => Yii::t('app', 'Type'),
            'state_id' => Yii::t('app', 'State'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Created By')
        ];
    }

    public function getMonthlyEarning()
    {
        $data = [];
        for ($i = 1; $i <= 12; $i ++) {
            $total = 0;
            $models = Appointment::find()->where([
                'state_id' => Appointment::STATE_COMPLETED,
                'doctor_id' => \Yii::$app->user->id,
                'payment_status' => Appointment::PAYMENT_STATUS_PAID
            ])->all();

            if (! empty($models)) {
                foreach ($models as $model) {
                    $date = $model->date;
                    $d = date_parse_from_format("Y-m-d", $date);
                    $month = $d["month"];
                    if ($month == $i) {
                        $total += $model->price;
                    }
                }
            }
            $data[] = [
                'month' => $i,
                'total' => $total
            ];
        }
        return $data;
    }

    public function getWeeklyEarning()
    {
        $data = [];
        for ($i = 1; $i <= 7; $i ++) {
            $total = 0;
            $models = Appointment::find()->where([
                'state_id' => Appointment::STATE_COMPLETED,
                'doctor_id' => \Yii::$app->user->id,
                'payment_status' => Appointment::PAYMENT_STATUS_PAID
            ])->all();

            if (! empty($models)) {
                foreach ($models as $model) {
                    $date = $model->date;
                    $d = date_parse_from_format("Y-m-d", $date);
                    print_r($d);
                    exit();
                    $month = $d["week"];
                    if ($month == $i) {
                        $total += $model->price;
                    }
                }
            }
            $data[] = [
                'week' => $i,
                'total' => $total
            ];
        }

        return $data;
    }

    public function sendAppointmentMail()
    {
        try {
            $email = $this->createdBy->email;

            $sub = "Appointment Alert";
            EmailQueue::add([
                'to' => $email,
                'from' => \Yii::$app->params['adminEmail'],
                'subject' => $sub,
                'view' => 'completeAppointment',
                'viewArgs' => [
                    'user' => $this
                ]
            ], true);
        } catch (Exception $e) {
            return false;
        }
    }

    public function sendConfirmationMail()
    {
        $email = $this->doctor->email;

        $sub = "Appointment Alert";
        EmailQueue::add([
            'to' => $email,
            'from' => \Yii::$app->params['adminEmail'],
            'subject' => $sub,
            'view' => 'appointmentBook',
            'viewArgs' => [
                'user' => $this
            ]
        ], true);
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
    
    public function getAvailabilityTime()
    {
        return $this->hasOne(AvailabilityTime::className(), [
            'id' => 'availability_time_id'
        ]);
    }
    
    public function getAvailabilityMode()
    {
        return $this->hasOne(ConsultationAvailability::className(), [
            'id' => 'availability_id'
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

    public static function getCode($count = 4)
    {
        $alphabet = "0123456789";
        $alphabet = "0123456789";
        $pass = [];
        $alphaLength = strlen($alphabet) - 1;
        for ($i = 0; $i < $count; $i ++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAppointmentillnesses()
    {
        return $this->hasMany(Appointmentillness::className(), [
            'appointment_id' => 'id'
        ]);
    }

    public static function getHasManyRelations()
    {
        $relations = [];
        $relations['Appointmentillnesses'] = [
            'appointmentillnesses',
            'Appointmentillness',
            'id',
            'appointment_id'
        ];
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
        Appointmentillness::deleteRelatedAll([
            'appointment_id' => $this->id
        ]);
        CallLog::deleteRelatedAll([
            'appointment_id' => $this->id
        ]);
        return parent::beforeDelete();
    }

    public function getDocuments()
    {
        $list = [];
        $ids = [];
        if (! empty($this->document_ids)) {
            $ids = explode(',', $this->document_ids);

            $models = File::find()->where([
                'IN',
                'id',
                $ids
            ])->all();

            if (! empty($models)) {
                foreach ($models as $model) {
                    $data['id'] = $model->id;
                    if (isset($model->file) && file_exists(UPLOAD_PATH . $model->file)) {
                        $data['image_file'] = \Yii::$app->urlManager->createAbsoluteUrl([
                            'user/download',

                            'profile_file' => $model->file
                        ]);
                        $data['id'] = $model->id;
                    } else {
                        $data['image_file'] = \Yii::$app->urlManager->createAbsoluteUrl('themes/base/img/default.jpeg');
                        $data['id'] = $model->id;
                    }
                    $list[] = $data;
                }
            } else {
                $data['image_file'] = \Yii::$app->urlManager->createAbsoluteUrl('themes/base/img/default.jpeg');

                $list[] = $data;
            }
        }
        return $list;
    }

    public function asJson($with_relations = true)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['doctor_id'] = $this->doctor_id;
        $json['name'] = $this->name;
        $json['health_issue'] = $this->health_issue;
        $json['reschedule_reason'] = $this->reschedule_reason;
        $json['cancel_reason'] = $this->cancel_reason;
        $json['documents'] = $this->getDocuments();
        $json['price'] = $this->final_price;
        $json['age'] = $this->age;
        $json['gender'] = $this->gender;
        $json['date'] = $this->date;
        $json['discount'] = $this->discount;
        $json['final_price'] = $this->final_price;
        $json['time'] = $this->time;
        $json['type_id'] = $this->type_id;
        $json['state_id'] = $this->state_id;
        $json['created_on'] = $this->created_on;
        $json['created_by'] = $this->createdBy->asJson();
        $json['doctor'] = $this->doctor->asJson();
        $json['is_prior'] = $this->isPrior();
        $json['is_cancel'] = $this->isCancel();
        $json['patient_id'] = $this->patient_id;

        if (! empty($this->prescription_image)) {
            $json['prescription_image'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'user/download',
                'profile_file' => $this->prescription_image
            ]);
        } else {
            $json['prescription_image'] = '';
        }
        if ($with_relations) {
            
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
            
            
            $list = $this->availabilityTime;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['availabilityTime'] = $relationData;
            } else {
                $json['availabilityTime'] = $list;
            }
            
            
            //
            
            $list = $this->availabilityMode;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['availabilityMode'] = $relationData;
            } else {
                $json['availabilityMode'] = $list;
            }
            
            
            
            $list = $this->appointmentillnesses;

            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['appointmentillnesses'] = $relationData;
            } else {
                $json['appointmentillnesses'] = $list->asJson();
            }
        }
        return $json;
    }

    public function isCancel()
    {
        $date = date('Y-m-d');
        $DateTime = new \DateTime();
        $DateTime->modify('+2 hours');
        $date_compare = $DateTime->format("H:i:s");
        if ($date <= $this->date) {
            if (User::isDoctor() || $date < $this->date || ($date == $this->date && $date_compare < $this->time)) {
                return true;
            }
        }
        return false;
    }

    public function asAppointmentJson($with_relations = true)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['doctor_id'] = $this->doctor_id;
        $json['price'] = $this->final_price;
        $json['date'] = $this->date;
        $json['time'] = $this->time;
        $json['state_id'] = $this->state_id;
        $json['payment_method'] = $this->getPaymentMethod();
        if ($with_relations) {}
        return $json;
    }

    public function isPrior()
    {
        $date = date('Y-m-d');
        $time = date('H:i:s');
        $model = Appointment::find()->where([
            'id' => $this->id
        ])->one();

        if (! empty($model)) {

            if ($model->date <= $date && $model->time <= $time) {
                return true;
            }
        }
        return false;
    }

    public function getPaymentMethod()
    {
        if ($this->created_by_id == \Yii::$app->user->id) {
            $model = Transaction::find()->where([
                'model_id' => $this->id,
                'model_type' => get_class($this)
            ])->one();
        }

        return ! empty($model) ? $model->gateway_type : 0;
    }

    public static function MonthlyEarning($id)
    {
        $date = new \DateTime();
        $date->modify('-12  months');
        $last = $date;
        $dates = array();
        $count = array();
        for ($i = 1; $i <= 12; $i ++) {
            $date->modify('+1 months');
            $month = $date->format('Y-m');

            $count[$month] = (int) Appointment::find()->where([
                'like',
                'created_on',
                $month
            ])
                ->andWhere([
                'doctor_id' => $id,
                'payment_status' => Appointment::PAYMENT_STATUS_PAID
            ])
                ->sum('price');
        }

        return $count;
    }

    public static function DailyEarning($id)
    {
        $date = new \DateTime();
        $date->modify('-30 days');
        $last = $date;
        $dates = array();
        $count = array();
        for ($i = 1; $i <= 30; $i ++) {
            $date->modify('+1 day');
            $month = $date->format('Y-m-d');

            $count[$month] = (int) Appointment::find()->where([
                'like',
                'created_on',
                $month
            ])
                ->andWhere([
                'doctor_id' => $id,
                'payment_status' => Appointment::PAYMENT_STATUS_PAID
            ])
                ->sum('price');
        }

        return $count;
    }
}
