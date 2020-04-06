<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
use app\components\TActiveForm;
use app\models\User;
use yii\helpers\Html;
use app\models\Workprofile;
use app\models\PatientMedicalInformation;
use app\models\Patientsymptom;
use app\models\Doctorspecialization;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
/* @var $work Workprofile*/
/* @var $medicalinformation PatientMedicalInformation*/
/* @var $symptom Patientsymptom*/
/* @var $specialization Doctorspecialization*/
?>

<div class="panel-body">

    <?php

    $form = TActiveForm::begin([
        'id' => 'user-form',
        'enableClientValidation' => true
    ]);
    ?>

	<div class="col-md-6">
	<?=$form->field($model, 'first_name')->textInput(['maxlength' => 255])?>
<?=$form->field($model, 'last_name')->textInput(['maxlength' => 55])?>

    <?=$form->field($model, 'email')->textInput(['maxlength' => 128])?>

   <?php

if (Yii::$app->controller->action->id != 'update') {
    ?>
		<?=$form->field($model, 'password')->passwordInput(['maxlength' => true])?>
		<?=$form->field($model, 'confirm_password')->passwordInput(['maxlength' => true])?>

     <?php
}
?>
	</div>

	<div class="col-md-6">
	
	 <?=$form->field($model, 'contact_no')->textInput(['maxlength' => 11])?>
	  <?php
$min_date = date("Y", strtotime(" -50 years"));
$start_date = date("Y");
echo $form->field($model, 'date_of_birth')->widget(yii\jui\DatePicker::class, [
    // 'dateFormat' => 'php:Y-m-d',
    'options' => [
        'class' => 'form-control',
        'readonly' => 'readonly'
    ],
    'clientOptions' => [
        // 'defaultDate' => $min_date,
        'changeMonth' => true,
        'changeYear' => true,
        'yearRange' => $min_date . ':' . $start_date
    ]
])?>
         
	 
	 <?=$form->field($model, 'address')->textInput(['maxlength' => 11])?>
	  <?=$form->field($model, 'country')->textInput(['maxlength' => 11])?>
	  <?php
echo $form->field($model, 'gender')->radioList($model->getGenderOptions(), [
    'item' => function ($index, $label, $name, $checked, $value) {

        $return = '<br><label class="modal-radio">';
        $return .= '<input type="radio" name="' . $name . '" value="' . $value . '" tabindex="3">';
        $return .= '<i></i>';
        $return .= '<span>' . ucwords($label) . '</span>';
        $return .= '</label>';

        return $return;
    }
])?>
 
	  

   <?=$form->field($model, 'profile_file')->fileInput()?>
	  
	  </div>
	  <?php

if (Yii::$app->controller->action->id == 'add-patient') {
    ?>
	  <h2>Medical-information</h2>
	<div class="col-md-6">
	  
	   <?=$form->field($medicalinformation, 'blood_group')->dropDownList($medicalinformation->getBloodGroupOptions(), ['prompt' => ''])?>
	    <?=$form->field($medicalinformation, 'weight')->textInput(['maxlength' => 11])?>
	     <?=$form->field($medicalinformation, 'height')->textInput(['maxlength' => 11])?>
	  	   <?php

    echo $form->field($symptom, 'categories')->widget(Select2::classname(), [
        'data' => $symptom->getTypeOptions(),
        'options' => [
            'multiple' => true,
            'placeholder' => 'Select'
        ],
        'pluginOptions' => [
            'allowClear' => true
        ]
    ]);
    ?>
	     
	     <?php
} else {
    ?>
	   <h2>Work Profile</h2>
	
	   <?=$form->field($work, 'professional_status')->dropDownList($work->getProfessionalStatusOption(), ['prompt' => 'Select'])?>
	   <?=$form->field($work, 'MDCN_folio_number')->textInput(['maxlength' => 11])?>
	   <?=$form->field($work, 'MDCN_certificate')->fileInput()?>
	    <?php
    echo $form->field($work, 'professional_indemnity')->radioList($model->getTypeOptions(), [
        'item' => function ($index, $label, $name, $checked, $value) {

            $return = '<br><label class="modal-radio">';
            $return .= '<input type="radio" name="' . $name . '" value="' . $value . '" tabindex="3">';
            $return .= '<i></i>';
            $return .= '<span>' . ucwords($label) . '</span>';
            $return .= '</label>';

            return $return;
        }
    ])?>
	 <?=$form->field($work, 'registeration_number')->textInput(['maxlength' => 11])?>
	    <?php
    $min = date("Y", strtotime(" -50 years"));
    $start = date("Y");
    echo $form->field($work, 'issued_date')->widget(yii\jui\DatePicker::class, [
        // 'dateFormat' => 'php:Y-m-d',
        'options' => [
            'class' => 'form-control',
            'readonly' => 'readonly'
        ],
        'clientOptions' => [
            // 'defaultDate' => $min_date,
            'changeMonth' => true,
            'changeYear' => true,
            'yearRange' => $min . ':' . $start
        ]
    ])?>
         
         	    <?php
    $min_expiry = date("Y");
    $start_expiry = date("Y", strtotime(" +20 years"));
    echo $form->field($work, 'expiry_date')->widget(yii\jui\DatePicker::class, [
        // 'dateFormat' => 'php:Y-m-d',
        'options' => [
            'class' => 'form-control',
            'readonly' => 'readonly'
        ],
        'clientOptions' => [
            // 'defaultDate' => $min_date,
            'changeMonth' => true,
            'changeYear' => true,
            'yearRange' => $min_expiry . ':' . $start_expiry
        ]
    ])?>
	     <?=$form->field($work, 'profile_summary')->textarea()?>
	     
		 <?php

    echo $form->field($specialization, 'categories')->widget(Select2::classname(), [
        'data' => $specialization->getTypeOptions(),
        'options' => [
            'multiple' => true,
            'placeholder' => 'Select'
        ],
        'pluginOptions' => [
            'allowClear' => true
        ]
    ]);
    ?>
	   <?php
}
?>
 
	  

	
	</div>

	<div
		class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom">
		<div class="form-group text-center">
        <?=Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['id' => 'user-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-success'])?>
    </div>
	</div>

    <?php

    TActiveForm::end();
    ?>

</div>


