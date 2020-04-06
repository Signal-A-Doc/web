<?php


/* @var $this yii\web\View */
/* @var $model app\models\DoctorAvailability */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Doctor Availability',
]) . ' ' . $model->id; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Doctor Availabilities'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class=" panel ">
		<div
			class="doctor-availability-update">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
	</div>
	</div>


	<div class="content-section clearfix panel">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

