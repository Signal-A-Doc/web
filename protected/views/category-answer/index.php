
<?php


/* @var $this yii\web\View */
/* @var $searchModel app\models\search\CategoryQuestion */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Category Answers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Index');;
?>
<div class="wrapper">
	<div class="user-index">
		<div class=" panel ">
			<div
					class="category-question-index">
				<?=  \app\components\PageHeader::widget(); ?>
			 </div>
			
		</div>
		<div class="panel panel-margin">
			<div class="panel-body">
				<div class="content-section clearfix">
					<header class="panel-heading head-border">   <?php

    echo strtoupper(Yii::$app->controller->action->id);
    ?> </header>
		<?php

echo $this->render('_grid', [
    'dataProvider' => $dataProvider,
    'searchModel' => $searchModel
]);
?>
</div>
			</div>
		</div>
	</div>

</div>
