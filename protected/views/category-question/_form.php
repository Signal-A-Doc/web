<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\User;
use app\models\CategoryQuestion;

/* @var $this yii\web\View */
/* @var $model app\models\CategoryQuestion */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
   <?php echo strtoupper(Yii::$app->controller->action->id); ?>
</header>


<div class="content-section clearfix panel">

    
<div class="panel-body">

   <?php    $form = TActiveForm::begin([
    
   'id' => 'category-question-form',
   'options'=>[
   'class'=>'row'
   ]
   ]);
   echo $form->errorSummary($model);    
   ?>
                  <?php echo $form->field($model, 'title')->textInput(['maxlength' => 256]) ?>
                              <?php echo $form->field($model, 'category_id')->dropDownList($model->getCategoryOptions(), ['prompt' => '']) ?>
                              
                              <?php echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) ?>
                              <?= $form->field($model, 'repeated_type[]')->checkboxList(array(
                              CategoryQuestion::TYPE_RADIO => "Radio",
                              CategoryQuestion::TYPE_TEXT => "Text",
                              CategoryQuestion::TYPE_DROPDOWN => "DropDown",
                              CategoryQuestion::TYPE_CHECKBOX => "CheckBox",
                              CategoryQuestion::TYPE_TIME => "Time")
                            ); ?>

                        <?php if(User::isAdmin()){?>      <?php echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>
      <?php }?>            <div
      class="col-md-12 text-right">
      <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'category-question-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
   </div>
   <?php TActiveForm::end(); ?>
   </div>
</div>
<script type="text/javascript">
   
   $( document ).ready(function() {
     // $("#categoryquestion-repeated_type").hide();
      $(".form-group.field-categoryquestion-repeated_type").hide();
      
   });
 $("#categoryquestion-type_id").change(function(){
     var value = this.value;
   if(value == "<?= CategoryQuestion::TYPE_REPEAT ?>")
   {
     $(".form-group.field-categoryquestion-repeated_type").show();
  }
   else
   {
      $(".form-group.field-categoryquestion-repeated_type").hide();
   }
  });

</script>