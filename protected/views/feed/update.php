<?php


/* @var $this yii\web\View */
/* @var $model app\models\Feed */

/* $this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Feed',
]) . ' ' . $model->id; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Feeds'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="wrapper">
 
  <div class="feed-update">
   <div class=" panel panel-info">
   <div class="panel-heading">
	<?=  \app\components\PageHeader::widget(['model' => $model]); ?>
  </div>


	<div class="panel-body">
		<?= $this->render ( '_form', [ 'model' => $model ] )?>
  </div>
</div>
</div>
</div>