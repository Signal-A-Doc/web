<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\AppointmentQuestions */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Appointment Questions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Add');
?>

<div class="wrapper">
	<div class="card">
		<div class="appointment-questions-create">
			<?=  \app\components\PageHeader::widget(); ?>
		</div>
	</div>

	<div class="content-section clearfix card">
		<?= $this->render ( '_form', [ 'model' => $model ] )?>
	</div>
</div>


