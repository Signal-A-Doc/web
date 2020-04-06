<?php
use app\models\User;

/**
 *
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author : Shiv Charan Panjeta < shiv@toxsl.com >
 */

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->title = Yii::t ( 'app', 'Users' );

if (Yii::$app->controller->action->id == 'doctor-index') {
    $state = Yii::$app->request->get('state');
    if (! empty($state)) {
        if ($state == User::STATE_ACTIVE) {
            $title = Yii::t('app', 'Approved  Doctors');
        } elseif ($state == User::STATE_REJECT) {
            $title = Yii::t('app', 'Rejected  Doctors');
        } else {
            $title = Yii::t('app', 'Doctors');
        }
    } else {
        $title = Yii::t('app', 'Doctors');
    }
} else {
    $title = Yii::t('app', 'Patients');
}
?>



<div class="wrapper">
	<div class="user-index">
		<div class=" panel ">
			<?=\app\components\PageHeader::widget(['title' => $title]);?>
		</div>

		<div class="panel panel-margin">
			<div class="panel-body">
				<div class="content-section clearfix">
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

