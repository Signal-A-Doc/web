<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\controllers;

use Yii;
use app\models\Illness;
use app\models\search\Illness as IllnessSearch;
use app\components\TController;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use app\models\User;
use yii\web\HttpException;
use app\components\TActiveForm;

/**
 * IllnessController implements the CRUD actions for Illness model.
 */
class IllnessController extends TController
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
                            'mass'
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
     * Lists all Illness models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new IllnessSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $this->updateMenuItems();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionMass()
    {
        \Yii::$app->response->format = 'json';
        $response['status'] = 'NOK';
        $Ids = Yii::$app->request->post('ids', []);

        if (! empty($Ids)) {
            foreach ($Ids as $Id) {
                $model = Illness::findOne($Id);
                if (! empty($model && $model instanceof Illness)) {

                    $model->delete();
                    $response['status'] = 'OK';
                }
            }
        }

        return $response;
    }

    /**
     * Displays a single Illness model.
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

    /**
     * Creates a new Illness model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd()
    {
        $model = new Illness();
        $model->loadDefaultValues();
        $model->state_id = Illness::STATE_ACTIVE;
        $post = \yii::$app->request->post();
        if (\yii::$app->request->isAjax && $model->load($post)) {
            \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post)) {
            $model->saveUploadedFile($model, 'image_file');
            if ($model->save()) {

                \Yii::$app->session->setFlash('success', \Yii::t('app', 'Illness Added Successfully !!!'));

                return $this->redirect($model->getUrl());
            }
        }
        $this->updateMenuItems();
        return $this->render('add', [
            'model' => $model
        ]);
    }

    /**
     * Updates an existing Illness model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $old_image = $model->image_file;
        $post = \yii::$app->request->post();
        if (\yii::$app->request->isAjax && $model->load($post)) {
            \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post)) {
            $model->saveUploadedFile($model, 'image_file', $old_image);
            if ($model->save()) {
                return $this->redirect($model->getUrl());
            }
        }
        $this->updateMenuItems($model);
        return $this->render('update', [
            'model' => $model
        ]);
    }

    /**
     * Deletes an existing Illness model.
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
     * Truncate an existing Illness model.
     * If truncate is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionClear($truncate = true)
    {
        $query = Illness::find();
        foreach ($query->each() as $model) {
            $model->delete();
        }
        if ($truncate) {
            Illness::truncate();
        }
        \Yii::$app->session->setFlash('success', \Yii::t('app', 'Illness Cleared !!!'));
        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Finds the Illness model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return Illness the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $accessCheck = true)
    {
        if (($model = Illness::findOne($id)) !== null) {

            if ($accessCheck && ! ($model->isAllowed()))
                throw new HttpException(403, Yii::t('app', 'You are not allowed to access this page.'));

            return $model;
        } else {
            throw new NotFoundHttpException(\Yii::t('app', 'The requested page does not exist.'));
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
                        'visible' => false
                    ];
                }
                break;
            case 'update':
                {
                    // $this->menu ['add'] = [
                    // 'label' => '<span class="glyphicon glyphicon-plus"></span>',
                    // 'title' => Yii::t ( 'app', 'add' ),
                    // 'url' => [
                    // 'add'
                    // ],
                    // // 'visible' => User::isAdmin ()
                    // ];
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
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                    if ($model != null) {
                        $this->menu['update'] = [
                            'label' => '<span class="glyphicon glyphicon-pencil"></span>',
                            'title' => Yii::t('app', 'Update'),
                            'url' => $model->getUrl('update')
                            // 'visible' => User::isAdmin ()
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
