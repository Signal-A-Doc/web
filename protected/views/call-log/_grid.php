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
 * @var app\models\search\CallLog $searchModel
 */

?>
<?php if (User::isAdmin()) echo Html::a('','#',['class'=>'multiple-delete glyphicon glyphicon-trash','id'=>"bulk_delete_call-log-grid"])?>
<?php Pjax::begin(['id'=>'call-log-pjax-grid']); ?>
    <?php
    
    echo TGridView::widget([
        'id' => 'call-log-grid-view',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
            'class' => 'table table-bordered'
        ],
        'columns' => [
            // ['class' => 'yii\grid\SerialColumn','header'=>'<a>S.No.<a/>'],
            [
                'name' => 'check',
                'class' => 'yii\grid\CheckboxColumn',
                'visible' => User::isAdmin()
            ],
            
            'id',
            [
                'attribute' => 'user_id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('user_id');
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
                'attribute' => 'type_id',
                'filter' => isset($searchModel) ? $searchModel->getTypeOptions() : null,
                'value' => function ($data) {
                    return $data->getType();
                }
            ],
          /*   [
                'attribute' => 'created_on',
                'filter' => \yii\jui\DatePicker::widget([
                    'inline' => false,
                    'clientOptions' => [
                        'autoclose' => true
                    ],
                    'model' => $searchModel,
                    'attribute' => 'created_on',
                    
                    'options' => [
                        'id' => 'created_on',
                        'class' => 'form-control'
                    ]
                ]),
                'value' => function ($data) {
                    return date('Y-m-d H:i:s', strtotime($data->created_on));
                }
            ], */
            /* 'updated_on:datetime',*/
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('created_by_id');
                }
            ],
            
            [
                'class' => 'app\components\TActionColumn',
                'header' => '<a>Actions</a>',
                'template' => '{view} {delete}'
            ]
        ]
    ]);
    ?>
<?php Pjax::end(); ?>
<script> 
$('#bulk_delete_call-log-grid').click(function(e) {
	e.preventDefault();
	 var keys = $('#call-log-grid-view').yiiGridView('getSelectedRows');

	 if ( keys != '' ) {
		var ok = confirm("Do you really want to delete these items?");

		if( ok ) {
			$.ajax({
				url  : '<?php echo Url::toRoute(['call-log/mass','action'=>'delete','model'=>get_class($searchModel)])?>', 
				type : "POST",
				data : {
					ids : keys,
				},
				success : function( response ) {
					if ( response.status == "OK" ) {
						 $.pjax.reload({container: '#call-log-pjax-grid'});
					}
				}
		     });
		}
	 } else {
		alert('Please select items to delete');
	 }
});

</script>

