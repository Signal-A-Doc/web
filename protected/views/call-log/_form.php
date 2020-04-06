<?php

use yii\helpers\Html;
use app\components\TActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CallLog */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php echo strtoupper(Yii::$app->controller->action->id); ?>
                        </header>
<div class="panel-body">

    <?php 
$form = TActiveForm::begin([
					 'layout' => 'horizontal',
						'id'	=> 'call-log-form',
						]);
						
						
echo $form->errorSummary($model);	
?>





		 <?php echo $form->field($model, 'user_id')->dropDownList($model->getUserOptions(), ['prompt' => '']) ?>
	 		


		 <?php echo $form->field($model, 'session_id')->dropDownList($model->getSessionOptions(), ['prompt' => '']) ?>
	 		


		 <?php echo $form->field($model, 'appointment_id')->dropDownList($model->getAppointmentOptions(), ['prompt' => '']) ?>
	 		


		 <?php /*echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) ?>
	 		


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'call-log-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	</div>

    <?php TActiveForm::end(); ?>

</div>
