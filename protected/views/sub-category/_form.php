<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\User;
use app\models\Category;

/* @var $this yii\web\View */
/* @var $model app\models\SubCategory */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="card-header">
   <?php echo strtoupper(Yii::$app->controller->action->id); ?>
</header>
<div class="card-body">
   <?php    $form = TActiveForm::begin([
    
   'id' => 'sub-category-form',
   'options'=>[
   'class'=>'row'
   ]
   ]);
   echo $form->errorSummary($model);    
   ?>
                  <?php echo $form->field($model, 'title')->textInput(['maxlength' => 256]) ?>
                              <?php echo $form->field($model, 'category_id')->dropDownList($model->getCategoryOptions(), ['prompt' => '']) ?>
                        <?php if(User::isAdmin()){?>      <?php echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>
      <?php }?>                        <?php /*echo $form->field($model, 'type_id')->checkbox()//$form->field($model, 'type_id')->widget(kartik\widgets\SwitchInput::class,[]) */ ?>
                  <div
      class="col-md-12 text-right">
      <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'sub-category-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
   </div>
   <?php TActiveForm::end(); ?>
</div>