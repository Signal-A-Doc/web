<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Feed */

/* $this->title = Yii::t('app', 'Add');*/
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Feeds'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Add');
?>

<div class="wrapper">
   <div class="feed-create">
	 <div class="panel panel-info">
	<div class="panel-heading"><?=  \app\components\PageHeader::widget(); ?> </div>


	<div class="panel-body">

		<?= $this->render ( '_form', [ 'model' => $model ] )?>
		</div>
</div>
</div>
</div>


