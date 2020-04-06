<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Patientsymptom */

/* $this->title = Yii::t('app', 'Add');*/
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Patientsymptoms'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Add');
?>

<div class="wrapper">
	<div class="panel">

		<div
			class="patientsymptom-create">
	<?=  \app\components\PageHeader::widget(); ?>
</div>

	</div>

	<div class="content-section clearfix panel">

		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>


