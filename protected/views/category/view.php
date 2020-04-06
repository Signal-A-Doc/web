<?php
use app\components\useraction\UserAction;
use app\models\Category;
use app\models\File;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\Category */

/* $this->title = $model->label() .' : ' . $model->title; */




if (Yii::$app->controller->action->id == "department") {
    
    $this->params['breadcrumbs'][] = [
        'label' => 'Areas of specialization',
        'url' => [
            'category/department'
        ]
    ];
    
    //$title = "Areas of specialization";
} elseif (Yii::$app->controller->action->id == "index") {
    
    $this->params['breadcrumbs'][] = [
        'label' => 'Medical Condition',
        'url' => [
                'index'
            ]
    ];
    $title = "Medical Condition";
}




$this->params['breadcrumbs'][] = (string) $model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div class="category-view panel-body">
			<?php

echo \app\components\PageHeader::widget([
    'model' => $model
]);
?>



		</div>
	</div>

	<div class=" panel ">


		<div class=" panel-body ">
				<div class="col-md-2">
		<?=$model->displayImage($model->image_file)?><br /> <br />
				<p>
   			 	</p>

			</div>
			<div class="col-md-10">
    <?php

    echo \app\components\TDetailView::widget([
        'id' => 'category-detail-view',
        'model' => $model,
        'options' => [
            'class' => 'table table-bordered'
        ],
        'attributes' => [
            "id",
            'title',
            [
                'attribute' => 'state_id',
                'format' => 'raw',
                'value' => $model->getStateBadge()
            ],

            'created_on:datetime',
            'updated_on:datetime',
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => $model->getRelatedDataLink('created_by_id')
            ]
        ]
    ])?>
<?php

if (! empty($model->description)) {
    echo $model->description;
}
?>

<?php

?>


		<?php

echo UserAction::widget([
    'model' => $model,
    'attribute' => 'state_id',
    'states' => $model->getStateOptions()
]);
?>
</div>
		</div>
	</div>


</div>
