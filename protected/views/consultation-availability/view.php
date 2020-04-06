<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
/* @var $this yii\web\View */
/* @var $model app\models\ConsultationAvailability */
$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Consultation Availabilities'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;
?>
<div class="wrapper">
	<div class="card">
		<div class="consultation-availability-view">
         <?php echo  \app\components\PageHeader::widget(['model'=>$model]); ?>
      </div>
	</div>
	<div class="card">
		<div class="card-body">
         <div class="col-md-2">
         <?php
         
         if (! empty($model->image_file)) {
             ?>
				<?=$model->displayImage($model->image_file, ['height' => '50px','weight' => '50px'])?><br />
				<br />
				 			 	
   			 	<?php
}
?>
</div>
<div class="col-md-10">
<?php 
echo \app\components\TDetailView::widget([
            'id' => 'consultation-availability-detail-view',
            'model' => $model,
            'options' => [
                'class' => 'table table-bordered'
            ],
            'attributes' => [
                'title',
                [
                    'attribute' => 'state_id',
                    'format' => 'raw',
                    'value' => $model->getStateBadge()
                ],

                
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

</div>