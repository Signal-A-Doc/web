<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\modules\api2\controllers;

use app\models\Appointment;
use app\models\CallLog;
use app\models\Favorite;
use app\models\Halogins;
use app\models\CategoryQuestion;
use app\models\SubCategory;
use app\models\DoctorConsultationAvailability;
use app\models\LoginForm;
use app\models\SubscribedUsers;
use app\models\User;
use app\models\Illness;
use app\models\Duration;
use app\models\PatientHealthProfile;
use app\models\PatientMedicineHistory;
use app\models\PatientAllergies;
use app\models\PatientIllness;
use app\modules\api2\components\ApiTxController;
use Yii;
use app\modules\api2\models\DeviceDetail;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use yii\web\UploadedFile;
use app\models\Category;
use yii\data\ActiveDataProvider;
use app\modules\api2\components\TPagination;
use app\modules\notification\models\Notification;
use app\models\PatientMedicalInformation;
use app\models\Patientsymptom;
use yii\db\Exception;
use app\modules\payment\models\Transaction;
use app\modules\rating\models\Rating;
use app\models\UserWallet;
use app\models\WalletHistory;
use app\models\Page;
use app\modules\file\models\File;
use app\models\Workprofile;
use app\models\Doctorprofessionalstatus;
use app\models\DoctorAvailability;
use app\models\AvailabilityTime;
use app\models\Doctorspecialization;
use app\models\LanguageList;
use app\models\DoctorLanguage;
use app\models\ConsultationAvailability;
use Mpdf\Tag\Select;

/**
 * UserController implements the API actions for User model.
 */
class UserController extends ApiTxController
{

    public function behaviors()
    {
        $unAuthorize = [
            'login',
            'patient-signup',
            'doctor-signup',
            'recover',
            'social-login',
            'category-list',
            'department-list',
            'professional-status-list',
            'about',
            'add-muliple-image',
            // 'doctor-list',
            'get-appointment',
            'get-time-slot',
            'language-list',
            'get-category',
            'medical-conditions',
            'time-option-list'
        ];

        $optional = [];

        $behaviors = parent::behaviors();
        $behaviors['authenticator']['optional'] = $optional;
        $behaviors['authenticator']['except'] = $unAuthorize;
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'ruleConfig' => [
                'class' => AccessRule::className()
            ],
            'rules' => [
                [
                    'actions' => [
                        'check',
                        'update',
                        'delete',
                        'logout',
                        'change-password',
                        'my-profile',
                        'add-document',
                        'list-document',
                        'favorite',
                        'add-doctor-rating',
                        'doctor-list',
                        'doctor-search',
                        'question-list',
                        'doctor-consultation-availability',
                        'doctor-consultation-mode',
                        'health-profile',
                        'get-doctor-dates',
                        'get-doctor-slots',
                        'add-booking',
                        'book-appointment',
                        'my-notifications',
                        'my-favourite-doctor-list'
                    ],
                    'allow' => true,
                    'matchCallback' => function () {
                        return User::isPatient();
                    }
                ],
                [
                    'actions' => [
                        'add-doctor-availability',
                        'doctor-signup',
                        'get-appointment',
                        'doctor-appointments',
                        'remove-certificate',
                        'doctor-consultation-mode',
                        'saving-doctor-availability',
                        'save-doctor-availability-dates',
                        'doctor-pending-appointments',
                        'upcoming-appointment',
                        'past-appointment',
                        'my-notifications'
                    ],
                    'allow' => true,
                    'matchCallback' => function () {
                        return User::isDoctor();
                    }
                ],

                [
                    'actions' => $optional,
                    'allow' => true,
                    'roles' => [
                        '?',
                        '*',
                        '@'
                    ]
                ],

                [
                    'actions' => $unAuthorize,
                    'allow' => true,
                    'roles' => [
                        '?',
                        '*'
                    ]
                ]
            ],
            'denyCallback' => function ($rule, $action) {
                throw new \yii\web\ForbiddenHttpException(\Yii::t('app', 'You are not allowed to access this page'));
            }
        ];

