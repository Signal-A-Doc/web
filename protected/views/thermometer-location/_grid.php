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
 * @var app\models\search\ThermometerLocation $searchModel
 */

?>
<?php if (User::isAdmin()) echo Html::a('','#',['class'=>'multiple-delete glyphicon glyphicon-trash','id'=>"bulk_delete_thermometer-location-grid"])?>
<?php Pjax::begin(['id'=>'thermometer-location-pjax-grid']); ?>
    <?php

echo TGridView::widget([
        'id' => 'thermometer-location-grid-view',
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
            'title',
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
$('#bulk_delete_thermometer-location-grid').click(function(e) {
	e.preventDefault();
	 var keys = $('#thermometer-location-grid-view').yiiGridView('getSelectedRows');

	 if ( keys != '' ) {
		var ok = confirm("Do you really want to delete these items?");

		if( ok ) {
			$.ajax({
				url  : '<?php echo Url::toRoute(['thermometer-location/mass','action'=>'delete','model'=>get_class($searchModel)])?>', 
				type : "POST",
				data : {
					ids : keys,
				},
				success : function( response ) {
					if ( response.status == "OK" ) {
						 $.pjax.reload({container: '#thermometer-location-pjax-grid'});
					}
				}
		     });
		}
	 } else {
		alert('Please select items to delete');
	 }
});

</script>

