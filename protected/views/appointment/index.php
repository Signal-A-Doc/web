<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Appointment;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Appointment */
/* @var $dataProvider yii\data\ActiveDataProvider */

/* $this->title = Yii::t('app', 'Index'); */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Appointments'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = Yii::t('app', 'Index');
$state = Yii::$app->request->get('state');
if (! empty($state)) {
    if ($state == Appointment::STATE_COMPLETED) {
        $title = Yii::t('app', 'Completed  Appointments');
    } elseif ($state == Appointment::STATE_ACCEPT) {
        $title = Yii::t('app', 'Pending Appointments');
    } elseif ($state == Appointment::STATE_ACTIVE) {
        $title = Yii::t('app', 'Upcoming  Appointments');
    } else {
        $title = Yii::t('app', 'Appointments');
    }
} else {
    $title = Yii::t('app', 'Appointments');
}
?>
<div class="wrapper">
	<div class="user-index">
		<div class=" panel ">
			
				<div
					class="appointment-index">

<?=\app\components\PageHeader::widget(['title' => $title]);?>

    <?php
    // echo $this->render('_search', ['model' => $searchModel]); ?>
  </div>
			
		</div>
		<div class="panel panel-margin">
			<div class="panel-body">
				<div class="content-section clearfix">
					<header class="panel-heading head-border">   <?php

    echo strtoupper(Yii::$app->controller->action->id);
    ?> </header>
		<?php

echo $this->render('_grid', [
    'dataProvider' => $dataProvider,
    'searchModel' => $searchModel
]);
?>
</div>
			</div>
		</div>
	</div>

</div>