        return $behaviors;
    }

    protected function verbs()
    {
        $verbs = parent::verbs();
        $verbs['get'] = [
            'GET'
        ];
        return $verbs;
    }

    public function actionTestttt()
    {
        $data = [
            'dsadd' => 'sddf'
        ];
        $this->response = $data;
    }

    /**
     * Displays a single User model.
     *
     * @return mixed
     */
    public function actionGet($id)
    {
        $this->modelClass = "app\models\User";
        return $this->txget($id);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd()
    {
        $this->modelClass = "app\models\User";
        return $this->txSave();
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionUpdate()
    {
        $data = [];
        $id = \Yii::$app->user->id;
        $model = $this->findModel($id);
        $post = \Yii::$app->request->bodyParams;
        $patientMedicalInfo = PatientMedicalInformation::find()->where([
            'created_by_id' => $id
        ])->one();
        if ($model->load($post)) {
            if ($model->save()) {
                $this->setStatus(200);
                $data['detail'] = $model->asJson();
                $data['message'] = \Yii::t('app', 'Profile updated successfully');
            } else {
                $data['message'] = $model->getErrorsString();
            }
        } elseif ($patientMedicalInfo->load($post)) {
            $dbTransaction = \Yii::$app->db->beginTransaction();
            $patienSymptoms = Patientsymptom::find()->where([
                'created_by_id' => $id
            ]);

            if ($patientMedicalInfo->save()) {
                if (! empty($post['PatientSymptom']['categories'])) {
                    foreach ($patienSymptoms->each() as $symptom) {
                        $symptom->delete();
                    }
                    $categories = explode(',', $post['PatientSymptom']['categories']);
                    foreach ($categories as $category_id) {
                        $patientSymptons = new Patientsymptom();
                        $patientSymptons->category_id = $category_id;
                        $patientSymptons->created_by_id = $id;
                        if (! $patientSymptons->save()) {

                            $dbTransaction->rollBack();
                            $data['message'] = $patientSymptons->getErrorsString();
                            $this->response = $data;
                            return;
                        }
                    }
                }
                $this->setStatus(200);
                $dbTransaction->commit();
                $data['detail'] = $model->asJson();
                $data['message'] = \Yii::t('app', 'Medical Information successfully');
            } else {
                $data['message'] = $patientMedicalInfo->getErrorsString();
            }
        } else {
            $data['message'] = 'No Data Posted';
        }
        $this->response = $data;
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionUpdateProfile()
    {
        $data = [];
        $id = \Yii::$app->user->id;
        $model = $this->findModel($id);
        $old_file = ! empty($model->profile_file) ? $model->profile_file : '';
        $post = \Yii::$app->request->bodyParams;
        $workprofile = Workprofile::find()->where([
            'created_by_id' => $id
        ])->one();
        if ($model->load($post)) {
            if (! $model->saveUploadedFile($model, 'profile_file')) {
                $model->profile_file = $old_file;
            }
            $model->full_name = $model->setFullName();
            if ($model->save()) {
                $this->setStatus(200);
                $data['detail'] = $model->asJson();
                $data['message'] = \Yii::t('app', 'Profile updated successfully');
            } else {
                $data['message'] = $model->getErrorsString();
            }
        } elseif ($workprofile->load($post)) {
            $dbTransaction = \Yii::$app->db->beginTransaction();
            $specialiaztion = Doctorspecialization::find()->where([
                'created_by_id' => $id
            ]);
            $old_file = ! empty($workprofile->MDCN_certificate) ? $workprofile->professional_indemnity_certificate : '';
            $old_file = ! empty($workprofile->professional_indemnity_certificate) ? $workprofile->professional_indemnity_certificate : '';
            $workprofile->saveUploadedFile($workprofile, 'MDCN_certificate');
            $workprofile->saveUploadedFile($workprofile, 'professional_indemnity_certificate');
            if ($workprofile->save()) {
                if (! empty($post['Doctorspecialization']['categories'])) {
                    foreach ($specialiaztion->each() as $area) {
                        $area->delete();
                    }
                    $categories = explode(',', $post['Doctorspecialization']['categories']);
                    foreach ($categories as $category_id) {
                        $doctorspecialiaztion = new Doctorspecialization();
                        $doctorspecialiaztion->category_id = $category_id;
                        $doctorspecialiaztion->created_by_id = $id;
                        if (! $doctorspecialiaztion->save()) {

                            $dbTransaction->rollBack();
                            $data['message'] = $doctorspecialiaztion->getErrorsString();
                            $this->response = $data;
                            return;
                        }
                    }
                }
                $this->setStatus(200);
                $dbTransaction->commit();
                $data['detail'] = $model->asJson();
                $data['message'] = \Yii::t('app', 'Medical Information successfully');
            } else {
                $data['message'] = $workprofile->getErrorsString();
            }
        } else {
            $data['message'] = 'No Data Posted';
        }
        $this->response = $data;
    }

    public function actionSignup()
    {
        $data = [];
        $model = new User();

        if ($model->load(Yii::$app->request->post())) {
            $email_identify = User::findByUsername($model->email);
            if (empty($email_identify)) {
                $model->setPassword($model->password);
                if ($model->save()) {
                    $this->setStatus(200);
                    $data['detail'] = $model->asJson();
                } else {
                    $data['message'] = $model->getErrorsString();
                }
            } else {
                $data['message'] = \yii::t('app', "Email already exists.");
            }
        } else {
            $data['message'] = "Data not posted.";
        }
        $this->response = $data;
    }

    public function actionCheck()
    {
        $data = [];
        $deviceToken = DeviceDetail::find()->where([
            'created_by_id' => \Yii::$app->user->id
        ])->one();
        if (! empty($deviceToken)) {

            if ($deviceToken->load(Yii::$app->request->post())) {
                if ($deviceToken->save()) {
                    $model = User::findOne(\Yii::$app->user->id);
                    $data['detail'] = $model->asJson();
                    $this->setStatus(200);
                } else {
                    $data['message'] = $deviceToken->getErrorString;
                }
            } else {
                $data['message'] = \yii::t('app', "No data posted");
            }
        } else {
            $data['message'] = \yii::t('app', "No device token found");
        }

        $this->response = $data;
    }

    /**
     *
     * @return string|string[]|NULL[]
     */
    public function actionLogin()
    {
        $data = [];
        $model = new LoginForm();

        if ($model->load(Yii::$app->request->post())) {
            $user = User::findByUsername($model->username);
            if ($user) {

                /*
                 * if ($user->state_id == User::STATE_INACTIVE) {
                 * $data['error'] = \yii::t('app', 'Your account is not Active');
                 * } elseif ($user->email_verified == User::EMAIL_NOT_VERIFIED) {
                 * $data['error'] = \yii::t('app', 'Your email is not verfied. Please verify your email first');
                 * } else {
                 */
                if ($user->role_id == $model->role_id) {
                    if ($model->login(true)) {
                        $user->generateAccessToken();
                        $user->save(false, [
                            'access_token'
                        ]);
                        $this->setStatus(200);
                        $data['access-token'] = $user->access_token;
                        (new DeviceDetail())->appData($model);
                        $data['detail'] = $model->asJson();
                        $data['user_detail'] = $user->asJson();
                        $data['message'] = \Yii::t('app', 'Log in successfully');

                        $data['user_detail'] = $user->asJson();
                    } else {
                        $data['error'] = \yii::t('app', 'Incorrect Password');
                    }
                } else {
                    $data['error'] = \yii::t('app', 'You are not authorised to use this application.');
                }
                // }
                /*
                 * if ($model->login(true)) {
                 * $user->generateAccessToken();
                 * $user->save(false, [
                 * 'access_token'
                 * ]);
                 * $this->setStatus(200);
                 * $data['access-token'] = $user->access_token;
                 * (new DeviceDetail())->appData($model);
                 * $data['detail'] = $model->asJson();
                 * $data['user_detail'] = $user->asJson();
                 * $data['message'] = \Yii::t('app', 'Log in successfully');
                 * } else {
                 * $data['message'] = \Yii::t('app', $model->getErrorsString());
                 * }
                 */
            } else {
                $data['message'] = ' Incorrect Email';
            }
        } else {
            $data['message'] = "No data posted.";
        }
        $this->response = $data;
    }

    public function actionLogout()
    {
        $data = [];
        $user = \Yii::$app->user->identity;
        if (\Yii::$app->user->logout()) {
            $user->access_token = '';
            $user->save(false, [
                'access_token'
            ]);
            (new DeviceDetail())->deleteOldAppData($user->id);
            $this->setStatus(200);
        }

        $this->response = $data;
    }

    public function actionChangePassword()
    {
        $data = [];

        $model = User::findOne([
            'id' => \Yii::$app->user->identity->id
        ]);

        $newModel = new User([
            'scenario' => 'changepassword'
        ]);
        if ($newModel->load(Yii::$app->request->post()) && $newModel->validate()) {
            if ($model->validatePassword($newModel->oldPassword)) {
                $model->setPassword($newModel->newPassword);
                if ($model->save()) {
                    $this->setStatus(200);
                } else {
                    $data['message'] = 'Incorrect Password';
                }
            } else {
                $data['message'] = ' Old password is incorrect';
            }
        }
        $this->response = $data;
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        return $this->txDelete($id, "User");
    }

    /**
     * Social Login.
     *
     * @return mixed
     */
    public function actionSocialLogin()
    {
        $flag = false;
        $data = [];
        $params = \Yii::$app->request->getBodyParams();
        if (! empty($params['User'])) {
            $auth = Halogins::find()->where([
                'userId' => $params['User']['userId']
            ])->one();

            if (empty($auth)) { // not exist
                if ((! empty($params['User']['email']) && ! empty($params['User']['userId']))) {
                    $contact_no = $params['User']['contact_no'];
                    $email = $params['User']['email'];
                    $password = $params['User']['password'];
                    $address = $params['User']['address'];
                    $address_line = $params['User']['address_line'];
                    $firstname = $params['User']['first_name'];
                    $lastname = $params['User']['last_name'];
                    $username = $params['User']['username'];
                    $country = $params['User']['country'];
                    $zipcode = $params['User']['zipcode'];
                    $date_of_birth = $params['User']['date_of_birth'];
                    $state = $params['User']['state'];
                    $city = $params['User']['city'];
                    $id = $params['User']['userId'];
                    $provider = $params['User']['provider'];
                    $token = $params['LoginForm']['device_token'];
                    $type = $params['LoginForm']['device_type'];
                    $device_name = $params['LoginForm']['device_name'];
                    $email_identify = '';
                    $contact_identify = '';
                    $transaction = \Yii::$app->db->beginTransaction();
                    $email_identify = User::findByUsername($email);
                    $password = (new User())->hashPassword($id);
                    if (! empty($email_identify)) {
                        $user = $email_identify;
                    } else {
                        $user = new User([
                            'contact_no' => $contact_no,
                            'email' => $email,
                            'username' => $username,
                            'first_name' => $firstname,
                            'last_name' => $lastname,
                            'country' => $country,
                            'state' => $state,
                            'city' => $city,
                            'zipcode' => $zipcode,
                            'password' => $password,
                            'created_on' => date('Y-m-d H:i:s'),
                            'date_of_birth' => $date_of_birth,
                            'address' => $address,
                            'address_line' => $address_line,
                            'role_id' => User::ROLE_USER
                        ]);
                        if (! empty($params['img_url'])) {
                            $random = rand(0, 999) . 'dummy_img.png';
                            $user->profile_file = $random;
                            copy($params['img_url'], UPLOAD_PATH . $random);
                        }
                        $user->state_id = User::STATE_ACTIVE;
                    }
                    $user->generatePasswordResetToken();

                    $user->first_name = $firstname;
                    $user->last_name = $lastname;
                    if (! $user->save()) {

                        $data['message'] = $user->getErrorsString();
                        $data['customError'] = \Yii::t('app', "user entry");
                        return $this->response = $data;
                    } else {
                        $user->generateAccessToken();
                        $flag = true;
                    }
                    $auth = new Halogins([
                        'userId' => (string) $id,
                        'loginProvider' => $provider,
                        'loginProviderIdentifier' => md5($id),
                        'user_id' => $user->id
                    ]);
                    if (! $auth->save()) {
                        $data['customError'] = "auth entry";
                        $data['message'] = $auth->getErrorsString();
                        return $this->response = $data;
                    } else {
                        $flag = true;
                    }
                    $login_form = new LoginForm();
                    if (! $login_form->load(\Yii::$app->request->post())) {
                        $data['customError'] = \Yii::t('app', "post banned");
                        $data['message'] = \Yii::t('app', "Data required for login can not be blank");
                        return $this->response = $data;
                    } else {

                        $flag = true;
                    }
                    if ($flag) {

                        $transaction->commit();
                        $login_form->username = $username;
                        $login_form->password = $id;
                        if ($login_form->login()) {

                            (new DeviceDetail())->appData($login_form);
                            $data['access-token'] = $user->access_token;
                            $data['is_login'] = "0";
                            $this->setStatus(200);
                            $data['detail'] = $user->asJson();
                            $data['message'] = \yii::t('app', 'Signup');
                        }
                    } else {

                        $transaction->rollBack();
                    }
                } else {
                    $data['message'] = \yii::t('app', 'Please fill all the Details');
                    return $this->response = $data;
                }
            } else { // already exist
                $user_model = User::findOne([
                    'id' => $auth->user_id
                ]);
                if ($user_model->state_id == User::STATE_BANNED) {
                    $data['customError'] = \Yii::t('app', "banned");
                    $data['message'] = \Yii::t('app', 'Your account is blocked, Please contact Particulars Admin');
                    return $this->response = $data;
                }
                if ($user_model->state_id == User::STATE_INACTIVE) {
                    $data['customError'] = \Yii::t('app', "inactive");
                    $data['message'] = yii::t('app', 'Your account is not verified by admin');
                    $data['id'] = $user_model->id;
                    return $this->response = $data;
                }
                $user = $auth->user;
                if (empty($user_model)) {
                    $data['customError'] = \Yii::t('app', "not found");
                    $data['message'] = \Yii::t('app', "User not found");
                    return $this->response = $data;
                }
                $login_form = new LoginForm();
                $login_form->username = $user->email;
                $login_form->password = $user->password;
                if (! $login_form->load(\Yii::$app->request->post())) {
                    $data['customError'] = \Yii::t('app', "post banned");
                    $data['message'] = \Yii::t('app', "Data required for login can not be blank");
                    return $this->response = $data;
                }
                if (\Yii::$app->user->login($user, 3600 * 24 * 30)) {
                    $user_model->generateAccessToken();
                    if ($user_model->save()) {
                        (new DeviceDetail())->appData($login_form);
                        $data['is_login'] = "1";
                        $data['detail'] = $user_model->asJson();
                        $data['success'] = yii::t('app', 'Login Successfully');
                        $this->setStatus(200);
                        $data['access-token'] = $user_model->access_token;
                    }
                }
            }
        } else {
            $data['message'] = 'No data posted';
        }
        $this->response = $data;
    }

    public function actionCategoryList($page = null)
    {
        $query = Category::find()->where([
            'type_id' => Category::TYPE_SYMPTOMS,
            'state_id' => Category::STATE_ACTIVE
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionGetCategory($id=null,$page = null)
    {
       
       if(!empty($id))
       {
          $category = Category::findOne($id);
          if(!empty($category))
          {
             $subCategory = SubCategory::find()->where(['category_id'=>$id]);

            $dataProvider = new ActiveDataProvider([
                'query' => $subCategory,
                'pagination' => [
                    'page' => $page
                ]
            ]);
            $pagination = new TPagination();
            $pagination->params = [
                false
            ];
            $data = $pagination->serialize($dataProvider);
            $this->setStatus(200);

          }
          else{
              $data['message'] = Yii::t('app','Not found');
            }
       }
       else{
         $data['message'] = Yii::t('app','Not posted');
       }

        $this->response = $data;
    }

    public function actionMedicalConditions($page = null)
    {
    
         $subCategory = Illness::findActive();

        $dataProvider = new ActiveDataProvider([
            'query' => $subCategory,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);

        $this->response = $data;
    }

    public function actionTimeOptionList($page = null)
    {
    
         $subCategory = Duration::findActive();

        $dataProvider = new ActiveDataProvider([
            'query' => $subCategory,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);

        $this->response = $data;
    }
    public function actionDepartmentList($page = null)
    {
        $query = Category::find()->where([
            'type_id' => Category::TYPE_DEPARTMENT,
            'state_id' => Category::STATE_ACTIVE
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionProfessionalStatusList($page = null)
    {
        $query = Doctorprofessionalstatus::find()->where([
            'state_id' => Doctorprofessionalstatus::STATE_ACTIVE
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionPatientSignup()
    {
        $data = [];
        $post = \Yii::$app->request->bodyParams;

        $model = new User();
        $medicalInformation = new PatientMedicalInformation();
        // $patientSymptons = new PatientSymptom();
        $dbTransaction = \Yii::$app->db->beginTransaction();
        try {
            if ($model->load($post) && $medicalInformation->load($post)) {
                $email_identify = User::findByUsername($model->email);
                if (empty($email_identify)) {
                    $model->setPassword($model->password);
                    $model->role_id = User::ROLE_PATIENT;
                    $model->full_name = $model->first_name.' '.$model->last_name ;
                    $model->state_id = User::STATE_ACTIVE;
                    $model->email_verified = User::EMAIL_VERIFIED;
                    $model->saveUploadedFile($model, 'profile_file');
                    if ($model->save()) {
                        $model->createWallet();

                        $medicalInformation->created_by_id = $model->id;
                        if ($medicalInformation->save()) {
                            if (! empty($post['PatientSymptom']['categories'])) {
                                $categories = explode(',', $post['PatientSymptom']['categories']);
                                foreach ($categories as $id) {
                                    $patientSymptons = new Patientsymptom();
                                    $patientSymptons->category_id = $id;
                                    $patientSymptons->created_by_id = $medicalInformation->created_by_id;
                                    if (! $patientSymptons->save()) {
                                        $dbTransaction->rollBack();
                                        $data['message'] = $patientSymptons->getErrorsString();
                                        $this->response = $data;
                                        return;
                                    }
                                }
                                $dbTransaction->commit();
                                $model->sendRegistrationMailtoUser($model);
                                $data['message'] = \Yii::t('app', 'Congratulations! Sign up successfully');
                                $data['detail'] = $model->asJson();
                                $this->setStatus(200);
                            } else {
                                $dbTransaction->rollBack();
                                $data['message'] = \Yii::t('app', 'Please select specialization');
                            }
                        } else {
                            $dbTransaction->rollBack();
                            $data['message'] = $medicalInformation->getErrorsString();
                        }
                    } else {
                        $data['message'] = $model->getErrorsString();
                    }
                } else {
                    $data['message'] = \yii::t('app', "Email already exists.");
                }
            } else {
                $data['message'] = \yii::t('app', "No data not posted.");
            }
        } catch (Exception $e) {
            $dbTransaction->rollBack();
            $data['message'] = \yii::t('app', $e->getMessage());
        }
        $this->response = $data;
    }

    public function actionDoctorSignup()
    {
        $data = [];
        $post = \Yii::$app->request->bodyParams;
        $model = new User();
        
        $doctorLanguage = new DoctorLanguage();
        
        $model->scenario = 'app-signup';
        $workInformation = new Workprofile();
        $dbTransaction = \Yii::$app->db->beginTransaction();
       try {
           if ($model->load($post) && $workInformation->load($post)  && $doctorLanguage->load($post)) {

                $email_identify = User::findByUsername($model->email);
                if (empty($email_identify)) {
                    $model->setPassword($model->password);
                    $model->role_id = User::ROLE_DOCTOR;
                    $model->state_id = User::STATE_ACTIVE;
                    $model->saveUploadedFile($model, 'profile_file');
                    $model->full_name = $model->getFullName();
                   
                    if ($model->save()) {
                        $workInformation->saveUploadedFile($workInformation, 'MDCN_certificate');
                        $workInformation->saveUploadedFile($workInformation, 'professional_indemnity_certificate');
                        $workInformation->created_by_id = $model->id;
                        if ($workInformation->save()) {

                            if (! empty($post['Doctorspecialization']['categories'])) {
                                $categories = explode(',', $post['Doctorspecialization']['categories']);
                                foreach ($categories as $id) {
                                    $specialization = new Doctorspecialization();
                                    $specialization->category_id = $id;
                                    $specialization->created_by_id = $workInformation->created_by_id;
                                    if (! $specialization->save()) {
                                        $dbTransaction->rollBack();
                                        $data['message'] = $specialization->getErrorsString();
                                        $this->response = $data;
                                        return;
                                    }
                                }
                                
                                ///////
                                
                                if (! empty($doctorLanguage->language_id)) {
                                    $languages = explode(',', $doctorLanguage->language_id );
                                    foreach ($languages as $id) {
                                        $lang = new DoctorLanguage();
                                        $lang->language_id = $id;
                                        $lang->created_by_id = $model->id;
                                        if (!$lang->save()) {
                                           $dbTransaction->rollBack();
                                            $data['message'] = $lang->getErrorsString();
                                            $this->response = $data;
                                            return;
                                        }
                                    }
                                    
                                } 
                                
                                $dbTransaction->commit();
                                $model->sendRegistrationMailtoUser($model);
                                $data['message'] = \Yii::t('app', 'Congratulations! Sign up successfully');
                                $data['detail'] = $model->asJson();
                                $this->setStatus(200);
                            } else {
                               $dbTransaction->rollBack();
                                $data['message'] = \Yii::t('app', 'Please select specialization');
                            }
                        } else {
                           $dbTransaction->rollBack();
                            $data['message'] = \Yii::t('app', $workInformation->getErrorsString());
                        }
                    } else {
                        $data['message'] = $model->getErrorsString();
                    }
                } else {
                    $data['message'] = \yii::t('app', "Email already exists.");
                }
            } else {
                $data['message'] = \yii::t('app', "No data posted.");
            }
        } catch (Exception $e) {
            $dbTransaction->rollBack();
            $data['message'] = \yii::t('app', $e->getMessage());
        }
        $this->response = $data;
    }

    public function actionMyProfile()
    {
        $data = [];
        $model = User::findOne(\Yii::$app->user->id);
        if (! empty($model)) {
            $data['detail'] = $model->asJson();
            $this->setStatus(200);
        } else {
            $data['message'] = \yii::t('app', "User not found");
        }

        $this->response = $data;
    }

    public function actionAddMoneyToWallet()
    {
        $response = [];
        $post = \Yii::$app->request->bodyParams;
        $transactionModel = new Transaction();
        $model = UserWallet::findOne([
            'created_by_id' => \Yii::$app->user->id
        ]);
        if (! empty($model)) {
            try {
                $amount = $model->amount;
                if ($model->load($post) && $transactionModel->load($post)) {
                    $updated_amount = floatval($amount) + floatval($model->amount);
                    $model->updateAttributes([
                        'amount' => $updated_amount
                    ]);
                    $value = $model->saveWalletHistory($amount, UserWallet::TYPE_CREDIT, $model->id);

                    if ($value != User::STATE_INACTIVE) {
                        $transactionModel->amount = $model->amount;
                        $transactionModel->currency = "usd";
                        $transactionModel->model_id = $value;
                        $transactionModel->model_type = WalletHistory::className();
                        $transactionModel->payment_status = Transaction::PAYMENT_STATUS_SUCCESS;
                        if ($transactionModel->save()) {
                            $response['wallet_amount'] = (string) $model->amount;
                            $response['message'] = \yii::t('app', "Amount added to the wallet successfully");
                            $this->setStatus(200);
                        } else {
                            $response['message'] = $transactionModel->getErrorsString();
                        }
                    } else {
                        $response['message'] = \yii::t('app', "Payment Failure");
                    }
                } else {
                    $response['message'] = \yii::t('app', "No data posted");
                }
            } catch (Exception $e) {
                $response['message'] = \yii::t('app', $e->getMessage());
            }
        } else {
            $response['message'] = \yii::t('app', "No Wallet Found");
        }

        $this->response = $response;
    }

    public function actionAbout()
    {
        $data = [];
        $model = Page::find()->where([
            'type_id' => Page::TYPE_ABOUT_US
        ])->one();

        if (! empty($model)) {
            $data['list'] = $model;
            $this->setStatus(200);
        } else {

            $data['message'] = \yii::t('app', "No Data Found");
        }

        $this->response = $data;
    }

    public function actionAddDocument()
    {
        $response = [];
        $fileModel = new File();
        $model = User::findOne(\Yii::$app->user->identity->id);
        if (! empty($model)) {
            $imagefile = UploadedFile::getInstances($fileModel, 'name');
            $fileModel->uploadFiles($imagefile, $model);
            $response['status'] = self::API_OK;
            $response['detail'] = $model->asJson(true);
        } else {
            $response['error'] = \Yii::t('app', 'user not found.');
        }

        $this->response = $response;
    }

    public function actionListDocument($page = null)
    {
        $data = [];
        $query = File::find()->where([
            'model_type' => User::className(),
            'model_id' => \Yii::$app->user->identity->id
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            true
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionAddMulipleImage()
    {
        $data = [];
        $file = new File();
        $user = \Yii::$app->user->identity;
        if (! empty($_FILES)) {
            $file->title = UploadedFile::getInstances($file, 'title');
            $result = $file->upload($user);
            if (! empty($result)) {
                $this->setStatus(200);
                $data['message'] = \Yii::t('app', 'Images uploaded successfully');
            } else {
                $data['message'] = \Yii::t('app', $file->getErrorsString());
            }
        } else {
            $data['message'] = \Yii::t('app', 'No data posted');
        }
        $this->response = $data;
    }

    public function actionDoctorList($page = null)
    {
        $query = User::find()->where([
            'state_id' => User::STATE_ACTIVE,
            'role_id' => User::ROLE_DOCTOR
        ]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            true
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionGetAppointment($id)
    {
        $data = [];
        $model = Appointment::findOne($id);

        if (! empty($model)) {
            $data['detail'] = $model->asJson();
        } else {
            $data['message'] = \Yii::t('app', 'Appointment not found');
        }
        $this->setStatus(200);

        $this->response = $data;
    }

    public function actionDoctorAppointments($page = null, $type = null)
    {
        $data = [];
        $query = Appointment::find()->where([
            'doctor_id' => \Yii::$app->user->id
        ])->orderBy('id DESC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 10,
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            true
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionAddDoctorAvailability()
    {
        $data = [];
        $post = Yii::$app->request->bodyParams;
        $model = new DoctorAvailability();
        $availability = new AvailabilityTime();
        $db = \Yii::$app->db;
        $transaction = $db->beginTransaction();

        try {

            if ($model->load($post)) {
                // $dates = $model->getWeekDates($model['AvailabilityDate']['day_id'], $post['AvailabilityDate']['repeat']);

                if (! empty($dates)) {
                    foreach ($dates as $date) {
                        $doctorAvailability = DoctorAvailability::find()->where([
                            'date' => $date,
                            'created_by_id' => \Yii::$app->user->id
                        ])->one();

                        $doctorAvailability->date = $date;
                        $doctorAvailability->state_id = DoctorAvailability::STATE_ACTIVE;
                        $doctorAvailability->created_by_id = \Yii::$app->user->id;
                        if ($doctorAvailability->save()) {

                            if (! empty($availability->time)) {
                                $times = json_decode($availability->time);
                                $availability->date = $date;

                                // $saveTime = $model->saveTimeSlots($times, $availability->id);
                                /*
                                 * if ($saveTime['status'] == 'NOK') {
                                 * $data['message'] = $saveTime['message'];
                                 * $this->response = $data;
                                 * return;
                                 * }
                                 */
                                if ($availability->save()) {
                                    $this->setStatus(200);
                                    $data['message'] = \Yii::t('app', 'sucesss');
                                    $data['detail'] = $availability->asJson();
                                } else {
                                    $transaction->rollBack();
                                    $data['message'] = $availability->getErrorsString();
                                    $this->response = $data;
                                    return;
                                }
                            }
                        } else {
                            $transaction->rollBack();
                            $data['message'] = $availability->getErrorsString();
                            $this->response = $data;
                            return;
                        }
                    }

                    $data['message'] = ('Availability added successfully');
                    $transaction->commit();
                    $this->setStatus(200);
                } else {
                    $data['message'] = \yii::t('app', 'No Dates Found');
                }
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            $data['message'] = Yii::t('app', "Error !! ") . $e->getMessage();
        }

        $this->response = $data;
    }

    public function actionGetTimeSlot($date, $doctor_id)
    {
        $data = [];

        $availability = DoctorAvailability::find()->where([
            'created_by_id' => $doctor_id,
            'date' => $date
        ])->one();

        if (! empty($availability)) {
            $appointment = Appointment::find()->select('availability_time_id')
                ->where([
                'availability_id' => $availability->id,
                'payment_status' => Appointment::PAYMENT_STATUS_PAID
            ])
                ->column();

            $availabilityTime = AvailabilityTime::find()->where([
                'doctor_availability_id' => $availability->id
            ])
                ->andWhere([
                'NOT IN',
                'id',
                $appointment
            ])
                ->orderBy('time');
            foreach ($availabilityTime->each() as $availabile) {
                if (($availabile->doctorAvailability->date > date('Y-m-d')) || ($availabile->time >= date('H:i:s') && $availabile->doctorAvailability->date == date('Y-m-d'))) {
                    $list[] = $availabile->asJson();
                }
            }
            $data['status'] = self::API_OK;
            $data['detail'] = ! empty($list) ? $list : [];
        } else {
            $this->setStatus(200);
            $data['message'] = \Yii::t('app', "No Time Slot Found");
        }
        $this->response = $data;
    }

    public function actionRemoveCertificate()
    {
        $data = [];
        $user_id = \Yii::$app->user->id;
        $workProfile = Workprofile::find()->where([
            'created_by_id' => $user_id
        ])->one();
        $post = \Yii::$app->request->bodyParams;
        if (! empty($workProfile)) {
            if ($workProfile->load($post)) {
                if ($workProfile->file_type == Workprofile::IMAGE_TYPE_MDCN_CERTIFICATE) {
                    if ($workProfile->professional_indemnity_certificate && file_exists(UPLOAD_PATH . $workProfile->professional_indemnity_certificate)) {
                        unlink(UPLOAD_PATH . $workProfile->professional_indemnity_certificate);
                    }
                    $workProfile->professional_indemnity_certificate = null;
                } else {
                    if ($workProfile->MDCN_certificate && file_exists(UPLOAD_PATH . $workProfile->MDCN_certificate)) {
                        unlink(UPLOAD_PATH . $workProfile->MDCN_certificate);
                    }
                    $workProfile->MDCN_certificate = null;
                }
                if ($workProfile->updateAttributes([
                    'professional_indemnity_certificate',
                    'MDCN_certificate'
                ])) {
                    $data['message'] = \Yii::t('app', 'Removed successfully');
                } else {
                    $data['message'] = \Yii::t('app', $workProfile->getErrorsString());
                }
            } else {
                $data['message'] = \Yii::t('app', "No data posted");
            }
        } else {
            $data['message'] = \Yii::t('app', "Work profile not found");
        }
        $this->response = $data;
    }

    public function actionFavorite($doctor_id)
    {
        $data = [];
        $doctor = User::findOne($doctor_id);
        $model = new Favorite();
        if (! empty($doctor)) {
            $exists = Favorite::find()->where([
                'doctor_id' => $doctor_id,
                'created_by_id' => \Yii::$app->user->id
            ])->one();
            if (! empty($exists)) {
                $option = ($exists->type_id == Favorite::TYPE_FAVOURTITE) ? Favorite::TYPE_UNFAVOURTITE : Favorite::TYPE_FAVOURTITE;
                $message = ($exists->type_id == Favorite::TYPE_FAVOURTITE) ? 'Removed from favorites' : 'Doctor added to your favorites';
                $exists->type_id = $option;
                $is_liked = ($exists->type_id == Favorite::TYPE_FAVOURTITE) ? true : false;

                if ($exists->updateAttributes([
                    'type_id'
                ])) {
                    $this->setStatus(200);
                    $data['is_liked'] = $is_liked;
                    $data['message'] = \Yii::t('app', $message);
                } else {
                    $data['message'] = \Yii::t('app', $exists->getErrorsString());
                }
            } else {
                $model->doctor_id = $doctor_id;
                $model->type_id = Favorite::TYPE_FAVOURTITE;
                if ($model->save()) {
                    $this->setStatus(200);
                    $data['is_liked'] = true;

                    $data['message'] = \Yii::t('app', 'Doctor added to your favorites');
                } else {
                    $data['message'] = $model->getErrorsString();
                }
            }
        } else {
            $data['error'] = \Yii::t('app', 'Not found');
        }
        $this->response = $data;
    }

    public function actionAddDoctorRating($doctor_id)
    {
        $data = [];
        
        $review = Rating::find()->where([
            'model_id' => $doctor_id,
            'model_type' => User::className()
        ])
            ->andWhere([
            'created_by_id' => \Yii::$app->user->id
        ])
            ->one();

        if (empty($review)) {
            $model = new Rating();
            $post = Yii::$app->request->bodyParams;
            if ($model->load($post)) {
                $model->model_id = $doctor_id;
                $model->model_type = User::className();
                if ($model->save()) {
                    $this->setStatus(200);
                    $data['message'] = \Yii::t('app', "Doctor rated successfully");
                } else {
                    $data['message'] = $model->getErrorsString();
                }
            } else {
                $data['message'] = \Yii::t('app', "No data posted");
            }
        } else {
            $data['message'] = "This Doctor is already rated by you";

        }
        $this->response = $data;
    }
    
    public function actionDoctorSearch($id , $page = null)
    {
        $data = [];
        $doctorsList = Doctorspecialization::find()->select('created_by_id')->where(['category_id' => $id ])->column();
        
        if(!empty($doctorsList)){
            
            $users = User::find()->where([
                'IN',
                'id',
                $doctorsList
            ])->andWhere([
                'state_id' => User::STATE_ACTIVE,
                'role_id' => User::ROLE_DOCTOR
            ]);
            
            
            $dataProvider = new ActiveDataProvider([
                'query' => $users,
                'pagination' => [
                    'page' => $page
                ]
            ]);
            $pagination = new TPagination();
            $pagination->params = [
                true
            ];
            $data = $pagination->serialize($dataProvider);
           
            $this->response = $data;
            
        }else{
            $data['message'] = \Yii::t('app', "No doctors found");
        }
        $this->setStatus(200);
        $this->response = $data;
    }
    
    public function actionQuestionList($id, $page = null)
    {
        $query = CategoryQuestion::find()->where([
            'category_id' => $id,
            'state_id' => CategoryQuestion::STATE_ACTIVE
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->params = [
            false
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    public function actionDoctorConsultationAvailability($id , $page = null)
    {
        $query = DoctorConsultationAvailability::find()->where([
            'user_id' => $id,
            'state_id' => DoctorConsultationAvailability::STATE_ACTIVE
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        $pagination->function = 'asJson';
        $pagination->params = [
            true
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    public function actionLanguageList($page = null)
    {
        $query = LanguageList::find()->where([
            'state_id' => LanguageList::STATE_ACTIVE
        ]);
         
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    public function actionDoctorConsultationMode($page = null)
    {
        $query = ConsultationAvailability::find()->where([
            'state_id' => ConsultationAvailability::STATE_ACTIVE
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
       
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    
    public function actionSavingDoctorAvailability($page = null)
    {
        $data = [];
        
        $model =  new DoctorConsultationAvailability();
        
        $post = Yii::$app->request->bodyParams;
        if ($model->load($post)) {
            $model->state_id   = DoctorConsultationAvailability::STATE_ACTIVE;
            $model->user_id   = Yii::$app->user->id;
            if ($model->save()) {
                $this->setStatus(200);
                $data['message'] = \Yii::t('app', "Saved successfully");
            } else {
                $data['message'] = $model->getErrorsString();
            }
        } else {
            $data['message'] = \Yii::t('app', "No data posted");
        }
       
        $this->response = $data;
        
    }
    
    //add doctor to favourite 
    //to be done 
    public function actionAddToFavourite()
    {
        $data = [];
        
        $model =  new Favorite();
        
        $post = Yii::$app->request->bodyParams;
        if ($model->load($post)) {
            $model->state_id   = Favorite::STATE_ACTIVE;
            $model->created_by_id   = Yii::$app->user->id;
            $model->doctor_id   = $model->doctor_id;
            if ($model->save()) {
                $this->setStatus(200);
                $data['message'] = \Yii::t('app', "Successfully added to favourites");
            } else {
                $data['message'] = $model->getErrorsString();
            }
        } else {
            $data['message'] = \Yii::t('app', "No data posted");
        }
        
        $this->response = $data;
        
    }
    
    public function actionSaveDoctorAvailabilityDates($page = null)
    {
        $data = [];
        
        $model =  new DoctorAvailability();
        
        $post = Yii::$app->request->bodyParams;
        
        if ($model->load($post)) {
            
            $jsonData = json_decode($model->data);
            
            foreach($jsonData->data as $json){
             
                $availability =  new DoctorAvailability();
                
                $availability->state_id   = DoctorAvailability::STATE_ACTIVE;
                $availability->created_by_id   = Yii::$app->user->id;
                $availability->date  = $json->date;
                if ($availability->save()) {
                    
                    foreach ($json->time_slots as $time){
                        
                        $timArr = explode('-', $time);
                        
                        $time =  new AvailabilityTime();
                        $time->doctor_availability_id   = $availability->id ; 
                        $time->start_time  = trim($timArr[0]);
                        $time->end_time  = trim($timArr[1]);
                        $time->state_id   = AvailabilityTime::STATE_ACTIVE;
                        $time->date =  $json->date;
                        
                        if ($time->save()) {
                            $this->setStatus(200);
                             $data['message'] = \Yii::t('app', "Saved successfully");
                        } else {
                            $data['message'] = $time->getErrorsString();
                        }
                    }
                    
                } else {
                    $data['message'] = $availability->getErrorsString();
                }
            }
            
        } else {
            $data['message'] = \Yii::t('app', "No data posted");
        }
        
        $this->response = $data;
        
    }
    
    
    public function actionGetDoctorDates($id)
    {
        $data = [];
        
        $model =  DoctorAvailability::find()->select('date')->where([
            'created_by_id' => $id
        ])->column();
        
        $this->setStatus(200);
        $data['dates'] = $model;
            
        $this->response = $data;
        
    }
    
    public function actionGetDoctorSlots($id)
    {
        $data = [];
        
        $time =  new AvailabilityTime();
        
        $datesArray = [] ; 
        
        $post = Yii::$app->request->post();
        
        if ($time->load($post)) {
        
            $model =  AvailabilityTime::find()->where([
                'created_by_id' => $id,
                'date' => $time->date
            ]);
            
            foreach($model->each() as $dates){
                $datesArray[] = $dates->asJson();
            }
            
            $this->setStatus(200);
            $data['detail'] = $datesArray;
            //$data['query'] = $model->createCommand()->getRawSql();
        
        } else {
            $data['message'] = \Yii::t('app', "No data posted");
        }
        
        $this->response = $data;
        
    }

    /**
    * Patient Healthh profile
    **/
    public function actionHealthProfile()
    {
        $data = [];
        $user = \Yii::$app->user->id;
        $PatientHealthProfile = PatientHealthProfile::find()->where([
            'created_by_id' => \Yii::$app->user->id
        ])->one();
        if(empty($PatientHealthProfile)){
            $model = new PatientHealthProfile();
        $post = \Yii::$app->request->bodyParams;
        $dbTransaction = \Yii::$app->db->beginTransaction();
        try{
            $model->step_count = PatientHealthProfile::STEP_HEALTH_PROFILE;
           if($model->save())
            {
                $medicineData = $post['PatientMedicineHistory']['medicineInfo'];
                if (! empty($medicineData)) {
                    $decode = json_decode($medicineData);
                    foreach ($decode as $row) {
                        $patientMedicalHistory = new PatientMedicineHistory();
                        foreach ($row as $key => $value) {
                            $patientMedicalHistory->health_profile = $model->id;
                            $patientMedicalHistory->$key = $value;
                        }
                        if (! $patientMedicalHistory->save()) {
                            return $response['error'] = $patientMedicalHistory->getErrorsString();
                            $transaction->rollBack();
                            break;
                        }
                    }
                }
                $allergiesData = $post['PatientAllergies']['allergies'];
                if (! empty($allergiesData)) {
                    $categories = explode(',', $allergiesData);
                    foreach ($categories as $value) {
                        $patientAllergies = new PatientAllergies();
                        $patientAllergies->health_profile = $model->id;
                        $patientAllergies->allergy = $value;
                        if (! $patientAllergies->save()) {
                            $dbTransaction->rollBack();
                            $data['message'] = $patientAllergies->getErrorsString();
                            $this->response = $data;
                            return;
                        }
                    }
                }
                $illnessData = $post['PatientIllness']['illness'];
                if (! empty($illnessData)) {
                    $decodeIllness = json_decode($illnessData);
                    foreach ($decodeIllness as $row) {
                        foreach ($row->key as  $key=>$value) {
                            $patientIllness = new PatientIllness();
                            $patientIllness->health_profile = $model->id;
                            $patientIllness->symptom_id = $row->symptom_id;
                            $patientIllness->illness_id = $value->id;
                             if (! $patientIllness->save()) {
                                return $data['message'] = $patientIllness->getErrorsString();
                                $transaction->rollBack();
                                break;
                             }
                             
                         }
                    }
                }
                
                    $dbTransaction->commit();
                    $data['message'] = \Yii::t('app', 'Health profile save successfully');
                    $data['detail'] = $model->asJson(true);
                    $this->setStatus(200);
                } 
                   else{
               $data['message'] = Yii::t('app', $model->getErrorsString());
            }
        

        } catch (Exception $e) {
            $dbTransaction->rollBack();
            $data['message'] = \yii::t('app', $e->getMessage());
        }

        }
        else{
            $data['message'] = \yii::t('app', "Already Saved Saved profile");
        }
        
         $this->response = $data;
    }

    
    public function actionBookAppointment()
    {
        $data = [];
        $model = new Appointment();
        $post = Yii::$app->request->post();
        
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            if ($model->load($post)) {
                
                $time  = AvailabilityTime::findOne($model->availability_time_id);
                
                $model->state_id = Appointment::STATE_PENDING;
                $model->price = $time->price;
                $model->payment_status = Appointment::PAYMENT_STATUS_UNPAID;
                $model->patient_id = \Yii::$app->user->id;
                if ($model->save()) {
                    $message = $model->createdBy->full_name . \Yii::t('app', " has sent you appointment request");
                        $model->sendConfirmationMail();
                        /*
                         * if ($model->doctor->notification_settings == User::NOTIFICATION_ON) {
                         * $sendNotification = true;
                         * } else {
                         * $sendNotification = false;
                         * }
                         */
                        $sendNotification = true;
                        if (Notification::create([
                            'to_user_id' => $model->doctor_id,
                            'created_by_id' => $model->created_by_id,
                            'title' => $message,
                            'model' => $model
                        ], false, $sendNotification)) {
                            $message = $model->createdBy->full_name . \Yii::t('app', " has sent an appointment request to " . $model->doctor->full_name);
                            $admin = User::find()->where([
                                'role_id' => User::ROLE_ADMIN
                            ])->one();
                            Notification::create([
                                'to_user_id' => $admin->id,
                                'created_by_id' => $model->created_by_id,
                                'title' => $message,
                                'model' => $model
                            ], false, $sendNotification);
                            
                            $data['member'] = true;
                            $data['message'] = \Yii::t('app', "Appointment added successfully");
                        }
                    $transaction->commit();
                    $this->setStatus(200);
                    $data['detail'] = $model->asJson();
                } else {
                    $data['message'] = $model->getErrorsString();
                }
            } else {
                $data['message'] = \Yii::t('app', "No Data Posted");
            }
        } catch (Exception $e) {
            $data['message'] = $e->getMessage();
        }
        $this->response = $data;
    }

    //set booking active or rejecting 
    public function actionSetBookingStatus($id , $state)
    {
        $data = [];
        
        if( !empty($id) && !empty($state) )  {
            
            $model =  Appointment::findOne($id);
            
            
            if(!empty($model)){
                
                $model->state_id = $state;
                
                if ($model->save()) {
                    
                    if($state == Appointment::STATE_REJECT){
                        $message = $model->doctor->full_name . \Yii::t('app', " has rejected your appointment request");
                    }else{
                        if($state == Appointment::STATE_ACCEPT){
                            $message = $model->doctor->full_name . \Yii::t('app', " has accepted your appointment request");
                        }
                    }
                    
                    $sendNotification = true;
                    
                    Notification::create([
                        'to_user_id' => $model->patient_id,
                        'created_by_id' => \Yii::$app->user->id,
                        'title' => $message,
                        'model' => $model
                    ], false, $sendNotification);
                    
                    $this->setStatus(200);
                    $data['message'] = \Yii::t('app', "Saved successfully");
                } else {
                    $data['message'] = $model->getErrorsString();
                }
                
            }else {
                $data['message'] = \Yii::t('app', "No such appointment found");
            }
            
        } else {
            $data['message'] = \Yii::t('app', "No data posted");
        }
        
        $this->response = $data;
        
    }
    
    public function actionDoctorPendingAppointments($page = null)
    {
        $query = Appointment::find()->where([
            'state_id' => Appointment::STATE_PENDING,
            'doctor_id' => Yii::$app->user->id
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    
//     public function actionDoctorPendingAppointments($page = null)
//     {
//         $query = Appointment::find()->where([
//             'state_id' => Appointment::STATE_PENDING,
//             'doctor_id' => Yii::$app->user->id
//         ]);
        
//         $dataProvider = new ActiveDataProvider([
//             'query' => $query,
//             'pagination' => [
//                 'page' => $page
//             ]
//         ]);
//         $pagination = new TPagination();
        
//         $data = $pagination->serialize($dataProvider);
//         $this->setStatus(200);
//         $this->response = $data;
//     }
    
    
    
    public function actionUpcomingAppointment($page = null)
    {
        
        $query = Appointment::find()->alias('p')->joinWith('availabilityTime as at')->where([
            'p.state_id' => Appointment::STATE_ACTIVE,
            'p.doctor_id' => Yii::$app->user->id
        ])->andWhere([
            '>=', 'at.date', date("Y-m-d")
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    
    public function actionPastAppointment($page = null)
    {
        $query = Appointment::find()->alias('p')->joinWith('availabilityTime as at')->where([
            'p.state_id' => Appointment::STATE_ACTIVE,
            'p.doctor_id' => Yii::$app->user->id
        ])->andWhere([
            '<', 'at.date', date("Y-m-d")
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    
    public function actionMyNotifications($page = null)
    {
        $query = Notification::find()->where([
            'to_user_id' => \Yii::$app->user->id
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC,
                ]
            ],
        ]);
        
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
    
    public function actionMyFavouriteDoctorList($page = null)
    {
        $query = Favorite::find()->where([
            'type_id' => Favorite::TYPE_FAVOURTITE,
            'created_by_id' => Yii::$app->user->id
        ]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page' => $page
            ]
        ]);
        $pagination = new TPagination();
        
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }
    
}
