<?php


/* @var $this yii\web\View */
/* @var $model app\models\AppointmentPlans */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Appointment Plans',
]) . ' ' . $model->id; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Appointment Plans'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class=" panel ">
		<div
			class="appointment-plans-update">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
	</div>
	</div>


	<div class="content-section clearfix panel">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

