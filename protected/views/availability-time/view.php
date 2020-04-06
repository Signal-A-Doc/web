<?php

use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\AvailabilityTime */

/*$this->title =  $model->label() .' : ' . $model->id; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Availability Times'), 'url' => ['index']];
$this->params['breadcrumbs'][] = (string)$model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div
			class="availability-time-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
    <?php echo \app\components\TDetailView::widget([
    	'id'	=> 'availability-time-detail-view',
        'model' => $model,
        'options'=>['class'=>'table table-bordered'],
        'attributes' => [
//             [
// 			'attribute' => 'id',
// 			'format'=>'raw',
// 			'value' => $model->getRelatedDataLink('id'),
// 			],
//             [
// 			'attribute' => 'doctor_availability_id',
// 			'format'=>'raw',
// 			'value' => $model->getRelatedDataLink('doctor_availability_id'),
// 			],
            'date',
            'start_time',
            'end_time',
            'price',
            /*'description:html',*/
            [
			'attribute' => 'state_id',
			'format'=>'raw',
			'value' => $model->getStateBadge(),],
//             [
// 			'attribute' => 'type_id',
// 			'value' => $model->getType(),
// 			],
            'created_on:datetime',
            'updated_on:datetime',
            [
			'attribute' => 'created_by_id',
			'format'=>'raw',
			'value' => $model->getRelatedDataLink('created_by_id'),
			],
        ],
    ]) ?>


<?php  echo $model->description;?>


		<?php				echo UserAction::widget ( [
						'model' => $model,
						'attribute' => 'state_id',
						'states' => $model->getStateOptions ()
				] );
				?>

		</div>
</div>
 
	
</div>
