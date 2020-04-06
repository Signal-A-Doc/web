<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\modules\api2\controllers;

use app\models\AppointmentQuestions;
use app\models\Appointment;
use app\models\CategoryQuestion;
use app\models\User;
use app\modules\api2\components\ApiTxController;
use app\modules\api2\components\TPagination;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use app\modules\notification\models\Notification;
use app\models\DoctorAvailability;
use app\models\AvailabilityTime;

/**
 * CategoryQuestionController implements the API actions for User model.
 */
class AppointmentController extends ApiTxController
{

    public function behaviors()
    {
        $unAuthorize = [];

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
                        'my-upcoming-appointments',
                        'my-past-appointments',
                        'appointment-detail',
                    ],
                    'allow' => true,
                    'matchCallback' => function () {
                        return User::isPatient();
                    }
                ],
                [
                    'actions' => [
                        'appointment-detail',
                        'patient-list',
                        'doctor-book-appointment'
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

    /**
     * Displays a single Appointment model.
     *
     * @return mixed
     */
    public function actionGet($id)
    {
        $this->modelClass = "app\models\Appointment";
        return $this->txget($id);
    }

    /**
     * Creates a new Appointment model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd()
    {
        $this->modelClass = "app\models\Appointment";
        return $this->txSave();
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        return $this->txDelete($id, "Appointment");
    }

    public function actionMyUpcomingAppointments($page = null)
    {
        $query = Appointment::find()->alias('p')->joinWith('availabilityTime as at')->where([
            'p.patient_id' => \Yii::$app->user->id
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

    public function actionMyPastAppointments($page = null)
    {
        $query = Appointment::find()->alias('p')->joinWith('availabilityTime as at')->where([
            'p.patient_id' => \Yii::$app->user->id
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
    
    public function actionAppointmentDetail($id)
    {
        $data = [];
        
        $query = Appointment::findOne($id);
        
        if(!empty($query)){
            $data['detail'] = $query->asJson(true);
            $this->setStatus(200);
        }else{
            $data['message'] = \Yii::t('app', "No such appointment found");
        }
                
        $this->response = $data;
    }
    
    public function actionRescheduleAppointment($id)
    {
        $data = [];
        
        $model = Appointment::findOne($id);
        
        if(!empty($model)){
            
            $post = \Yii::$app->request->post();
            
            $transaction = \Yii::$app->db->beginTransaction();
            try {
                if ($model->load($post)) {
                    
                    $time  = AvailabilityTime::findOne($model->availability_time_id);
                    
                    $model->state_id = Appointment::STATE_RESCHEDULE_PENDING;
                    $model->price = $time->price;
                    $model->payment_status = Appointment::PAYMENT_STATUS_UNPAID;
                    $model->patient_id = \Yii::$app->user->id;
                    if ($model->save()) {
                        $message = $model->createdBy->first_name . \Yii::t('app', " has reschedule appointment request");
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
                            $message = $model->createdBy->full_name . \Yii::t('app', " has sent an appointment request to  reschedule" . $model->doctor->full_name);
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
                            $data['message'] = \Yii::t('app', "Appointment reschedule successfully");
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
        }else {
            $data['message'] = \Yii::t('app', "No such appointment found");
        }
        
        $this->response = $data;
    }
    
    public function actionPatientList($name, $page= null)
    {
        $query = User::find()->where([
            'role_id' => User::ROLE_PATIENT
        ]);
        
        if(!empty($name)){
            $query->andWhere([
                'like',
                'full_name',
                $name
            ]);
            
        }
        
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
    
    public function actionDoctorBookAppointment()
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
                $model->doctor_id = \Yii::$app->user->id;
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
    
    

}
