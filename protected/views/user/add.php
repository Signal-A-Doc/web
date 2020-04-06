<?php
use yii\helpers\Inflector;
use SebastianBergmann\CodeCoverage\Report\PHP;
use app\models\PatientMedicalInformation;
use app\models\Patientsymptom;

/**
 *
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author : Shiv Charan Panjeta < shiv@toxsl.com >
 */

/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $medicalinformation PatientMedicalInformation*/
/* @var $symptom Patientsymptom*/

if (Yii::$app->controller->action->id == "add-doctor") {

    $this->params['breadcrumbs'][] = [
        'label' => 'Doctors',
        'url' => [
            'user/doctor-index'
        ]
    ];

    $this->title = "Doctor";
} else {

    $this->params['breadcrumbs'][] = [
        'label' => 'Patient',
        'url' => [
            'user/patient-index'
        ]
    ];

    $this->title = "Patient";
}

$this->params['breadcrumbs'][] = Inflector::humanize(Yii::$app->controller->action->id);
?>

<div class="wrapper">
	<div class="panel">

		<div class="user-create">
	<?=\app\components\PageHeader::widget(['title' => $this->title]);?>
</div>

	</div>

	<div class="content-section clearfix panel">
	
		<?php

echo $this->render('_form', [
    'model' => $model,
    'medicalinformation' => $medicalinformation,
    'symptom' => $symptom
]);

?></div>
</div>