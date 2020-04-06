<?php

use yii\helpers\Html;
use app\components\TActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use app\models\SubCategory;
use kartik\depdrop\DepDrop
/* @var $this yii\web\View */
/* @var $model app\models\Illness */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php echo strtoupper(Yii::$app->controller->action->id); ?>
                        </header>
<div class="panel-body">

    <?php 
$form = TActiveForm::begin([
					 'layout' => 'horizontal',
						'id'	=> 'illness-form',
						]);
						
						
echo $form->errorSummary($model);	
?>





		 <?php echo $form->field($model, 'title')->textInput(['maxlength' => 255]) ?>
	 		


		 <?php echo $form->field($model, 'category_id')->dropDownList($model->getCategoryOptions(), ['prompt' => '','id'=>'cat-id']) ?>
	 		
		<?php 
		 	echo $form->field($model, 'sub_category_id')->widget(DepDrop::classname(), [
		     'options'=>['id'=>'subcat-id'],
		     'pluginOptions'=>[
		         'depends'=>['cat-id'],
		         'placeholder'=>'Select...',
		         'url'=>Url::to(['/category/subcat'])
		     ]
			 ]);

		  ?>
	 		


		 <?php //echo $form->field($model, 'image_file',['enableClientValidation' => true ,'enableAjaxValidation' => false])->fileInput() ?>
	 		


		 <?php /*echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php /*echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) */ ?>
	 		


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'illness-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	</div>

    <?php TActiveForm::end(); ?>

</div>
