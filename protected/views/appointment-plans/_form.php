<?php
use yii\helpers\Html;
use app\components\TActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\AppointmentPlans */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php echo strtoupper(Yii::$app->controller->action->id); ?>
                        </header>
<div class="panel-body">

    <?php
    $form = TActiveForm::begin([
        'layout' => 'horizontal',
        'id' => 'appointment-plans-form'
    ]);
    
    echo $form->errorSummary($model);
    ?>





		 <?php echo $form->field($model, 'doctor_id')->dropDownList($model->getDoctorOptions(), ['prompt' => 'Select Doctor']) ?>
	 		


		 <?php echo $form->field($model, 'amount')->textInput(['maxlength' => 256]) ?>
	 		


		 <?php echo  $form->field($model, 'description')->widget ( app\components\TRichTextEditor::className (), [ 'options' => [ 'rows' => 6 ],'preset' => 'basic' ] ); //$form->field($model, 'description')->textarea(['rows' => 6]); ?>
	 		


		 <?php /*echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => 'Select Plan Type']) ?>
	 		


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'appointment-plans-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	</div>

    <?php TActiveForm::end(); ?>

</div>
