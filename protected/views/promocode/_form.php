<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Promocode */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php echo strtoupper(Yii::$app->controller->action->id); ?>
                        </header>
<div class="panel-body">

    <?php
    $form = TActiveForm::begin([
        'layout' => 'horizontal',
        'id' => 'promocode-form'
    ]);
    
    echo $form->errorSummary($model);
    ?>





		 <?php //echo $form->field($model, 'patient_id')->dropDownList($model->getPatientOptions(), ['prompt' => '']) ?>
	 		


		 <?php echo $form->field($model, 'promocode')->textInput(['maxlength' => 256])->label('Promocode') ?>
	 		


		 <?php echo $form->field($model, 'discount')->textInput(['maxlength' => 256]) ?>
	 		


		 <?php echo  $form->field($model, 'description')->widget ( app\components\TRichTextEditor::className (), [ 'options' => [ 'rows' => 6 ],'preset' => 'basic' ] ); //$form->field($model, 'description')->textarea(['rows' => 6]); ?>
	 
	 		
<?php
$value = '';
if (! $model->isNewRecord) {
    $value = $model->valid_till;
}
echo $form->field($model, 'valid_till')->widget(DatePicker::classname(), [
    'options' => [
        'placeholder' => 'Enter Promo End Date ...'
    ],
    'value' => $value,
    
    'pluginOptions' => [
        'autoclose' => true,
        'format' => 'dd-mm-yyyy',
        'startDate' => date('d-m-Y')
    ]
]);
?>

		 <?php /*echo $form->field($model, 'state_id')->dropDownList($model->getStateOptions(), ['prompt' => '']) */ ?>
	 		


		 <?php //echo $form->field($model, 'type_id')->dropDownList($model->getTypeOptions(), ['prompt' => '']) ?>
	 		


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id'=> 'promocode-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	</div>

    <?php TActiveForm::end(); ?>

</div>
