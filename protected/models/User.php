<?php

/**
 * Company: ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * Author : Shiv Charan Panjeta < shiv@toxsl.com >
 */

/**
 * This is the model class for table "tbl_user".
 *
 * @property integer $id
 * @property string $full_name
 * @property string $email
 * @property string $password
 * @property string $date_of_birth
 * @property integer $gender
 * @property string $about_me
 * @property string $contact_no
 * @property string $address
 * @property string $latitude
 * @property string $longitude
 * @property string $city
 * @property string $country
 * @property string $zipcode
 * @property string $language
 * @property string $profile_file
 * @property integer $tos
 * @property integer $role_id
 * @property integer $state_id
 * @property integer $type_id
 * @property string $last_visit_time
 * @property string $last_action_time
 * @property string $last_password_change
 * @property integer $login_error_count
 * @property string $activation_key
 * @property string $timezone
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id === Related data ===
 * @property LoginHistory[] $loginHistories
 */
namespace app\models;

use Twilio\Rest\Client;
use app\modules\api2\models\DeviceDetail;
use app\modules\notification\models\Notification;
use app\modules\rating\models\Rating;
use app\models\PatientHealthProfile;
use app\models\DoctorLanguage;
use app\models\PatientAllergies;
use app\models\PatientMedicineHistory;
use app\models\PatientIllness;
use Yii;
use yii\web\NotFoundHttpException;

class User extends \app\components\TActiveRecord implements \yii\web\IdentityInterface
{

    public $search;

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_BANNED = 2;

    const STATE_ACCEPT = 3;

    const STATE_REJECT = 4;

    const STATE_DELETED = 5;

    const IS_CHECKED = 1;

    const IS_NOTCHECKED = 0;

    const MALE = 0;

    const FEMALE = 1;

    const ROLE_ADMIN = 0;

    const ROLE_MANAGER = 1;

    const ROLE_USER = 2;

    const ROLE_DOCTOR = 3;

    const ROLE_PATIENT = 4;

    const ROLE_APPOINTMENT = 5;

    const TYPE_ON = 0;

    const TYPE_OFF = 1;

    const EMAIL_NOT_VERIFIED = 0;

    const EMAIL_VERIFIED = 1;

    const USER_EXISTS = 1;

    const USER_SIGNUP = 2;

    const LOGIN_STATE = 1;

    const SIGNUP_STATE = 2;

    const OTP_NOT_MATCH = 1;

    const OTP_VERIFIED = 1;

    const OTP_NOT_VERIFIED = 2;

    public $confirm_password;

    public $newPassword;

    public $oldPassword;

    const NOTIFICATION_ON = 1;

    const NOTIFICATION_OFF = 0;

    const EMAIL_ON = 1;

    const EMAIL_OFF = 0;

    public static function getGenderOptions($id = null)
    {
        $list = array(
            self::MALE => \Yii::t('app', "Male"),
            self::FEMALE => \Yii::t('app', "Female")
        );
        if ($id === null)
            return $list;
        return isset($list[$id]) ? $list[$id] : 'Not Defined';
    }

    public static function getRoleOptions($id = null)
    {
        $list = array(
            self::ROLE_ADMIN => \Yii::t('app', "Admin"),
            self::ROLE_DOCTOR => \Yii::t('app', "Doctor"),
            self::ROLE_PATIENT => \Yii::t('app', "Patient")
        );
        if ($id === null)
            return $list;
        return isset($list[$id]) ? $list[$id] : 'Not Defined';
    }

