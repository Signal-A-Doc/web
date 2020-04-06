<?php


/* @var $this yii\web\View */
/* @var $model app\models\DoctorConsultationAvailability */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Doctor Consultation Availabilities'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class="card">
		<div class="doctor-consultation-availability-update">
			<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
		</div>
	</div>
	<div class="card">
		<?= $this->render ( '_form', [ 'model' => $model ] )?>
	</div>
</div>

