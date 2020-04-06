<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Category */

/* $this->title = Yii::t('app', 'Add'); */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Categories'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = Yii::t('app', 'Add');
if (Yii::$app->controller->action->id == "add-department") {

    $this->params['breadcrumbs'][] = [
        'label' => 'Areas of specialization'
    ];

    $title = "Areas of specialization";
} elseif (Yii::$app->controller->action->id == "add") {

    $this->params['breadcrumbs'][] = [
        'label' => 'Medical Condition'
    ];
    $title = "Medical Condition";
}
?>

<div class="wrapper">
	<div class="panel">

		<div
			class="category-create">
	<?=\app\components\PageHeader::widget(['title' => $title]);?>
</div>

	</div>

	<div class="content-section clearfix panel">

		<?=$this->render('_form', ['model' => $model])?></div>
</div>


