<?php
use app\components\useraction\UserAction;
/* @var $this yii\web\View */
/* @var $model app\models\ThermometerLocation */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Thermometer Locations'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
?>
<div class="wrapper">
	<div class="card">
		<div class="thermometer-location-view">
         <?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>
      </div>
	</div>
	<div class="card">
		<div class="card-body">
         <?php
        echo \app\components\TDetailView::widget([
            'id' => 'thermometer-location-detail-view',
            'model' => $model,
            'options' => [
                'class' => 'table table-bordered'
            ],
            'attributes' => [
                'title',
                [
                    'attribute' => 'state_id',
                    'format' => 'raw',
                    'value' => $model->getStateBadge()
                ]
            ]
        ])?>
         <?php  ?>
         <?php

        echo UserAction::widget([
            'model' => $model,
            'attribute' => 'state_id',
            'states' => $model->getStateOptions()
        ]);
        ?>
      </div>
	</div>


</div>