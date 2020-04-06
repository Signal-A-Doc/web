<?php

use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\Recommendation */

/*$this->title =  $model->label() .' : ' . $model->title; */
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Recommendations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = (string)$model;
?>

<div class="wrapper">
	<div class=" panel ">

		<div
			class="recommendation-view panel-body">
			<?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>



		</div>
	</div>

	<div class=" panel ">
		<div class=" panel-body ">
    <?php echo \app\components\TDetailView::widget([
    	'id'	=> 'recommendation-detail-view',
        'model' => $model,
        'options'=>['class'=>'table table-bordered'],
        'attributes' => [
            'id',
            'title',
            /*'description:html',*/
            [
			'attribute' => 'state_id',
			'format'=>'raw',
			'value' => $model->getStateBadge(),],
           
            'created_on:datetime',
            'updated_on:datetime',
            [
			'attribute' => 'created_by_id',
			'format'=>'raw',
			'value' => $model->getRelatedDataLink('created_by_id'),
			],
        ],
    ]) ?>


<?php  echo $model->description;?>


		<?php				echo UserAction::widget ( [
						'model' => $model,
						'attribute' => 'state_id',
						'states' => $model->getStateOptions ()
				] );
				?>

		</div>
</div>
 
</div>
