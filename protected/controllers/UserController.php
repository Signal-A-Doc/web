<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\controllers;

use app\components\TActiveForm;
use app\components\TController;
use app\models\LoginForm;
use app\models\User;
use app\models\search\User as UserSearch;
use Exception;
use Yii;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\web\UploadedFile;
use app\models\SubscribedUsers;
use app\modules\notification\models\Notification;
use app\models\Appointment;
use app\modules\payment\models\Transaction;
use app\models\PatientMedicalInformation;
use app\models\search\Workprofile;
use app\models\search\Patientsymptom;
use app\models\Doctorspecialization;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends TController
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className()
                ],
                'rules' => [
                    [
                        'actions' => [
                            'confirm-email',
                            'add',
                            'view',
                            'update',
                            'logout',
                            'change-password',
                            'profile-image',
                            'toggle',
                            'delete',
                            'download',
                            'dashboard'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return User::isDoctor();
                        }
                    ],
                    [
                        'actions' => [
                            'confirm-email',
                            'add',
                            'view',
                            'update',
                            'logout',
                            'changepassword',
                            'profile-image',
                            'toggle',
                            'delete',
                            'download',
                            'dashboard'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return User::isPatient();
                        }
                    ],
                    [
                        'actions' => [
                            'index',
                            'delete',
                            'add-doctor',
                            'add-patient',
                            'view',
                            'update',
                            'delete',
                            'logout',
                            'download',
                            'changepassword',
                            'resetpassword',
                            'dashboard',
                            'doctor-index',
                            'profile-image',
                            'toggle',
                            'clear',
                            'recover',
                            'add-admin',
                            'mass',
                            'ajax',
                            'patient-index'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return User::isAdmin();
                        }
                    ],

                    [
                        'actions' => [
                            'login',
                             'signup',
                            'resetpassword',
                            'recover',
                            'add-admin',
                            'test',
                            'download',
                            'confirm-email',
                            'test',
                            'payment-complete',
                            'payment-cancel'
                        ],
                        'allow' => true,
                        'roles' => [
                            '?',
                            '*'
                        ]
                    ],
                    [
                        'actions' => [
                            'payment-complete',
                            'payment-cancel'
                        ],
                        'allow' => true,
                        'roles' => [
                            '?',
                            '*',
                            '@'
                        ]
                    ]
                ]
            ],
            'verbs' => [
                'class' => \yii\filters\VerbFilter::className(),
                'actions' => [
                    'delete' => [
                        'post'
                    ]
                ]
            ]
        ];
    }

    public function actionClear()
    {
        $runtime = Yii::getAlias('@runtime');
        $this->cleanRuntimeDir($runtime);

        $this->cleanAssetsDir();
        return $this->goBack();
    }

    public function actionMass()
    {
        \Yii::$app->response->format = 'json';
        $response['status'] = 'NOK';
        $Ids = Yii::$app->request->post('ids', []);

        if (! empty($Ids)) {
            foreach ($Ids as $Id) {
                $model = User::findOne($Id);
                if (! empty($model && $model instanceof User)) {

                    $model->delete();
                    $response['status'] = 'OK';
                }
            }
        }

        return $response;
    }

    public function actionPaymentComplete()
    {
        $workingKey = '90B0B176F5239A99ED2E1E42F1A2D002';
        $encResponse = $_POST["encResp"];
        $rcvdString = User::decrypt($encResponse, $workingKey);

        $order_status = "";
        $decryptValues = explode('&', $rcvdString);
        $dataSize = sizeof($decryptValues);
        echo "<center>";

        for ($i = 0; $i < $dataSize; $i ++) {
            $information = explode('=', $decryptValues[$i]);

            if ($i == 3)
                $order_status = $information[1];
            if ($i == 2)
                $transaction = $information[1];
        }
        $model = Appointment::find()->where([
            'id' => $_POST["orderNo"]
        ])->one();
        if (! empty($model)) {
            $payment = new Transaction();
            $payment->model_id = $model->id;
            $payment->model_type = get_class($model);
            $payment->currency = 'INR';
            $payment->amount = $model->price;
            $payment->transaction_id = $transaction;
            $payment->value = $rcvdString;
            $payment->created_by_id = $model->created_by_id;

            if ($payment->save()) {
                $message = $model->createdBy->full_name . " has sent you an appointment request";
                if (Notification::create($param = [
                    'to_user_id' => $model->doctor_id,
                    'created_by_id' => $model->created_by_id,
                    'title' => $message,
                    'model' => $model
                ])) {
                    \Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Congrats!! Now you are a subscribed user'));
                }
            } else {
                \Yii::$app->getSession()->setFlash('error', $payment->getErrorsString());
            }

            if ($order_status === "Success") {
                $payment->payment_status = Subscribedusers::PAYMENT_STATUS_PAID;
                $payment->updateAttributes([
                    'payment_status'
                ]);
                $model->payment_status = SubscribedUsers::PAYMENT_STATUS_PAID;
                $model->updateAttributes([
                    'payment_status'
                ]);
                echo "<br>Thank you for shopping with us. Your credit card has been charged and your transaction is successful. We will be shipping your order to you soon.";
            } else if ($order_status === "Aborted") {
                echo "<br>Thank you for shopping with us.We will keep you posted regarding the status of your order through e-mail";
            } else if ($order_status === "Failure") {
                echo "<br>Thank you for shopping with us.However,the transaction has been declined.";
            } else {
                echo "<br>Security Error. Illegal access detected";
            }
            echo $order_status;
            die();
        }
    }

    public function actionPaymentCancel()
    {
        echo 'Booking Cancelled';
        echo "<br>Your Booking has been cancelled";
        die();
    }

    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->searchPatient(Yii::$app->request->queryParams, User::ROLE_PATIENT);
        $this->updateMenuItems();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionDownload($profile_file)
    {
        $file = UPLOAD_PATH . basename($profile_file);

        if (file_exists($file)) {

            Yii::$app->response->sendFile($file);
        }
    }

    public function actionDoctorIndex()
    {
        $type = \Yii::$app->request->get('state');
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere([
            'role_id' => User::ROLE_DOCTOR
        ]);
        if (! empty($type)) {
            $dataProvider->query->andWhere([
                'state_id' => $type
            ]);
        }
        $this->updateMenuItems();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionPatientIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->searchPatient(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere([
            'role_id' => User::ROLE_PATIENT
        ]);
        $this->updateMenuItems();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionView($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect($model->getUrl());
        } else {
            $this->updateMenuItems($model);
            return $this->render('view', [
                'model' => $model
            ]);
        }
    }

    public function actionAddAdmin()
    {
        $count = User::find()->count();
        if ($count != 0) {
            return $this->redirect([
                '/'
            ]);
        }
        $model = new User();
        $model->scenario = 'add-admin';
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load(Yii::$app->request->post())) {
            $model->role_id = User::ROLE_ADMIN;
            $model->state_id = User::STATE_ACTIVE;
            if ($model->validate()) {
                $model->setPassword($model->password);
                $model->generatePasswordResetToken();
                if ($model->save()) {
                    \Yii::$app->user->login($model);
                    \Yii::$app->getSession()->setFlash('success', \Yii::t('app', "Wellcome $model->full_name"));
                    return $this->goBack([
                        'dashboard/index'
                    ]);
                } else {
                    \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
                }
            } else {
                \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
            }
        }
        return $this->render('add-admin', [
            'model' => $model
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAddDoctor()
    {
        $model = new User();
        $work = new Workprofile();
        $specialization = new Doctorspecialization();
        $model->role_id = User::ROLE_DOCTOR;
        $model->state_id = User::STATE_ACTIVE;
        $model->scenario = 'signup';
        $post = Yii::$app->request->post();
        if (Yii::$app->request->isAjax && $model->load($post)) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post) && $work->load($post) && $specialization->load($post)) {

            $dbTransaction = \Yii::$app->db->beginTransaction();

            try {
                if ($model->validate()) {
                    $model->scenario = 'add';
                    $model->generatePasswordResetToken();
                    $model->state_id = User::STATE_ACTIVE;
                    $model->setPassword($model->password);
                    $model->saveUploadedFile($model, 'profile_file');
                    $model->full_name = $model->getFullName();
                    if ($model->save()) {
                        $model->createWallet();
                        $work->created_by_id = $model->id;
                        if ($work->save()) {
                            if (! empty($specialization->categories)) {
                                $categories = $specialization->categories;
                                foreach ($categories as $id) {
                                    $doctorspecialization = new Doctorspecialization();
                                    $doctorspecialization->category_id = $id;
                                    $doctorspecialization->created_by_id = $work->created_by_id;
                                    if (! $doctorspecialization->save()) {
                                        $dbTransaction->rollBack();
                                        \Yii::$app->getSession()->setFlash('error', "Error !!" . $doctorspecialization->getErrorsString());
                                        return $this->redirect(\Yii::$app->request->referrer);
                                    }
                                }
                                $dbTransaction->commit();
                                $model->sendRegistrationMailtoUser($model);
                                \Yii::$app->getSession()->setFlash('success', \Yii::t('app', 'Patient  Added Successfully.'));
                                return $this->redirect([
                                    'view',
                                    'id' => $model->id
                                ]);
                            } else {
                                $dbTransaction->rollBack();
                                \Yii::$app->getSession()->setFlash('error', \Yii::t('app', 'Error !!. Please select area of specialization'));
                                return $this->redirect(\Yii::$app->request->referrer);
                            }
                        } else {
                            $dbTransaction->rollBack();
                            \Yii::$app->getSession()->setFlash('error', \Yii::t('app', "Error !!" . $work->getErrorsString()));
                            return $this->redirect(\Yii::$app->request->referrer);
                        }
                    } else {
                        $dbTransaction->rollBack();
                        \Yii::$app->getSession()->setFlash('error', \Yii::t('app', "Error !!" . $model->getErrorsString()));
                        return $this->redirect(\Yii::$app->request->referrer);
                    }
                } else {

                    $dbTransaction->rollBack();
                    \Yii::$app->getSession()->setFlash('error', "Error !!" . \Yii::t('app', $model->getErrorsString()));
                    return $this->redirect(\Yii::$app->request->referrer);
                }
            } catch (\Exception $e) {
                $dbTransaction->rollBack();
                \Yii::$app->getSession()->setFlash('error', \Yii::t('app', "Error !!" . $e->getMessage()));
                return $this->redirect(\Yii::$app->request->referrer);
            }
        }
        $this->updateMenuItems($model);
        return $this->render('add-doctor', [
            'model' => $model,
            'work' => $work,
            'specialization' => $specialization
        ]);
    }

    public function actionAddPatient()
    {
        $model = new User();
        $medicalinformation = new PatientMedicalInformation();
        $symptom = new \app\models\Patientsymptom();
        $model->role_id = User::ROLE_PATIENT;
        $model->state_id = User::STATE_ACTIVE;
        $model->scenario = 'signup';
        $post = Yii::$app->request->post();

        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        $dbTransacction = \Yii::$app->db->beginTransaction();
        if ($model->load($post) && $medicalinformation->load($post) && $symptom->load($post)) {

            try {
                if ($model->validate()) {
                    $model->scenario = 'add';
                    $model->generatePasswordResetToken();
                    $model->state_id = User::STATE_ACTIVE;
                    $model->setPassword($model->password);
                    $model->saveUploadedFile($model, 'profile_file');
                    $model->full_name = $model->getFullName();
                    if ($model->save()) {
                        $model->createWallet();

                        if ($medicalinformation->save()) {

                            if (! empty($symptom->categories)) {
                                $categories = $symptom->categories;
                                foreach ($categories as $id) {
                                    $patientSymptons = new \app\models\Patientsymptom();
                                    $patientSymptons->category_id = $id;
                                    $patientSymptons->created_by_id = $medicalinformation->created_by_id;

                                    if (! $patientSymptons->save()) {

                                        $dbTransacction->rollBack();
                                        \Yii::$app->getSession()->setFlash('error', \Yii::t('app', "Error !!" . $patientSymptons->getErrorsString()));
                                        return $this->redirect(\Yii::$app->request->referrer);
                                    }
                                }

                                $dbTransacction->commit();
                                $model->sendRegistrationMailtoUser($model);

                                \Yii::$app->getSession()->setFlash('success', \Yii::t('app', 'Patient  Added Successfully.'));
                                return $this->redirect([
                                    'view',
                                    'id' => $model->id
                                ]);
                            } else {
                                $dbTransacction->rollBack();
                                \Yii::$app->getSession()->setFlash('error', "Error !!" . \Yii::t('app', $medicalinformation->getErrorsString()));
                                return $this->redirect(\Yii::$app->request->referrer);
                            }
                        } else {
                            $dbTransacction->rollBack();
                            \Yii::$app->getSession()->setFlash('error', "Error !!" . \Yii::t('app', $model->getErrorsString()));
                            return $this->redirect(\Yii::$app->request->referrer);
                        }
                    }
                }
            } catch (Exception $e) {
                $dbTransacction->rollBack();
                \Yii::$app->getSession()->setFlash('error', \Yii::t('app', "Error !!" . $e->getMessage()));
            }
        }

        $this->updateMenuItems($model);
        return $this->render('add', [
            'model' => $model,
            'medicalinformation' => $medicalinformation,
            'symptom' => $symptom
        ]);
    }

    public function actionRecover()
    {
        $model = new User();
        $model->scenario = 'reset_password';
        $post = Yii::$app->request->post();
        if (isset($post['User'])) {
            $email = trim($post['User']['email']);
            if ($email != null) {
                $user = User::findOne([
                    'email' => $email
                ]);
                if ($user) {
                    $user->generatePasswordResetToken();
                    if (! $user->save(false, [
                        'activation_key'
                    ])) {
                        throw new Exception(\Yii::t('app', "Cant Generate Authentication Key"));
                    }
                    $user->sendEmail();
                    \Yii::$app->session->setFlash('success', \Yii::t('app', 'Please check your email to reset your password.'));
                    return $this->redirect([
                        '/user/login'
                    ]);
                } else {
                    \Yii::$app->session->setFlash('error', \Yii::t('app', 'Email is not registered.'));
                }
            } else {
                $model->addError('error', \Yii::t('app', 'Email cannot be blank'));
            }
        }
        $this->updateMenuItems($model);
        return $this->render('requestPasswordResetToken', [
            'model' => $model
        ]);
    }

    public function actionResetpassword($token)
    {
        $model = User::findByPasswordResetToken($token);
        if (! ($model)) {
            \Yii::$app->session->setFlash('error', \Yii::t('app', 'This URL is expired.'));
        }
        $newModel = new User([
            'scenario' => 'resetpassword'
        ]);
        if ($newModel->load(Yii::$app->request->post()) && $newModel->validate() && $model) {

            $model->setPassword($newModel->password);
            $model->removePasswordResetToken();
            $model->last_password_change = date('Y-m-d H:i:s');
            $model->generateAuthKey();

            if ($model->save()) {
                \Yii::$app->session->setFlash('success', \Yii::t('app', 'New password is saved successfully.'));
            } else {
                \Yii::$app->session->setFlash('error', \Yii::t('app', 'Error while saving new password.'));
            }
        }
        $this->updateMenuItems($model);
        return $this->render('resetpassword', [
            'model' => $newModel
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = new User();
        $medicalinformation = new PatientMedicalInformation();
        $work = new \app\models\Workprofile();
        $symptom = new \app\models\Patientsymptom();
        $model = $this->findModel($id);
        $model->scenario = 'update';
        $post = \yii::$app->request->post();
        $old_image = $model->profile_file;
        $password = $model->password;

        if (Yii::$app->request->isAjax && $model->load($post)) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }

        if ($model->load($post)) {
            if (! empty($post['User']['password'])) {
                $model->setPassword($post['User']['password']);
            } else {
                $model->password = $password;
                $model->profile_file = $old_image;
                $model->saveUploadedFile($model, 'profile_file', $old_image);
            }

            if ($model->save()) {
                \Yii::$app->session->setFlash('success', \Yii::t('app', 'User Updated successfully.'));
                return $this->redirect($model->getUrl());
            } else {
                \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
            }
        }

        $model->password = '';
        $this->updateMenuItems($model);
        return $this->render('update', [
            'model' => $model,
            'medicalinformation' => $medicalinformation,
            'work' => $work,
            'symptom' => $symptom
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $this->updateMenuItems($model);

        if (\Yii::$app->user->id == $model->id || $model->role_id == User::ROLE_ADMIN) {
            \Yii::$app->session->setFlash('warrning', 'You are not allowed to perform this operation.');
            return $this->redirect(\Yii::$app->request->referrer);
        }
        if ($model->role_id == User::ROLE_DOCTOR) {
            $model->delete();
            \Yii::$app->getSession()->setFlash('success', \Yii::t('app', 'Doctor Deleted successfully'));
            return $this->redirect([
                'doctor-index'
            ]);
        } else {
            $model->delete();
            \Yii::$app->getSession()->setFlash('success', \Yii::t('app', 'Patient Deleted successfully'));
            return $this->redirect([
                'index'
            ]);
        }

        if (\Yii::$app->request->isAjax) {
            return true;
        }
    }

    public function actionConfirmEmail($id)
    {
        $user = User::find()->where([
            'activation_key' => $id
        ])->one();
        if (! empty($user)) {
            $user->email_verified = User::EMAIL_VERIFIED;
            if ($user->role_id == User::ROLE_PATIENT) {
                $user->state_id = User::STATE_ACTIVE;
            }
            if ($user->save()) {

                \Yii::$app->getSession()->setFlash('success', 'Congratulations! your account is verified');
                return $this->redirect([
                    '/site/index'
                ]);
            }
        } else {
            \Yii::$app->getSession()->setFlash('error', 'Token is Expired Please Resend Again');
            return $this->redirect([
                '/site/index'
            ]);
        }
    }

    public function actionSignup()
    {
        $model = new User([
            'scenario' => 'signup'
        ]);
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            $model->scenario = 'signup';
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load(Yii::$app->request->post())) {
            $model->state_id = User::STATE_ACTIVE;
            $model->role_id = User::ROLE_USER;
            $model->email_verified = User::EMAIL_NOT_VERIFIED;
            if ($model->validate()) {
                $model->scenario = 'add';
                $model->setPassword($model->password);
                $model->generatePasswordResetToken();
                if ($model->save()) {
                    \Yii::$app->user->login($model, 3600 * 24 * 30);
                    return $this->redirect([
                        '/dashboard'
                    ]);
                } else {
                    \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
                }
            } else {
                \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
            }
        }
        return $this->render('signup', [
            'model' => $model
        ]);
    }

    public function actionLogin()
    {
        if (! \Yii::$app->user->isGuest) {
            return $this->goHome();
        }
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login(false)) {
            return $this->goBack([
                'dashboard/index'
            ]);
        }
        return $this->render('login', [
            'model' => $model
        ]);
    }

    public function actionProfileImage()
    {
        return Yii::$app->user->identity->getProfileImage();
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->goHome();
    }

    public function actionChangepassword($id)
    {
        $model = $this->findModel($id);
        if (! ($model->isAllowed()))
            throw new \yii\web\HttpException(403, Yii::t('app', 'You are not allowed to access this page.'));

        $newModel = new User([
            'scenario' => 'changepassword'
        ]);
        if (Yii::$app->request->isAjax && $newModel->load(Yii::$app->request->post())) {
            Yii::$app->response->format = 'json';
            return TActiveForm::validate($newModel);
        }
        if ($newModel->load(Yii::$app->request->post()) && $newModel->validate()) {
            $model->setPassword($newModel->newPassword);
            $model->removePasswordResetToken();
            $model->last_password_change = date('Y-m-d H:i:s');
            if ($model->save(false, [
                'password',
                'last_password_change',
                'activation_key'
            ])) {
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Password Changed successfully'));
                return $this->redirect([
                    'dashboard/index'
                ]);
            } else {
                \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
            }
        }
        $this->updateMenuItems($model);
        return $this->render('changepassword', [
            'model' => $newModel
        ]);
    }

    public function actionDashboard()
    {
        return $this->redirect([
            'dashboard/index'
        ]);
    }

    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {

            if (! ($model->isAllowed()))
                throw new HttpException(403, Yii::t('app', 'You are not allowed to access this page.'));

            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    protected function updateMenuItems($model = null)
    {
        switch (\Yii::$app->controller->action->id) {

            case 'add':
                {
                    $this->menu['add'] = [
                        'label' => '<span class="glyphicon glyphicon-list"></span>',
                        'title' => Yii::t('app', 'Manage'),
                        'url' => [
                            'index'
                        ],
                        'visible' => User::isAdmin()
                    ];
                }
                break;
            case 'doctor-index':
                {
                    $state = \Yii::$app->request->get('state');
                    if ($state != User::STATE_REJECT) {
                        $this->menu['add'] = [
                            'label' => '<span class="glyphicon glyphicon-plus"></span>',
                            'title' => Yii::t('app', 'Add Doctor'),
                            'url' => [
                                'add-doctor'
                            ],
                            'visible' => false
                        ];
                    }
                }
                break;
            case 'patient-index':
                {
                    $this->menu['add'] = [
                        'label' => '<span class="glyphicon glyphicon-plus"></span>',
                        'title' => Yii::t('app', 'Add patient'),
                        'url' => [
                            'add-patient'
                        ],
                        'visible' => false
                    ];
                }

                break;

            case 'view':
                {
                    if ($model != null && ($model->role_id != User::ROLE_ADMIN) && \Yii::$app->hasModule('shadow'))
                        $this->menu['shadow'] = [
                            'label' => '<span class="glyphicon glyphicon-refresh ">Shadow</span>',
                            'title' => Yii::t('app', 'Login as ' . $model),
                            'url' => [
                                '/shadow/session/login',
                                'id' => $model->id
                            ],
								/* 'htmlOptions'=>[], */
								'visible' => User::isAdmin()
                        ];

                    if ($model != null)
                        $this->menu['changepassword'] = [
                            'label' => '<span class="glyphicon glyphicon-paste"></span>',
                            'title' => Yii::t('app', 'changepassword'),
                            'url' => $model->getUrl('changepassword'),

                            'visible' => User::isAdmin()
                        ];
                    if ($model != null)
                        $this->menu['update'] = [
                            'label' => '<span class="glyphicon glyphicon-pencil"></span>',
                            'title' => Yii::t('app', 'Update'),
                            'url' => $model->getUrl('update'),

                            'visible' => false
                        ];
                    if ($model->role_id != User::ROLE_ADMIN) {
                        if ($model->role_id == User::ROLE_DOCTOR) {
                            $url = '/doctor';
                        } else {
                            $url = '/patient';
                        }
                        $this->menu['manage'] = [
                            'label' => '<span class="glyphicon glyphicon-list"></span>',
                            'title' => Yii::t('app', 'Manage'),
                            'url' => [
                                $url
                            ],
                            'visible' => User::isAdmin()
                        ];
                        if ($model != null)
                            $this->menu['delete'] = [
                                'label' => '<span class="glyphicon glyphicon-trash"></span>',
                                'title' => Yii::t('app', 'Delete'),
                                'url' => $model->getUrl('delete'),
                                'htmlOptions' => [
                                    'data-method' => 'post'
                                ],
                                'visible' => User::isAdmin()
                            ];
                    }
                }
                break;
        }
    }
}