    public function __toString()
    {
        return (string) $this->full_name;
    }

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => "Inactive",
            self::STATE_ACTIVE => "Active",
            self::STATE_ACCEPT => "Accept",
            self::STATE_REJECT => "Reject"
        ];
    }

    public function getState()
    {
        $list = self::getStateOptions();
        return isset($list[$this->state_id]) ? $list[$this->state_id] : 'Not Defined';
    }

    public function getGender()
    {
        $list = self::getGenderOptions();
        return isset($list[$this->gender]) ? $list[$this->gender] : 'Not Defined';
    }

    public function getStateBadge()
    {
        $list = [
            self::STATE_INACTIVE => "default",
            self::STATE_ACTIVE => "success",
            self::STATE_ACCEPT => "primary",
            self::STATE_REJECT => "danger"
        ];
        // return isset($list[$this->state_id])?\yii\helpers\Html::tag('span', $this->getState(), ['class' => 'badge bg-' . $list[$this->state_id]]):'Not Defined';
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : 'Not Defined';
    }

    public static function getTypeOptions()
    {
        return [
            "yes",
            "no"
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
            $this->generateAccessToken();
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
        return '{{%user}}';
    }

    /**
     *
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'full_name' => Yii::t('app', 'Full Name'),
            'first_name' => Yii::t('app', 'First Name'),
            'last_name' => Yii::t('app', 'Last Name'),
            'email' => Yii::t('app', 'Email'),
            'password' => Yii::t('app', 'Password'),
            'date_of_birth' => Yii::t('app', 'Date Of Birth'),
            'gender' => Yii::t('app', 'Gender'),
            'about_me' => Yii::t('app', 'About Me'),
            'contact_no' => Yii::t('app', 'Contact No'),
            'address' => Yii::t('app', 'Address'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude'),
            'city' => Yii::t('app', 'City'),
            'country' => Yii::t('app', 'Country'),
            'zipcode' => Yii::t('app', 'Zipcode'),
            'language' => Yii::t('app', 'Language'),
            'qualification' => Yii::t('app', 'Qualification'),
            'specialization' => Yii::t('app', 'Specialization'),
            'profile_file' => Yii::t('app', 'Profile File'),
            'tos' => Yii::t('app', 'Tos'),
            'role_id' => Yii::t('app', 'Role'),
            'state_id' => Yii::t('app', 'State'),
            'type_id' => Yii::t('app', 'Type'),
            'last_visit_time' => Yii::t('app', 'Last Visit Time'),
            'last_action_time' => Yii::t('app', 'Last Action Time'),
            'last_password_change' => Yii::t('app', 'Last Password Change'),
            'login_error_count' => Yii::t('app', 'Login Error Count'),
            'activation_key' => Yii::t('app', 'Activation Key'),
            'timezone' => Yii::t('app', 'Timezone'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Created By')
        ];
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLoginHistories()
    {
        return $this->hasMany(LoginHistory::className(), [
            'user_id' => 'id'
        ]);
    }

    public function getAuthSessions()
    {
        return $this->hasMany(DeviceDetail::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getDoctorAppointment()
    {
        return $this->hasMany(Appointment::className(), [
            'doctor_id' => 'id'
        ])->andWhere([
            'payment_status' => Appointment::PAYMENT_STATUS_PAID
        ]);
    }

    public function getPatientAppointment()
    {
        return $this->hasMany(Appointment::className(), [
            'created_by_id' => 'id'
        ])->andWhere([
            'payment_status' => Appointment::PAYMENT_STATUS_PAID
        ]);
    }

    public function getUserPlan()
    {
        return $this->hasOne(SubscribedUsers::className(), [
            'created_by_id' => 'id'
        ])->andWhere([
            'state_id' => User::STATE_ACTIVE
        ]);
    }

    public function beforeSave($insert)
    {
        if (! parent::beforeSave($insert)) {
            return false;
        }

        if ($this->state_id != User::STATE_ACTIVE) {
            $this->generateAuthKey();
        }
        return true;
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPages()
    {
        return $this->hasMany(Page::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getAvailabilityTime()
    {
        return $this->hasMany(AvailabilityTime::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public static function getHasManyRelations()
    {
        $relations = [];
        $relations['created_by_id'] = [
            'templates',
            'Template',
            'id'
        ];
        $relations['user_id'] = [
            'loginHistories',
            'LoginHistory',
            'id'
        ];
        $relations['doctor_id'] = [
            'doctorAppointment',
            'DoctorAppointment',
            'id'
        ];
        $relations['created_by_id'] = [
            'patientAppointment',
            'PatientAppointment',
            'id'
        ];

        $relations['created_by_id'] = [
            'availabilityTime',
            'AvailabilityTime',
            'id'
        ];

        return $relations;
    }

    public static function generateOtp()
    {
        return mt_rand(10000, 99999);
    }

    public static function getHasOneRelations()
    {
        $relations = [];
        return $relations;
    }

    public function getLoginUrl()
    {
        return Yii::$app->urlManager->createAbsoluteUrl([
            'user/login'
        ]);
    }

    public function getVerified()
    {
        return Yii::$app->urlManager->createAbsoluteUrl([
            'user/confirm-email',
            'id' => $this->activation_key
        ]);
    }

    public function sendVerificationMailtoUser()
    {
        $sub = "Welcome! You new account is ready " . \Yii::$app->params['company'];
        $to = $this->email;
        $message = \yii::$app->view->renderFile('@app/mail/verification.php', [
            'user' => $this
        ]);
        $admin = self::find()->where([
            'role_id' => self::ROLE_ADMIN
        ])->one();
        if (! empty($admin)) {
            $from = $admin->email;
            EmailQueue::sendEmailToAdmins([
                'from' => $from,
                'subject' => $sub,
                'html' => $message
            ], true);
        }
    }

    public function sendMessage($model, $contact_no, $message)
    {
        $data = [];

        $setting = \Yii::$app->settings->twilio->config;

        if (! empty($setting)) {

            $final_number = $contact_no;

            $sid = \Yii::$app->settings->twilio->config->sid;
            $token = \Yii::$app->settings->twilio->config->token;
            $from = \Yii::$app->settings->twilio->config->from_number;

            try {
                $client = new Client($sid, $token);

                // Use the client to do fun stuff like send text messages!
                $result = $client->messages->create(
                    // the number you'd like to send the message to
                    $final_number, array(
                        // A Twilio phone number you purchased at twilio.com/console
                        'from' => $from,
                        // the body of the text message you'd like to send
                        'body' => $message
                    ));
            } catch (\Exception $e) {
                $data['error'] = $e->getMessage();
            }
        } else {
            $data['error'] = \Yii::t('app', 'Twilio settings not found');
        }

        return $data;
    }

    public function sendEmail()
    {
        return EmailQueue::add([
            'to' => $this->email,
            'subject' => "Recover Your Account at: " . \Yii::$app->params['company'],
            'view' => 'passwordResetToken',
            'viewArgs' => [
                'user' => $this
            ]
        ], true);
    }

    public function sendRegistrationMailtoUser($model)
    {
        $email = $model->email;
        $sub = "Welcome! Your new account is ready " . \Yii::$app->params['company'];
        EmailQueue::add([
            'to' => $email,
            'from' => \Yii::$app->params['adminEmail'],
            'subject' => $sub,
            'view' => 'verification',
            'viewArgs' => [
                'user' => $model
            ]
        ], true);
    }

    public function sendConfirmEmailToUser()
    {
        $email = $this->email;
        $view = 'sendPassword';
        $sub = "Welcome! Your new account is Activated " . \Yii::$app->params['company'];
        EmailQueue::add([
            'to' => $email,
            'from' => \Yii::$app->params['adminEmail'],
            'subject' => $sub,
            'view' => 'verify',
            'viewArgs' => [
                'user' => $this
            ]
        ], true);
    }

    public function sendRegistrationMailtoAdmin()
    {
        $sub = 'New User Registerd Successfully';
        $from = \Yii::$app->params['adminEmail'];

        EmailQueue::sendEmailToAdmins([
            'from' => $from,
            'subject' => $sub,
            'view' => 'verification',
            'viewArgs' => [
                'user' => $this
            ]
        ], true);
    }

    public function beforeDelete()
    {
        if ($this->id == \Yii::$app->user->id)
            return false;

        // if (class_exists("app\modules\api\models\AuthSession")) {
        // app\modules\api\models\AuthSession::deleteRelatedAll([
        // 'created_by_id' => $this->id
        // ]);
        // }
        Page::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        DeviceDetail::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Feedback::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Feedback::deleteRelatedAll([
            'user_id' => $this->id
        ]);
        AvailabilityTime::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        DoctorAvailability::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Notice::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Questions::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Userspeciality::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Appointment::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Appointment::deleteRelatedAll([
            'doctor_id' => $this->id
        ]);
        AppointmentPlans::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        AppointmentPlans::deleteRelatedAll([
            'doctor_id' => $this->id
        ]);
        Questionanswer::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        SubscribedUsers::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        SubscribedUsers::deleteRelatedAll([
            'doctor_id' => $this->id
        ]);
        Appointmentillness::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Otp::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        Favorite::deleteRelatedAll([
            'doctor_id' => $this->id
        ]);
        Notification::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Notification::deleteRelatedAll([
            'to_user_id' => $this->id
        ]);
        Favorite::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Promocode::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Promocode::deleteRelatedAll([
            'patient_id' => $this->id
        ]);
        Favorite::deleteRelatedAll([
            'doctor_id' => $this->id
        ]);

        PatientMedicalInformation::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        Patientsymptom::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        UserWallet::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        WalletHistory::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        Doctorspecialization::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        Workprofile::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        Rating::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        CategoryQuestion::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        CategoryAnswer::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);

        PatientHealthProfile::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        PatientAllergies::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        PatientMedicineHistory::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        PatientIllness::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        
        DoctorConsultationAvailability::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        DoctorConsultationAvailability::deleteRelatedAll([
            'user_id' => $this->id
        ]);
        
        DoctorLanguage::deleteRelatedAll([
            'created_by_id' => $this->id
        ]);
        
        return parent::beforeDelete();
    }

    public function scenarios()
    {
        $scenarios = parent::scenarios();

        $scenarios['register'] = [
            'full_name',
            'email',
            'confirm_password',
            'password'
        ];

        $scenarios['add-admin'] = [
            'full_name',
            'email',
            'confirm_password',
            'activation_key',
            'role_id',
            'state_id',
            'created_on',
            'password'
        ];

        $scenarios['update'] = [
            'full_name',
            'email',
            'password',
            'contact_no',
            'profile_file',
            'role_id',
            'state_id'
        ];

        $scenarios['update-app'] = [
            'full_name',
            'email',
            'age',
            'language',
            'gender',
            'qualification',
            'specialization',
            'about_me'
        ];

        $scenarios['add'] = [
            'first_name',
            'last_name',
            'email',
            'password',
            'role_id',
            'state_id'
        ];

        $scenarios['user-signup'] = [
            'contact_no',
            'language',
            'otp',
            'password'
        ];

        $scenarios['signup'] = [
            'first_name',
            'last_name',
            'email',
            'password',
            'contact_no',
            'confirm_password',
            'gender',
            'date_of_birth'
        ];

        $scenarios['app-signup'] = [
            'first_name',
            'last_name',
            'email',
            'password',
            'contact_no',
            'current_place_of_work'
        ];
        $scenarios['changepassword'] = [
            'newPassword',
            'last_password_change',
            'activation_key'
        ];
        $scenarios['api-changepassword'] = [
            'newPassword'
        ];
        $scenarios['resetpassword'] = [
            'password',
            'confirm_password',
            'last_password_change',
            'activation_key'
        ];

        $scenarios['token_request'] = [
            'contact_no'
        ];
        $scenarios['reset_password'] = [
            'email'
        ];

        return $scenarios;
    }

    /**
     *
     * @inheritdoc
     */
    /**
     *
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    // 'full_name',
                    // 'email',
                    // 'password',
                    'role_id',

                    'state_id',
                    'created_on'
                ],
                'required'
            ],
            [
                [
                    'email',
                    'password',
                    'confirm_password',
                    'full_name'
                ],
                'required',
                'on' => 'add-admin'
            ],
            [
                [
                    'email'
                ],
                'required',
                'on' => 'token_request'
            ],
            [
                [
                    'email'
                ],
                'unique'
            ],
            [
                [
                    'newPassword',
                    'confirm_password'
                ],
                'required',
                'on' => 'changepassword'
            ],
            [
                [
                    'newPassword'
                ],
                'required',
                'on' => 'api-changepassword'
            ],
            [
                [
                    // 'full_name',
                    'email',
                    'password',
                    'contact_no',
                    'confirm_password',
                    'date_of_birth',
                    'country',
                    'address',
                    'gender',
                    'profile_file',
                    'first_name',
                    'last_name'
                ],
                'required',
                'on' => 'signup'
            ],
            [
                [
                    'email',
                    'password',
                    'contact_no',
                    'confirm_password',
                    'date_of_birth',
                    'country',
                    'address',
                    'gender',
                    'profile_file',
                    'first_name',
                    'last_name'
                ],
                'required',
                'on' => 'app-signup'
            ],
            [
                [
                    'email'
                ],
                'required',
                'on' => 'reset_password'
            ],
            [
                'confirm_password',
                'compare',
                'compareAttribute' => 'password',
                'message' => "Passwords don't match",
                'on' => [
                    'signup'
                ]
            ],
            [
                'confirm_password',
                'compare',
                'compareAttribute' => 'newPassword',
                'message' => "Passwords don't match",
                'on' => [
                    'changepassword'
                ]
            ],
            [
                'confirm_password',
                'compare',
                'compareAttribute' => 'password',
                'message' => "Passwords don't match",
                'on' => [
                    'resetpassword'
                ]
            ],
            [
                [
                    'password',
                    'confirm_password'
                ],
                'required',
                'on' => 'resetpassword'
            ],
            [
                [
                    'password',
                    'newPassword'
                ],
                'app\components\validators\TPasswordValidator'
            ],

            [

                'email',
                'email'
            ],

            [
                [
                    'search',
                    'first_name',
                    'last_name',
                    'date_of_birth',
                    'last_visit_time',
                    'last_action_time',
                    'last_password_change',
                    'created_on',
                    'language',
                    'contact_no',
                    'confirm_password',
                    'updated_on',
                    'speciality',
                    'current_place_of_work'
                ],
                'safe'
            ],
            [
                [
                    'gender',
                    'tos',
                    'role_id',
                    'email_verified',
                    'state_id',
                    'age',
                    'type_id',
                    'login_error_count',
                    'created_by_id',
                    'notification_settings',
                    'email_settings'
                ],
                'integer'
            ],
            [
                [
                    'full_name',
                    'first_name',
                    'last_name',
                    'full_name',
                    'email',
                    'about_me',
                    'contact_no',
                    'city',
                    'country',
                    'zipcode',
                    'language',
                    'speciality',
                    'timezone',
                    'qualification',
                    'specialization'
                ],
                'string',
                'max' => 255
            ],
            [
                [
                    'newPassword'
                ],
                'string',
                'min' => 6,
                'on' => 'api-changepassword'
            ],
            [
                [
                    'full_name',
                    'last_name',
                    'first_name',
                    'email',
                    'about_me',
                    'contact_no',
                    'city',
                    'age',
                    'country',
                    'zipcode',
                    'language',
                    'timezone',
                    'access_token',
                    'activation_key',
                    'address',
                    'latitude',
                    'longitude'
                ],
                'trim'
            ],
            [
                [
                    'password',
                    'activation_key'
                ],
                'string',
                'max' => 128
            ],
            [
                [
                    'address',
                    'latitude',
                    'longitude'
                ],
                'string',
                'max' => 512
            ]
        ];
    }

    public function getNotificationCount()
    {
        $count = Notification::find()->where([
            'to_user_id' => $this->id,
            'is_read' => Notification::IS_NOT_READ,
            'type_id' => CallLog::TYPE_APPOINTMENT
        ])->count();

        return $count;
    }

    public function isMember()
    {
        $model = SubscribedUsers::find()->where([
            'doctor_id' => $this->id,
            'created_by_id' => \Yii::$app->user->id,
            'type_id' => SubscribedUsers::TYPE_PATIENT,
            'payment_status' => SubscribedUsers::PAYMENT_STATUS_PAID,
            'state_id' => SubscribedUsers::STATE_ACTIVE
        ])->one();

        return ! empty($model) ? true : false;
    }

    public function getMedicalInformation()
    {
        return $this->hasOne(PatientMedicalInformation::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getWorkInformation()
    {
        return $this->hasOne(Workprofile::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getSymptoms()
    {
        return $this->hasMany(Patientsymptom::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getSpecializations()
    {
        return $this->hasMany(Doctorspecialization::className(), [
            'created_by_id' => 'id'
        ]);
    }

    public function getFavouriteStatus()
    {
        $favourite = Favorite::find()->where([
            'doctor_id' => $this->id,
            'created_by_id' => \Yii::$app->user->id
        ])->one();
        if (! empty($favourite)) {
            return true;
        }
        return false;
    }

    public function getHealthProfile()
    {
        $healthProfile = PatientHealthProfile::find()->where([
            'created_by_id' => \Yii::$app->user->id
        ])->one();
        if (! empty($healthProfile)) {
            return $healthProfile->step_count;
        }
        return null;
    }

    public function getRatingStatus()
    {
        $rating = Rating::find()->where([
            'model_id' => $this->id,
            'model_type' => User::className()
        ])
            ->andWhere([
            'created_by_id' => \Yii::$app->user->id
        ])
            ->one();
        if (! empty($rating)) {
            return true;
        }
        return false;
    }

    public function getMyLanguages($id)
    {
        $languagesArr = [];

        $model = DoctorLanguage::find()->select('language_id')
            ->where([
            'created_by_id' => $this->id
        ])
            ->column();

        $languages = LanguageList::find()->where([
            'IN',
            'id',
            $model
        ])->each();

        foreach ($languages as $language) {
            $languagesArr[] = $language->asJson();
        }

        return $languagesArr;
    }
    
    
    public function getAllsymptoms()
    {
        $symptomsArray = [];
        $symptoms = Patientsymptom::find()->where([
            'created_by_id' => 'id'
        ]);
        
        foreach($symptoms->each() as $data){
            $symptomsArray[] = $data->asJson();
        }
        
        return $symptomsArray;
    }
    
    
    public function getAllSpecializations()
    {
        $symptomsArray = [];
        $symptoms = Doctorspecialization::find()->where([
            'created_by_id' => 'id'
        ]);
        
        foreach($symptoms->each() as $data){
            $symptomsArray[] = $data->asJson();
        }

        return $symptomsArray;
        
    }

    public function getRatingCount($count = false)
    {
        if ($count == true) {
            $model = Rating::find()->where([
                'model_id' => $this->id,
                'model_type' => User::className()
            ])->count();

            return (int) $model;
        }
        $model = Rating::find()->where([
            'model_id' => $this->id,
            'model_type' => User::className()
        ])->average('rating');

        return (int) $model;
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['first_name'] = $this->first_name;
        $json['last_name'] = $this->last_name;
        $json['full_name'] = $this->fullName;
        $json['email'] = $this->email;
        $json['gender'] = $this->gender;
        $json['age'] = $this->age;
        $json['date_of_birth'] = $this->date_of_birth;
        $json['speciality'] = $this->getspeciality();
        $json['qualification'] = ! empty($this->qualification) ? $this->qualification : '';
        $json['specialization'] = ! empty($this->specialization) ? $this->specialization : '';
        if (! User::isGuest()) {
            if ($this->role_id == User::ROLE_DOCTOR && \Yii::$app->user->identity->role_id == User::ROLE_PATIENT) {
                $json['is_member'] = $this->isMember();
            }
        }

        $json['files'] = $this->fileimage($this);

        $json['about_me'] = $this->about_me;
        $json['contact_no'] = $this->contact_no;
        $json['city'] = $this->city;
        $json['country'] = $this->country;
        $json['address'] = $this->address;
        $json['zipcode'] = $this->zipcode;
        $json['language'] = $this->language;
        if (! empty($this->profile_file)) {
            $json['profile_file'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'user/download',
                'profile_file' => $this->profile_file
            ]);
        } else {
            $json['profile_file'] = \Yii::$app->urlManager->createAbsoluteUrl('themes/base/img/default.jpeg');
        }
        if (User::isPatient()) {
            $json['is_favourite'] = $this->isFavourite();
        }

        $json['state_id'] = $this->state_id;
        $json['availability'] = $this->getavailability();

        $json['reviews'] = $this->getreviews();

        $json['rating'] = $this->getRatings();

        $json['notification_count'] = $this->getNotificationCount();

        $json['notification_settings'] = $this->notification_settings;
        $json['email_settings'] = $this->email_settings;
        $json['created_by_id'] = $this->created_by_id;
        $json['current_place_of_work'] = $this->current_place_of_work;
        $json['plan_id'] = ! empty($this->userPlan) ? $this->userPlan->plan_id : 0;
        $json['language'] = $this->getMyLanguages($this->id);
        $json['is_plan'] = $this->getIsMember();
        if ($this->role_id == self::ROLE_PATIENT) {
            $json['medicalInfomration'] = $this->medicalInformation->asJson();
            $json['health_profile_step'] = $this->healthProfile;
            $json['symptoms'] = $this->getAllsymptoms() ; 
        } elseif ($this->role_id == self::ROLE_DOCTOR) {
            $json['is_rated'] = $this->ratingStatus;
            $json['is_liked'] = $this->favouriteStatus;
            $json['average_rating'] = $this->getRatingCount();
           // $json['workInformation'] = $this->workInformation->asJson();
            
            $json['specializations'] = $this->getAllSpecializations();
            
            $list = $this->workInformation;
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['workInformation'] = $relationData;
            } else {
                $json['workInformation'] = $list;
            }
        }
        if ($with_relations) {}
        return $json;
    }

    /**
     * ionV
     *
     * @inheritdoc
     */
    public function getavailability()
    {
        $list = [];
        $subquery = Appointment::find()->select('availability_time_id')
            ->where([
            'doctor_id' => $this->id,
            'payment_status' => Appointment::PAYMENT_STATUS_PAID
        ])
            ->column();

        $times = AvailabilityTime::find()->select('doctor_availability_id')
            ->where([
            'NOT IN',
            'id',
            $subquery
        ])
            ->distinct('doctor_availability_id')
            ->column();

        $availabilities = DoctorAvailability::find()->where([
            'created_by_id' => $this->id
        ])
            ->andWhere([
            'IN',
            'id',
            $times
        ])
            ->
        // ->groupBy('date')
        orderBy('date ASC');

        if (! empty($availabilities)) {
            foreach ($availabilities->each() as $availability) {
                if ($availability->date >= date('Y-m-d')) {
                    $list[] = $availability->asJson();
                }
            }
        }
        return ! empty($list) ? $list : null;
    }

    public function getIsMember()
    {
        $model = SubscribedUsers::find()->where([
            'created_by_id' => \Yii::$app->user->id,
            'doctor_id' => $this->id,
            'type_id' => SubscribedUsers::TYPE_PATIENT,
            'payment_status' => SubscribedUsers::PAYMENT_STATUS_PAID,
            'state_id' => SubscribedUsers::STATE_ACTIVE
        ])->one();
        if (! empty($model)) {
            return ! empty($model->patientPlan) ? $model->patientPlan->asJson() : (object) [];
        }
        return (object) [];
    }

    public function isFavourite()
    {
        $favourite = Favorite::find()->where([
            'doctor_id' => $this->id,
            'created_by_id' => \Yii::$app->user->id
        ])->one();

        return ! empty($favourite) ? TRUE : FALSE;
    }

    public function fileImage($model)
    {
        $list = [];
        $models = File::find()->where([
            'model_id' => $model->id,
            'model_type' => get_class($this)
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
                }
                $list[] = $data;
            }
        }

        return $list;
    }

    public function getspeciality()
    {
        $list = [];
        $specialities = Userspeciality::find()->where([
            'created_by_id' => $this->id
        ]);

        if (! empty($specialities)) {
            foreach ($specialities->each() as $speciality) {
                $category = Category::findOne($speciality->speciality_id);
                if (! empty($category)) {
                    $list[] = $category->asJson();
                }
            }
        }
        return ! empty($list) ? $list : null;
    }

    public function getappointment()
    {
        $list = [];
        $specialities = Appointment::find()->where([
            'created_by_id' => $this->id
        ])->all();

        if (! empty($specialities)) {
            foreach ($specialities as $speciality) {
                $list[] = $speciality->asJson();
            }
            return $list;
        }
        return $list;
    }

    public function getreviews()
    {
        $list = [];
        $feedback = Feedback::find()->where([
            'user_id' => $this->id
        ])->all();

        if (! empty($feedback)) {

            return $feedback;
        }
        return $list;
    }

    public function getratings()
    {
        $list = [];
        $feedbacks = Feedback::find()->where([
            'user_id' => $this->id
        ]);
        $total = $feedbacks->sum('rating');
        $count = $feedbacks->count();
        if (! empty($count))
            $rating = $total / $count;

        return ! empty($rating) ? $rating : 0;
    }

    public static function findIdentity($id)
    {
        return static::findOne([
            'id' => $id,
            'state_id' => [
                self::STATE_ACTIVE
            ]
        ]);
    }

    public function extractname($full_name)
    {
        $firstname = strtok($full_name, ' ');
        return $firstname;
    }

    /**
     *
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne([
            'access_token' => $token
        ]);
    }

    public static function encrypt($plainText, $key)
    {
        $secretKey = self::hextobin(md5($key));
        $initVector = pack("C*", 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f);
        $openMode = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', 'cbc', '');
        $blockSize = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, 'cbc');
        $plainPad = self::pkcs5_pad($plainText, $blockSize);
        if (mcrypt_generic_init($openMode, $secretKey, $initVector) != - 1) {
            $encryptedText = mcrypt_generic($openMode, $plainPad);
            mcrypt_generic_deinit($openMode);
        }
        return bin2hex($encryptedText);
    }

    public static function decrypt($encryptedText, $key)
    {
        $secretKey = self::hextobin(md5($key));
        $initVector = pack("C*", 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f);
        $encryptedText = self::hextobin($encryptedText);

        $openMode = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', 'cbc', '');

        mcrypt_generic_init($openMode, $secretKey, $initVector);
        $decryptedText = mdecrypt_generic($openMode, $encryptedText);

        $decryptedText = rtrim($decryptedText, "\0");
        mcrypt_generic_deinit($openMode);
        return $decryptedText;
    }

    public static function decryptIOS($encryptedText, $key)
    {
        $secretKey = self::hextobin(md5($key));
        $initVector = pack("C*", 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f);
        $encryptedText = self::hextobin($encryptedText);

        $openMode = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', 'cbc', '');
        mcrypt_generic_init($openMode, $secretKey, $initVector);
        $decryptedText = mdecrypt_generic($openMode, $encryptedText);

        print_r($decryptedText);

        $decryptedText = rtrim($decryptedText, "\0");
        mcrypt_generic_deinit($openMode);
        return $decryptedText;
    }

    // *********** Padding Function *********************
    public static function pkcs5_pad($plainText, $blockSize)
    {
        $pad = $blockSize - (strlen($plainText) % $blockSize);
        return $plainText . str_repeat(chr($pad), $pad);
    }

    // ********** Hexadecimal to Binary function for php 4.0 version ********
    public static function hextobin($hexString)
    {
        $length = strlen($hexString);
        $binString = "";
        $count = 0;
        while ($count < $length) {
            $subString = substr($hexString, $count, 2);
            $packedString = pack("H*", $subString);
            if ($count == 0) {
                $binString = $packedString;
            } else {
                $binString .= $packedString;
            }

            $count += 2;
        }
        return $binString;
    }

    /**
     * Finds user by email
     *
     * @param string $email
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne([
            'email' => $username
        ]);
    }

    public static function findByContactno($username)
    {
        return static::findOne([
            'contact_no' => $username
        ]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token
     *            password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (! static::isPasswordResetTokenValid($token)) {
            return null;
        }
        return static::findOne([
            'activation_key' => $token,
            'state_id' => self::STATE_ACTIVE
        ]);
    }

    public static function randomPassword($count = 8)
    {
        $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
        $alphabet = "abcdefghijklmnopqrstuwxyz0123456789";
        $pass = [];
        $alphaLength = strlen($alphabet) - 1;
        for ($i = 0; $i < $count; $i ++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token
     *            password reset token
     * @return boolean
     */
    public function getResetUrl()
    {
        return Yii::$app->urlManager->createAbsoluteUrl([
            'user/resetpassword',
            'token' => $this->activation_key
        ]);
    }

    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        $parts = explode('_', $token);
        $timestamp = (int) end($parts);
        return $timestamp + $expire >= time();
    }

    /**
     *
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     *
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->activation_key;
    }

    /**
     *
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = $this->hashPassword($password);
    }

    public function hashPassword($password)
    {
        $password = utf8_encode(Yii::$app->security->generatePasswordHash(yii::$app->name . $password));
        return $password;
    }

    /**
     * Validates password
     *
     * @param string $password
     *            password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        if (defined('DISABLED_PASSWORD_MATCH')) {
            return true;
        }

        if (defined('ALLOW_PASSWORD_CONVERT')) {
            if (strlen($this->password) == 32) {
                $match = ($this->password == md5($password));
                if ($match) {
                    $this->setPassword($password);
                    $this->save(false, [
                        'password'
                    ]);
                    return true;
                }
                return false;
            }
        }

        return Yii::$app->security->validatePassword(yii::$app->name . $password, utf8_decode($this->password));
    }

    /**
     * convert normal password to hash password before saving it to database
     */

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->activation_key = Yii::$app->security->generateRandomString();
    }

    public function generateAccessToken()
    {
        $this->access_token = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->activation_key = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->activation_key = null;
    }

    public static function isUser()
    {
        $user = Yii::$app->user->identity;
        if ($user == null)
            return false;
        return ($user->isActive() && $user->role_id == User::ROLE_USER || self::isAdmin());
    }

    public static function isDoctor()
    {
        $user = Yii::$app->user->identity;
        if ($user == null)
            return false;
        return ($user->isActive() && $user->role_id == User::ROLE_DOCTOR || self::isAdmin());
    }

    public static function isPatient()
    {
        $user = Yii::$app->user->identity;
        if ($user == null)
            return false;
        return ($user->isActive() && $user->role_id == User::ROLE_PATIENT || self::isAdmin());
    }

    public static function isManager()
    {
        $user = Yii::$app->user->identity;
        if ($user == null)
            return false;

        return ($user->isActive() && $user->role_id == User::ROLE_MANAGER || self::isAdmin());
    }

    public static function isAdmin()
    {
        $user = Yii::$app->user->identity;
        if ($user == null)
            return false;

        return ($user->isActive() && $user->role_id == User::ROLE_ADMIN);
    }

    public static function isGuest()
    {
        if (Yii::$app->user->isGuest) {
            return true;
        }
        return false;
    }

    public function sendProfileImage()
    {
        $user = Yii::$app->user->identity;
        $image_path = UPLOAD_PATH . $user->profile_file;

        if (! isset($user->profile_file) || ! file_exists($image_path))
            throw new NotFoundHttpException(Yii::t('app', "File not found"));

        return \yii::$app->response->sendFile($image_path, $user->profile_file);
    }

    public static function getUserById($id)
    {
        $user = User::find()->where([
            'id' => $id
        ]);
        return $user;
    }

    public static function findByEmail($email)
    {
        return static::findOne([
            'email' => $email
        ]);
    }

    public function isActive()
    {
        return ($this->state_id == User::STATE_ACTIVE);
    }

    public function getProfileImage()
    {
        $user = Yii::$app->user->identity;
        $image_path = UPLOAD_PATH . $user->profile_file;

        if (! isset($user->profile_file) || ! file_exists($image_path))
            throw new NotFoundHttpException(Yii::t('app', "File not found"));

        return \yii::$app->response->sendFile($image_path, $user->profile_file);
    }

    public function createWallet()
    {
        $model = new UserWallet();
        $model->created_by_id = $this->id;
        $model->amount = 0;
        $model->state_id = UserWallet::STATE_ACTIVE;
        if ($model->save()) {

            return true;
        } else {
            print_r($model->getErrorsString());
            exit();
        }

        return false;
    }

    public function getFullName()
    {
        return ! empty($this->full_name) ? $this->full_name : $this->first_name . ' ' . $this->last_name;
    }

    public function setFullName()
    {
        $full_name = '';
        if (! empty($this->first_name) && ! empty($this->last_name)) {
            $full_name = $this->first_name . ' ' . $this->last_name;
        } elseif (! empty($this->full_name)) {
            $full_name = $this->full_name;
        }
        return $full_name;
    }
}