<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\controllers;

use Yii;
use app\models\Questionanswer;
use app\models\search\Questionanswer as QuestionanswerSearch;
use app\components\TController;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use app\models\User;
use yii\web\HttpException;
use app\components\TActiveForm;
use yii\web\UploadedFile;
use app\modules\notification\models\Notification;
use app\models\CallLog;

/**
 * QuestionanswerController implements the CRUD actions for Questionanswer model.
 */
class QuestionanswerController extends TController
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
                            'clear',
                            'index',
                            'add',
                            'view',
                            'update',
                            'delete',
                            'ajax',
                            'mass',
                            'upload-sound'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return User::isAdmin();
                        }
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

    /**
     * Lists all Questionanswer models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuestionanswerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $this->updateMenuItems();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Displays a single Questionanswer model.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $this->updateMenuItems($model);
        return $this->render('view', [
            'model' => $model
        ]);
    }

    public function actionMass()
    {
        \Yii::$app->response->format = 'json';
        $response['status'] = 'NOK';
        $Ids = Yii::$app->request->post('ids', []);
        
        if (! empty($Ids)) {
            foreach ($Ids as $Id) {
                $model = Questionanswer::findOne($Id);
                if (! empty($model && $model instanceof Questionanswer)) {
                    
                    $model->delete();
                    $response['status'] = 'OK';
                }
            }
        }
        
        return $response;
    }

    /**
     * Creates a new Questionanswer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd($ajax = false)
    {
        $model = new Questionanswer();
        $model->loadDefaultValues();
        $model->state_id = Questionanswer::STATE_ACTIVE;
        
        $post = \yii::$app->request->post();
        if ($ajax == false) {
            if (\yii::$app->request->isAjax && $model->load($post)) {
                \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return TActiveForm::validate($model);
            }
        }
        if ($model->load($post)) {
            
            if (! empty($_FILES['video-blob'])) {
                $model->answer_title = \Yii::$app->controller->id . date('Y-m-d') . time() . '.mp3';
                if (! move_uploaded_file($_FILES['video-blob']['tmp_name'], UPLOAD_PATH . '/' . $model->answer_title)) {
                    die('Error uploading file - check destination is writeable.');
                }
            }
            if ($model->save()) {
                $message = \Yii::$app->user->identity->full_name . ' answered your query';
                Notification::create($param = [
                    'to_user_id' => $model->question->created_by_id,
                    'created_by_id' => \Yii::$app->user->id,
                    'title' => $message,
                    'type_id' => CallLog::TYPE_QUESTION,
                    'model' => $model
                ]);
                \Yii::$app->getSession()->setFlash('success', 'Answer Added Successfully');
                return $this->redirect([
                    '/questions/view',
                    'id' => $model->question_id,
                    'title' => $model->question->question_title
                ]);
            }
        }
        
        $this->updateMenuItems();
        return $this->redirect(\Yii::$app->request->referrer);
    }

    /**
     * Updates an existing Questionanswer model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        $post = \yii::$app->request->post();
        if (\yii::$app->request->isAjax && $model->load($post)) {
            \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post) && $model->save()) {
            return $this->redirect($model->getUrl());
        }
        $this->updateMenuItems($model);
        return $this->render('update', [
            'model' => $model
        ]);
    }

    /**
     * Deletes an existing Questionanswer model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        
        $model->delete();
        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Truncate an existing Questionanswer model.
     * If truncate is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionClear($truncate = true)
    {
        $query = Questionanswer::find();
        foreach ($query->each() as $model) {
            $model->delete();
        }
        if ($truncate) {
            Questionanswer::truncate();
        }
        \Yii::$app->session->setFlash('success', 'Questionanswer Cleared !!!');
        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Finds the Questionanswer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return Questionanswer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $accessCheck = true)
    {
        if (($model = Questionanswer::findOne($id)) !== null) {
            
            if ($accessCheck && ! ($model->isAllowed()))
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
                    $this->menu['manage'] = [
                        'label' => '<span class="glyphicon glyphicon-list"></span>',
                        'title' => Yii::t('app', 'Manage'),
                        'url' => [
                            'index'
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                }
                break;
            case 'index':
                {
                    $this->menu['add'] = [
                        'label' => '<span class="glyphicon glyphicon-plus"></span>',
                        'title' => Yii::t('app', 'Add'),
                        'url' => [
                            'add'
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                    $this->menu['clear'] = [
                        'label' => '<span class=" glyphicon glyphicon-remove"></span>',
                        'title' => Yii::t('app', 'Clear'),
                        'url' => [
                            'clear'
                        ],
                        'visible' => User::isAdmin()
                    ];
                }
                break;
            case 'update':
                {
                    $this->menu['add'] = [
                        'label' => '<span class="glyphicon glyphicon-plus"></span>',
                        'title' => Yii::t('app', 'add'),
                        'url' => [
                            'add'
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                    $this->menu['manage'] = [
                        'label' => '<span class="glyphicon glyphicon-list"></span>',
                        'title' => Yii::t('app', 'Manage'),
                        'url' => [
                            'index'
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                }
                break;
            default:
            case 'view':
                {
                    $this->menu['manage'] = [
                        'label' => '<span class="glyphicon glyphicon-list"></span>',
                        'title' => Yii::t('app', 'Manage'),
                        'url' => [
                            'index'
                        ],
                        'visible' => false
                    ];
                    if ($model != null) {
                        $this->menu['update'] = [
                            'label' => '<span class="glyphicon glyphicon-pencil"></span>',
                            'title' => Yii::t('app', 'Update'),
                            'url' => $model->getUrl('update'),
                            'visible' => false
                        ];
                        $this->menu['delete'] = [
                            'label' => '<span class="glyphicon glyphicon-trash"></span>',
                            'title' => Yii::t('app', 'Delete'),
                            'url' => $model->getUrl('delete')
                            // 'visible' => User::isAdmin ()
                        ];
                    }
                }
        }
    }
}
