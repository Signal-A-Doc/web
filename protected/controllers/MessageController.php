<?php
namespace app\controllers;

use app\components\TController;
use app\models\Message;
use app\models\search\Message as MessageSearch;
use Yii;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use app\models\User;
use app\models\Notification;
use app\models\Doctor;
use app\models\Patient;
use app\models\Appointment;

/**
 * MessageController implements the CRUD actions for Message model.
 */
class MessageController extends TController
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => [
                    'index',
                    'user-list',
                    'view',
                    'add',
                    'delete',
                    'update',
                    'inbox',
                    'get-msg',
                    'none'
                ],
                'rules' => [
                    [
                        'actions' => [
                            'index',
                            'user-list',
                            'view',
                            'add',
                            'delete',
                            'update',
                            'inbox',
                            'get-msg',
                            'begin-chat'
                        ],
                        'allow' => true,
                        'roles' => [
                            '@'
                        ]
                    ],
                    [
                        'actions' => [
                            'none'
                        ],
                        'allow' => true,
                        'roles' => [
                            '?',
                            '*'
                        ]
                    ]
                ]
            ]
        ];
    }

    /**
     * Creates a new Message model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    
    /**
     * Lists all Message models.
     *
     * @return mixed
     */
    public function actionGetMsg($id = null)
    {
        $session = \yii::$app->session;
        if (! $session->isActive) {
            $session->open();
        }
        if (! $id) {
            $id = 0;
        }
        if (isset($_POST['id'])) {
            \yii::$app->response->format = 'json';
            $query = Message::find()->orderBy('id asc')
                ->where([
                'session_id' => $_POST['id']
            ])
                ->all();
            $last = end($query);
            $_SESSION['last_id'] = $last->id;
            $msgs = [];
            if ($query)
                foreach ($query as $item) {
                    $data['id'] = $item->id;
                    $data['msg'] = $item->message;
                    $data['to_id'] = $item->to_id;
                    $data['from_id'] = $item->from_id;
                    $data['create_time'] = $item->time_elapsed_string($item->create_time);
                    
                    $msgs[] = $data;
                }
            // $query = \yii\helpers\ArrayHelper::map($query,'id')
            return $msgs;
        }
    }

    public function actionBeginChat($id = null)
    {
        $appointment = Appointment::findOne($id);
        
        if (! $appointment) {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
        $doctor = $appointment->doctor;
        $patient = $appointment->patient;
        
        if (! $doctor && $patient) {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
        
        $query = Message::find()->where([
            'OR',
            [
                'to_id' => $doctor->create_user_id,
                'from_id' => \Yii::$app->user->id
            ],
            [
                'to_id' => \yii::$app->user->id,
                'from_id' => $doctor->create_user_id
            ]
        ])->andFilterWhere([
            'appointment_id' => $id
        ]);
        
        $clonedQuery = clone $query;
        
        $lastId = $clonedQuery->max('id');
        
        $session = \Yii::$app->session;
        if (! $session->isActive) {
            $session->open();
        }
        
        $session->set('last_id', $lastId);
        
        $dataProvider = new \yii\data\ActiveDataProvider([
            'query' => $query,
            'pagination' => false
        ]);
        
        if (User::isPatient()) {
            return $this->render('chat', [
                'doctor' => $doctor,
                'patient' => $patient,
                'appointment' => $appointment,
                'dataProvider' => $dataProvider
            ]);
        } else {
            return $this->render('doc_chat', [
                'doctor' => $doctor,
                'patient' => $patient,
                'appointment' => $appointment,
                'dataProvider' => $dataProvider
            ]);
        }
    }

    public function actionSend($apid = null)
    {
        $response['status'] = 'NOK';
        \Yii::$app->response->format = "json";
        $model = new Message();
        if (\Yii::$app->request->post('to_id') && \Yii::$app->request->post('message')) {
            $model->to_id = \Yii::$app->request->post('to_id');
            $model->message = \Yii::$app->request->post('message');
        }
        $model->state_id = Message::STATUS_UNREAD;
        $model->from_id = \Yii::$app->user->id;
        if (\Yii::$app->request->post('to_id')) {
            $model->appointment_id = $apid;
            if ($model->save()) {
                $response['status'] = 'OK';
                $response['detail'] = $model->asJson();
                $response['detail']['create_time'] = $model->time_elapsed_string($model->create_time);
                $response['session_id'] = $model->session_id;
                $user_id = \Yii::$app->request->post('to_id');
                $session = \yii::$app->session;
                if (! $session->isActive) {
                    $session->open();
                }
                $session->set('last_id', $model->id);
            } else {
                $err = '';
                foreach ($model->getErrors() as $error) {
                    $err .= implode(',', $error);
                }
                $response['error'] = $err;
            }
        }
        return $response;
    }

    public function actionLastMsg($id = null)
    {
        $session = \yii::$app->session;
        if (! $session->isActive) {
            $session->open();
        }
        
        $doctor = User::findOne($id);
        
        $last_id;
        \yii::$app->response->format = 'json';
        
        $query = Message::find()->orderBy('id asc')
            ->where([
            'OR',
            [
                'to_id' => $doctor->id,
                'from_id' => \Yii::$app->user->id
            ],
            [
                'to_id' => \yii::$app->user->id,
                'from_id' => $doctor->id
            ]
        ])
            ->andWhere([
            '>',
            'id',
            $_SESSION['last_id']
        ])
            ->all();
        
        $last = end($query);
        if ($last) {
            $_SESSION['last_id'] = $last->id;
        }
        $arr = [];
        $list = [];
        if ($query)
            
            foreach ($query as $item) {
                $data['detail'] = $item->asJson();
                $data['detail']['create_time'] = $item->time_elapsed_string($item->create_time);
                $list[] = $data;
            }
        // $query = \yii\helpers\ArrayHelper::map($query,'id')
        if (! empty($list)) {
            $arr['list'] = $list;
            $arr['status'] = 'OK';
            
            return $arr;
        } else {
            return $arr['status'] = 'NOK';
        }
    }

    public function actionIndex()
    {
        $searchModel = new MessageSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionInbox()
    {
        $query = Message::find()->where([
            'to_id' => \yii::$app->user->id
        ])
            ->joinwith([
            'to as tu',
            'from as f'
        ])
            ->orWhere([
            'from_id' => \yii::$app->user->id
        ]);
        if (isset($_GET['name'])) {
            $query->andFilterWhere([
                'OR',
                [
                    'like',
                    'tu.first_name',
                    $_GET['name']
                ],
                [
                    'like',
                    'f.first_name',
                    $_GET['name']
                ]
            ]);
        }
        
        $query->orderBy('id desc')->groupBy('session_id');
        $dataProvider = new \yii\data\ActiveDataProvider([
            'query' => $query
        ]);
        $model = new Message();
        return $this->render('inbox', [
            'dataProvider' => $dataProvider,
            'model' => $model
        ]);
    }

    public function actionUserList($id)
    {
        $searchModel = new MessageSearch();
        $dataProvider = $searchModel->searchConversation(Yii::$app->request->queryParams, $id);
        
        return $this->render('user-messages', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Displays a single Message model.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect([
                'view',
                'id' => $model->id
            ]);
        } else {
            return $this->render('view', [
                'model' => $model
            ]);
        }
    }

    /**
     * Creates a new Message model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd()
    {
        $model = new Message();
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect([
                'view',
                'id' => $model->id
            ]);
        } else {
            return $this->render('add', [
                'model' => $model
            ]);
        }
    }

    /**
     * Updates an existing Message model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect([
                'view',
                'id' => $model->id
            ]);
        } else {
            return $this->render('update', [
                'model' => $model
            ]);
        }
    }

    /**
     * Deletes an existing Message model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        
        return $this->redirect([
            'index'
        ]);
    }
    
    public function actionMass()
    {
        \Yii::$app->response->format = 'json';
        $response['status'] = 'NOK';
        $Ids = Yii::$app->request->post('ids', []);
        
        if (! empty($Ids)) {
            foreach ($Ids as $Id) {
                $model = Message::findOne($Id);
                if (! empty($model && $model instanceof Message)) {
                    
                    $model->delete();
                    $response['status'] = 'OK';
                }
            }
        }
        
        return $response;
    }

    /**
     * Finds the Message model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return Message the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Message::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }

    protected function updateMenuItems($model = null, $className = 'app\models\Message')
    {
        // create static model if model is null
        if ($model == null)
            $model = new Message();
        // Add SEO headers
        $this->processSEO($model);
        
        // merge actions with menu
        $this->menu = array_merge($this->menu);
    }
}
