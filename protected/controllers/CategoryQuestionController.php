<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author    : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */
namespace app\controllers;

use Yii;
use app\models\CategoryQuestion;
use app\models\CategoryQuestionRepeateType;
use app\models\search\CategoryQuestion as CategoryQuestionSearch;
use app\components\TController;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl;
use yii\filters\AccessRule;
use app\models\User;
use yii\web\HttpException;
use app\components\TActiveForm;

/**
 * CategoryQuestionController implements the CRUD actions for CategoryQuestion model.
 */
class CategoryQuestionController extends TController
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
                            'delete',
                            'index',
                            'add',
                            'view',
                            'update',
                            'clone',
                            'ajax',
                            'mass'
                        ],
                        'allow' => true,
                        'matchCallback' => function () {
                            return User::isAdmin();
                        }
                    ],
                    [
                        'actions' => [

                            'view'
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
     * Lists all CategoryQuestion models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CategoryQuestionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $this->updateMenuItems();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Displays a single CategoryQuestion model.
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
     * Creates a new CategoryQuestion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionAdd()
    {
        $model = new CategoryQuestion();
        $model->loadDefaultValues();
        $model->state_id = CategoryQuestion::STATE_ACTIVE;

        $model->checkRelatedData([
            'created_by_id' => User::class
        ]);
        $post = \yii::$app->request->post();
        if (\yii::$app->request->isAjax && $model->load($post)) {
            \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post)) {
            $dbTransaction = \Yii::$app->db->beginTransaction();
        try {
                if($model->save())
                {
                    if($model->type_id == CategoryQuestion::TYPE_REPEAT)
                    {
                        foreach ($model->repeated_type as $key => $value) {
                           $repeated_type = new CategoryQuestionRepeateType();
                           $repeated_type->category_question_id = $model->id;
                           $repeated_type->type_id = $value;   
                           if (! $repeated_type->save()) {
                            $dbTransaction->rollBack();
                            \Yii::$app->getSession()->setFlash('error', "Error !!" . $repeated_type->getErrorsString());
                                 return $this->redirect(\Yii::$app->request->referrer);
                            } 
                                            
                       }
                    }
                    $dbTransaction->commit();
                    \Yii::$app->getSession()->setFlash('success', "Added successfully");
                    return $this->redirect($model->getUrl());
                }
                else{
                    \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
                    return $this->redirect(\Yii::$app->request->referrer);
                }
        }catch (Exception $e) {
            $dbTransaction->rollBack();
             \Yii::$app->getSession()->setFlash('error', "Error !!" . $e->getMessage());
            return $this->redirect(\Yii::$app->request->referrer);
        }
        }
        $this->updateMenuItems();
        return $this->render('add', [
            'model' => $model
        ]);
    }

    /**
     * Updates an existing CategoryQuestion model.
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
     * Clone an existing CategoryQuestion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionClone($id)
    {
        $old = $this->findModel($id);

        $model = new CategoryQuestion();
        $model->loadDefaultValues();
        $model->state_id = CategoryQuestion::STATE_ACTIVE;

        $model->id = $old->id;

        $model->title = $old->title;

        $model->category_id = $old->category_id;
        $model->state_id = $old->state_id;
        $model->created_on = $old->created_on;

        $model->updated_on = $old->updated_on;
        $model->created_by_id = $old->created_by_id;

        $post = \yii::$app->request->post();
        if (\yii::$app->request->isAjax && $model->load($post)) {
            \yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load($post)) {
             $dbTransaction = \Yii::$app->db->beginTransaction();
        try {
                if($model->save())
                {
                    if($model->type_id == CategoryQuestion::TYPE_REPEAT)
                    {
                        $questionType = CategoryQuestionRepeateType::find()->where(['category_question_id'=>$model->id]);
                        foreach ($questionType->each() as $type) {
                        $type->delete();
                    }
                        foreach ($model->repeated_type as $key => $value) {
                           $repeated_type = new CategoryQuestionRepeateType();
                           $repeated_type->category_question_id = $model->id;
                           $repeated_type->type_id = $value;   
                           if (! $repeated_type->save()) {
                            $dbTransaction->rollBack();
                            \Yii::$app->getSession()->setFlash('error', "Error !!" . $repeated_type->getErrorsString());
                                 return $this->redirect(\Yii::$app->request->referrer);
                            } 
                                            
                       }
                    
                    }
                    $dbTransaction->commit();
                    \Yii::$app->getSession()->setFlash('success', "Updated successfully");
                    return $this->redirect($model->getUrl());
                }
                else{
                    \Yii::$app->getSession()->setFlash('error', "Error !!" . $model->getErrorsString());
                    return $this->redirect(\Yii::$app->request->referrer);
                }
        }catch (Exception $e) {
            $dbTransaction->rollBack();
             \Yii::$app->getSession()->setFlash('error', "Error !!" . $e->getMessage());
            return $this->redirect(\Yii::$app->request->referrer);
        }
            return $this->redirect($model->getUrl());
        }
        $this->updateMenuItems($model);
        return $this->render('update', [
            'model' => $model
        ]);
    }

    /**
     * Deletes an existing CategoryQuestion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);

        if (\yii::$app->request->post()) {
            $model->delete();
            return $this->redirect([
                'index'
            ]);
        }
        return $this->render('delete', [
            'model' => $model
        ]);
    }

    /**
     * Truncate an existing CategoryQuestion model.
     * If truncate is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionClear($truncate = true)
    {
        $query = CategoryQuestion::find();
        foreach ($query->each() as $model) {
            $model->delete();
        }
        if ($truncate) {
            CategoryQuestion::truncate();
        }
        \Yii::$app->session->setFlash('success', 'CategoryQuestion Cleared !!!');
        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Finds the CategoryQuestion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return CategoryQuestion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $accessCheck = true)
    {
        if (($model = CategoryQuestion::findOne($id)) !== null) {

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
                        'label' => '<span class="glyphicon glyphicon-remove"></span>',
                        'title' => Yii::t('app', 'Clear'),
                        'url' => [
                            'clear'
                        ],
                        'htmlOptions' => [
                            'data-confirm' => "Are you sure to delete these items?"
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
                        ]
                        // 'visible' => User::isAdmin ()
                    ];
                    if ($model != null) {
                        $this->menu['clone'] = array(
                            'label' => '<span class="glyphicon glyphicon-file">Clone</span>',
                            'title' => Yii::t('app', 'Clone'),
                            'url' => $model->getUrl('clone')
                            // 'visible' => User::isAdmin ()
                        );
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
