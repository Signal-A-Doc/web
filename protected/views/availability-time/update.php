<?php


/* @var $this yii\web\View */
/* @var $model app\models\AvailabilityTime */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Availability Time',
]) . ' ' . $model->id; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Availability Times'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class=" panel ">
		<div
			class="availability-time-update">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
	</div>
	</div>


	<div class="content-section clearfix panel">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

