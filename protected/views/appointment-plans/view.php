<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\AppointmentPlans */

/* $this->title = $model->label() .' : ' . $model->id; */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Appointment Plans'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div class="appointment-plans-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['title'=>'Appointment Plan']); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
    <?php
    
    echo \app\components\TDetailView::widget([
        'id' => 'appointment-plans-detail-view',
        'model' => $model,
        'options' => [
            'class' => 'table table-bordered'
        ],
        'attributes' => [
            'id',
            [
                'attribute' => 'doctor_id',
                'format' => 'raw',
                'value' => $model->getRelatedDataLink('doctor_id')
            ],
            'amount',
            /*'description:html',*/
            [
                'attribute' => 'state_id',
                'format' => 'raw',
                'value' => $model->getStateBadge()
            ],
            [
                'attribute' => 'type_id',
                'value' => $model->getType()
            ],
            'created_on:datetime',
            'updated_on:datetime',
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => $model->getRelatedDataLink('created_by_id')
            ]
        ]
    ])?>


<?php  echo $model->description;?>


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
