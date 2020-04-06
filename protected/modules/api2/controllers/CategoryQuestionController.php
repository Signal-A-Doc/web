<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\modules\api2\controllers;

use app\models\Appointment;
use app\models\CategoryQuestion;
use app\models\CallLog;
use app\models\Favorite;
use app\models\Halogins;
use app\models\LoginForm;
use app\models\SubscribedUsers;
use app\models\User;
use app\modules\api2\components\ApiTxController;
use Yii;
use app\modules\api2\models\DeviceDetail;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use yii\web\UploadedFile;
use app\models\Category;
use app\models\AppointmentQuestions;
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
use phpDocumentor\Reflection\Types\Null_;

/**
 * CategoryQuestionController implements the API actions for User model.
 */
class CategoryQuestionController extends ApiTxController
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
                        'question-list'
                    ],
                    'allow' => true,
                    'matchCallback' => function () {
                        return User::isPatient();
                    }
                ],
                [
                    'actions' => [
                        
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
     * Displays a single User model.
     *
     * @return mixed
     */
    public function actionGet($id)
    {
        $this->modelClass = "app\models\CategoryQuestion";
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
        $this->modelClass = "app\models\CategoryQuestion";
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
        return $this->txDelete($id, "CategoryQuestion");
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
            true
        ];
        $data = $pagination->serialize($dataProvider);
        $this->setStatus(200);
        $this->response = $data;
    }

    public function actionAppointmentQuestionList( $page = null)
    {
        $query = AppointmentQuestions::find()->where([
            'state_id' => AppointmentQuestions::STATE_ACTIVE
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
    
    

}
