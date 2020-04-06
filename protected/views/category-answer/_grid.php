<?php
use app\components\TGridView;
use yii\helpers\Html;
use yii\helpers\Url;

use app\models\User;

use yii\grid\GridView;
use yii\widgets\Pjax;
/**
 *
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\CategoryAnswer $searchModel
 */

?>
<?php if (User::isAdmin()) echo Html::a('','#',['class'=>'multiple-delete glyphicon glyphicon-trash','id'=>"bulk_delete_category-answer-grid"])?>
<?php Pjax::begin(['id'=>'category-answer-pjax-grid']); ?>
    <?php

    echo TGridView::widget([
        'id' => 'category-answer-grid-view',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
            'class' => 'table table-bordered'
        ],
        'columns' => [
            [
                'name' => 'check',
                'class' => 'yii\grid\CheckboxColumn',
                'visible' => User::isAdmin()
            ],

            'id',
            'title',
            [
                'attribute' => 'question_id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('question_id');
                }
            ],
            [
                'attribute' => 'state_id',
                'format' => 'raw',
                'filter' => isset($searchModel) ? $searchModel->getStateOptions() : null,
                'value' => function ($data) {
                    return $data->getStateBadge();
                }
            ],

            [
                'class' => 'app\components\TActionColumn',
                'header' => '<a>Actions</a>'
            ]
        ]
    ]);
    ?>
<?php Pjax::end(); ?>
<script> 
$('#bulk_delete_category-answer-grid').click(function(e) {
	e.preventDefault();
	 var keys = $('#category-answer-grid-view').yiiGridView('getSelectedRows');

	 if ( keys != '' ) {
		var ok = confirm("Do you really want to delete these items?");

		if( ok ) {
			$.ajax({
				url  : '<?php echo Url::toRoute(['category-answer/mass','action'=>'delete','model'=>get_class($searchModel)])?>', 
				type : "POST",
				data : {
					ids : keys,
				},
				success : function( response ) {
					if ( response.status == "OK" ) {
						 $.pjax.reload({container: '#category-answer-pjax-grid'});
					}
				}
		     });
		}
	 } else {
		alert('Please select items to delete');
	 }
});

</script>

