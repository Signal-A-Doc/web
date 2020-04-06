<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\User;
/* @var $this yii\web\View */
/* @var $model app\models\CategoryAnswer */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
   <?php echo strtoupper(Yii::$app->controller->action->id); ?>
</header>
<div class="content-section clearfix panel">

		
<div class="panel-body">
   <?php

$form = TActiveForm::begin([

    'id' => 'category-answer-form',
    'options' => [
        'class' => 'row'
    ]
]);
echo $form->errorSummary($model);
?>
                  <?php echo $form->field($model, 'title')->textInput(['maxlength' => 256]) ?>
                              <?php echo $form->field($model, 'question_id')->dropDownList($model->getQuestionOptions(), ['prompt' => '']) ?>
                        <?php if(User::isAdmin()){?>      <?php echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) ?>
      <?php }?>            <div class="col-md-12 text-right">
      <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'category-answer-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
   </div>
   <?php TActiveForm::end(); ?>
</div>
</div>