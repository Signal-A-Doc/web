<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\CategoryQuestion */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Category Questions'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
?>
<div class="wrapper">	
	<div class=" panel ">	
		<div class="category-view panel-body">
         <?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>
      	</div>	
	</div>	
	<div class=" panel ">	
		<div class=" panel-body ">
         <?php

        echo \app\components\TDetailView::widget([
            'id' => 'category-question-detail-view',
            'model' => $model,
            'options' => [
                'class' => 'table table-bordered'
            ],
            'attributes' => [
                // 'id',
                'title',

                [
                    'attribute' => 'category_id',
                    'value' => function ($model) {
                        return $model->categories->title;
                    }
                ],
                [
                    'attribute' => 'type_id',
                    'format' => 'raw',
                    'value' => $model->getType()
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
         <?php  ?>
         <?php

        echo UserAction::widget([
            'model' => $model,
            'attribute' => 'state_id',
            'states' => $model->getStateOptions()
        ]);
        ?>
      </div>
	</div>
	<div class="card"></div>

</div>