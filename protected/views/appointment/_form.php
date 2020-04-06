<?php

use yii\helpers\Html;
use app\components\TActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Appointment */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php echo strtoupper(Yii::$app->controller->action->id); ?>
                        </header>
<div class="panel-body">

    <?php 
$form = TActiveForm::begin([
					// 'layout' => 'horizontal',
						'id'	=> 'appointment-form',
						]);
						
						
echo $form->errorSummary($model);	
?>





<div class="col-md-6">

	
		 <?php echo $form->field($model, 'doctor_id')->dropDownList($model->getDoctorOptions(), ['prompt' => '']) ?>
	 		


		 <?php /*echo $form->field($model, 'availability_id')->dropDownList($model->getAvailabilityOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php echo $form->field($model, 'availability_time_id')->dropDownList($model->getAvailabilityTimeOptions(), ['prompt' => '']) ?>
	 		


		 <?php /*echo $form->field($model, 'document_ids')->textInput(['maxlength' => 256]) */ ?>
	 		


		 <?php echo $form->field($model, 'name')->textInput(['maxlength' => 1024]) ?>
	 		


		 <?php echo $form->field($model, 'health_issue')->textInput(['maxlength' => 1024]) ?>
	 		


		 <?php /*echo $form->field($model, 'reschedule_reason')->textInput(['maxlength' => 1024]) */ ?>
	 		


		 <?php /*echo $form->field($model, 'cancel_reason')->textInput(['maxlength' => 256]) */ ?>
	 		


		 <?php echo $form->field($model, 'payment_status')->textInput() ?>
	 		


		 <?php echo $form->field($model, 'age')->textInput() ?>
	 		

	</div>
	<div class="col-md-6">

		
		 <?php echo $form->field($model, 'price')->textInput(['maxlength' => 1024]) ?>
	 		


		 <?php echo $form->field($model, 'discount')->textInput() ?>
	 		


		 <?php echo $form->field($model, 'final_price')->textInput(['maxlength' => 256]) ?>
	 		


		 <?php echo $form->field($model, 'gender')->textInput() ?>
	 		


		 <?php echo $form->field($model, 'date')->widget(yii\jui\DatePicker::className(),
			[
					//'dateFormat' => 'php:Y-m-d',
	 				'options' => [ 'class' => 'form-control' ],
	 				'clientOptions' =>
	 				[
			//'minDate' => 0,
			'changeMonth' => true,'changeYear' => true ] ]) ?>
	 		


		 <?php echo $form->field($model, 'time')->widget(kartik\widgets\TimePicker::className(),[]) ?>
	 		


		 <?php /*echo $form->field($model, 'prescription_image')->textInput(['maxlength' => 256]) */ ?>
	 		


		 <?php /*echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>
	 			</div>

	


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'appointment-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	</div>

    <?php TActiveForm::end(); ?>

</div>
