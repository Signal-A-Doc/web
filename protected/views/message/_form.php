<?php

use yii\helpers\Html;
use app\components\TActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Message */
/* @var $form yii\widgets\ActiveForm */
?>

<div
	class="message-form well">

    <?php $form = TActiveForm::begin([
						'layout' => 'horizontal' 
						]); ?>

    
    <?= $form->field($model, 'session_id')->textInput() ?>


    <?= $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>


    <?= $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) ?>


    <?= $form->field($model, 'to_id')->textInput() ?>


    <?= $form->field($model, 'from_id')->textInput() ?>


    <?= $form->field($model, 'group_id')->textInput() ?>


    <?php //echo $form->field($model, 'create_time')->widget(yii\jui\DatePicker::className(),[]) ?>


    <?php //echo $form->field($model, 'update_time')->widget(yii\jui\DatePicker::className(),[]) ?>


    <?php //echo $form->field($model, 'create_user_id')->textInput() ?>


    

    <div class="form-group text-center">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php TActiveForm::end(); ?>

</div>
