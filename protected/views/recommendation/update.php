<?php


/* @var $this yii\web\View */
/* @var $model app\models\Recommendation */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Recommendation',
]) . ' ' . $model->title; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Recommendations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
	<div class=" panel ">
		<div
			class="recommendation-update">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
	</div>
	</div>


	<div class="content-section clearfix panel">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

