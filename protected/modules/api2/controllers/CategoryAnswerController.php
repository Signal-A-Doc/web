<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\modules\api2\controllers;

use app\models\CategoryAnswer;
use app\models\User;
use app\modules\api2\components\ApiTxController;
use app\modules\api2\components\TPagination;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\AccessRule;

/**
 * CategoryAnswerController implements the API actions for User model.
 */
class CategoryAnswerController extends ApiTxController
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
                        'answer-list'
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
        $this->modelClass = "app\models\CategoryAnswer";
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
        $this->modelClass = "app\models\CategoryAnswer";
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
        return $this->txDelete($id, "CategoryAnswer");
    }

    public function actionAnswersList($id, $page = null)
    {
        $query = CategoryAnswer::find()->where([
            'question_id' => $id,
            'state_id' => CategoryAnswer::STATE_ACTIVE
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


}
