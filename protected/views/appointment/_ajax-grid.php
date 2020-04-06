<?php
use app\components\TGridView;
use yii\grid\GridView;
use yii\widgets\Pjax;
/**
 *
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\Appointment $searchModel
 */

?>
<?php

Pjax::begin([
    'id' => 'appointment-pjax-ajax-grid',
    'enablePushState' => false,
    'enableReplaceState' => false
]);
?>
    <?php

    echo TGridView::widget([
        'id' => 'appointment-ajax-grid-view',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
            'class' => 'table table-bordered'
        ],
        'columns' => [

            [
                'attribute' => 'id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('id');
                }
            ],
            [
                'attribute' => 'doctor_id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('doctor_id');
                }
            ],
            'availability_time_id:datetime',
            'name',
            'health_issue',
            'payment_status',
            'age',
            'price',

            [
                'class' => 'app\components\TActionColumn',
                'header' => '<a>Actions</a>'
            ]
        ]
    ]);
    ?>
<?php

Pjax::end();
?>

