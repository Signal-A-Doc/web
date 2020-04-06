<?php

use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\Appointment */

/*$this->title =  $model->label() .' : ' . $model->name; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Appointments'), 'url' => ['index']];
$this->params['breadcrumbs'][] = (string)$model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div
			class="appointment-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
    <?php echo \app\components\TDetailView::widget([
    	'id'	=> 'appointment-detail-view',
        'model' => $model,
        'options'=>['class'=>'table table-bordered'],
        'attributes' => [
            [
			'attribute' => 'id',
			'format'=>'raw',
			'value' => $model->getRelatedDataLink('id'),
			],
            [
			'attribute' => 'doctor_id',
			'format'=>'raw',
			'value' => $model->getRelatedDataLink('doctor_id'),
			],
            'availability_id',
            'availability_time_id:datetime',
            'document_ids',
            'name',
            'health_issue',
            'reschedule_reason',
            'cancel_reason',
            'payment_status',
            'age',
            'price',
            'discount',
            'final_price',
            'gender',
            'date:date',
            'time:time',
            'prescription_image',
            [
			'attribute' => 'type_id',
			'value' => $model->getType(),
			],
            [
			'attribute' => 'state_id',
			'format'=>'raw',
			'value' => $model->getStateBadge(),],
            'created_on:datetime',
            'updated_on:datetime',
            [
			'attribute' => 'created_by_id',
			'format'=>'raw',
			'value' => $model->getRelatedDataLink('created_by_id'),
			],
        ],
    ]) ?>


<?php  ?>


		<?php				echo UserAction::widget ( [
						'model' => $model,
						'attribute' => 'state_id',
						'states' => $model->getStateOptions ()
				] );
				?>

		</div>
</div>
 


	<div class=" panel ">
				<div class=" panel-body ">
					<div
						class="appointment-panel">

<?php
$this->context->startPanel();
	$this->context->addPanel('Appointmentillnesses', 'appointmentillnesses', 'Appointmentillness',$model);

$this->context->endPanel();
?>
				</div>
				</div>
			</div>

	<div class=" panel ">
		<div class=" panel-body ">

<?php echo CommentsWidget::widget(['model'=>$model]); ?>
			</div>
	</div>
</div>
