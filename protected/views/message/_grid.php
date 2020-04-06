<?php
use app\components\TGridView;
use yii\helpers\Html;

/**
 *
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\Message $searchModel
 */

?>

    <?=TGridView::widget ( [ 'dataProvider' => $dataProvider,'filterModel' => $searchModel,'columns' => [ [ 'class' => 'yii\grid\SerialColumn' ],'id','session_id',[ 'attribute' => 'state_id','filter' => $searchModel->getStateOptions (),'value' => function ($data) {return $data->getStateOptions ( $data->state_id );} ],[ 'attribute' => 'type_id','filter' => $searchModel->getTypeOptions (),'value' => function ($data) {return $data->getTypeOptions ( $data->type_id );} ],'to_id','from_id',
            /* 'group_id',*/
            /* 'create_time:datetime',*/
            /* 'update_time:datetime',*/
            /* 'create_user_id',*/

            [ 'class' => 'app\components\ActionColumn','template' => '{view}{update}{delete}','header' => '<a>' . Yii::t ( 'app', '<a>Actions</a>' ) . '</a>','buttons' => [ 'delete' => function ($url, $model) {return Html::a ( '<span class="glyphicon glyphicon-trash"></span>', [ 'delete','id' => $model->id ], [ 'class' => '','data' => [ 'confirm' => Yii::t ( 'app', 'Are you sure you want to delete this item?' ),'method' => 'post' ] ] );} ] ] ] ] );?>


