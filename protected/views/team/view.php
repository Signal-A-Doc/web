<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\Team */

/* $this->title = $model->label() .' : ' . $model->name; */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Teams'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div class="team-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
			<div class="col-md-2">
				<?= $model->displayImage($model->image_file,['height'=>'300','weight'=>'300']) ?>
			</div>

			<div class="col-md-10">
		
		
    <?php
    
    echo \app\components\TDetailView::widget([
        'id' => 'team-detail-view',
        'model' => $model,
        'options' => [
            'class' => 'table table-bordered'
        ],
        'attributes' => [
            'id',
            'name',
            'designation',
            /*'description:html',*/
            'image_file',
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


<?php  echo $model->description;?>

</div>


		</div>
	</div>


</div>
