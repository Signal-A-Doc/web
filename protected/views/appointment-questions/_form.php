<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\User;
use app\models\AppointmentQuestions;
/* @var $this yii\web\View */
/* @var $model app\models\AppointmentQuestions */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="card-header">
   <?php echo strtoupper(Yii::$app->controller->action->id); ?>
</header>
<div class="card-body">
   <?php

$form = TActiveForm::begin([

    'id' => 'appointment-questions-form',
    'options' => [
        'class' => 'row'
    ]
]);
echo $form->errorSummary($model);
?>
                  <?php echo $form->field($model, 'title')->textInput(['maxlength' => 256]) ?>
                                                <?php echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) ?>
                  
                  
                  
                  <div id="multiple_options">
                  
                  <?=$form->field($model, 'multiple_type[]')->checkboxList(array(AppointmentQuestions::TYPE_TEXT => "Text",AppointmentQuestions::TYPE_BODY_TEMPERATURE => "DropDown",AppointmentQuestions::TYPE_TIME => "Time"));?>
                  
                  </div>
                  
                  
                        <?php if(User::isAdmin()){?>      
                        
                        <?php echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>
      					<?php }?>            
      					
      					<div class="col-md-12 text-right">
      <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'appointment-questions-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
   </div>
   <?php TActiveForm::end(); ?>
</div>


<script type="text/javascript">
   
   $(document).ready(function() {
      $("#multiple_options").hide();
   });

   
 $("#appointmentquestions-type_id").change(function(){
     var value = this.value;
   if(value == "<?= AppointmentQuestions::TYPE_MULTIPLE_FIELD ?>")
   {
	   $("#multiple_options").show();
  }
   else
   {
	   $("#multiple_options").hide();
   }
  });

</script>