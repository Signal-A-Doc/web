<?php


/* @var $this yii\web\View */
/* @var $model app\models\Doctorprofessionalstatus */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Doctorprofessionalstatus',
]) . ' ' . $model->title; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Doctorprofessionalstatuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class=" panel ">
		<div
			class="doctorprofessionalstatus-update">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
	</div>
	</div>


	<div class="content-section clearfix panel">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

