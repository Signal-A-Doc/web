<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AppointmentQuestionMultipleType */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Appointment Question Multiple Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Index');;
?>
<div class="wrapper">
		<div class="card">
			<div class="appointment-question-multiple-type-index">
				<?=  \app\components\PageHeader::widget(); ?>
			</div>
			
		</div>
		<div class="card">
			<header class="card-header"> 
			  <?php echo strtoupper(Yii::$app->controller->action->id); ?> 
			</header>
			<div class="card-body">
				<div class="content-section clearfix">
					<?php echo $this->render('_grid', ['dataProvider' => $dataProvider, 'searchModel' => $searchModel]); ?>
				</div>
			</div>
		</div>
</div>

