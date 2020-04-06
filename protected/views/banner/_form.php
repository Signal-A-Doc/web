<?php
use yii\helpers\Html;
use app\components\TActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Banner */
/* @var $form yii\widgets\ActiveForm */
?>
<header class="panel-heading">
                            <?php

                            echo strtoupper(Yii::$app->controller->action->id);
                            ?>
                        </header>
<div class="panel-body">

    <?php
    $form = TActiveForm::begin([
        'layout' => 'horizontal',
        'id' => 'banner-form'
    ]);

    echo $form->errorSummary($model);
    ?>





		 <?php

echo $form->field($model, 'name')->textInput([
    'maxlength' => 256
])?>
	 		


		 <?php

echo $form->field($model, 'description', [
    'enableClientValidation' => false
])->widget(app\components\TRichTextEditor::className(), [
    'options' => [
        'rows' => 6
    ],
    'preset' => 'basic'
]); // $form->field($model, 'description')->textarea(['rows' => 6]); ?>
	 		


		 <?php

echo $form->field($model, 'image_file')->fileInput()?>
	 		


		


	   <div class="form-group">
		<div
			class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">
        <?=Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Update'), ['id' => 'banner-form-submit','class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
    </div>
	</div>

    <?php

    TActiveForm::end();
    ?>

</div>
