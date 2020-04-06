<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
use app\models\Questions;
/* @var $this yii\web\View */
/* @var $model app\models\Questionanswer */

/* $this->title = $model->label() .' : ' . $model->id; */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Questionanswers'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
if ($model->type_id == Questions::TYPE_TEXT) {
    $title = $model->answer_title;
} else {
    $title = 'Audio File';
}
?>

<div class="wrapper">
	<div class=" panel ">

		<div class="questionanswer-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
		<?php

if ($model->type_id == Questions::TYPE_AUDIO) {
    echo '<audio controls>
  <source src="' . \Yii::$app->urlManager->createAbsoluteUrl([
        'user/download',
        'profile_file' => $model->answer_title
    ]) . '" type="audio/ogg">
    
</audio>';
}
?>
    <?php
    
    echo \app\components\TDetailView::widget([
        'id' => 'questionanswer-detail-view',
        'model' => $model,
        'options' => [
            'class' => 'table table-bordered'
        ],
        'attributes' => [
            'id',
            [
                'attribute' => 'question_id',
                'format' => 'raw',
                'value' => $model->getRelatedDataLink('question_id')
            ],
            [
                'attribute' => 'answer_title',
                'value' => ($model->type_id == Questions::TYPE_TEXT) ? $model->answer_title : 'Audio File'
            ],
            
            [
                'attribute' => 'state_id',
                'format' => 'raw',
                'value' => $model->getStateBadge()
            ],
            [
                'attribute' => 'type_id',
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


</div>
