<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
use app\components\TGridView;
use app\models\User;
use yii\base\Widget;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;
use yii\jui\DatePicker;

Pjax::begin();

/**
 *
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\User $searchModel
 */

?>

<?php

if (user::isAdmin())
    echo Html::a('', '#', [
        'class' => 'multiple-delete glyphicon glyphicon-trash',
        'id' => "bulk-delete"
    ])?>

<div class="table table-responsive">
	 <?php
Pjax::begin([
    'id' => 'user-pjax-grid'
]);
echo TGridView::widget([
    'id' => 'user-grid',
    'dataProvider' => $dataProvider,
    'filterModel' => $searchModel,
    'columns' => [

        [
            'name' => 'check',
            'class' => 'yii\grid\CheckboxColumn',
            'visible' => User::isAdmin()
        ],
        'id',
        [
            'attribute' => 'full_name',
            'format' => 'html',
            'value' => function ($data) {
                return $data->getFullName();
            }
        ],
        'email:email',
        'contact_no',

        [
            'attribute' => 'state_id',
            'filter' => $searchModel->getStateOptions(),
            'format' => 'html',
            'value' => function ($data) {
                return $data->getStateBadge();
            }
        ],

        [
            'attribute' => 'created_on',
            'filter' => DatePicker::widget([
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
                return date('Y-m-d h:m:s A', strtotime($data->created_on));
            }
        ],

        [
            'class' => 'app\components\TActionColumn',
            'header' => '<a>Actions</a>',
            'template' => '{view}{delete}'
            /*
         * 'buttons' => [
         * 'view' => function ($url, $model) {
         * $url = Url::toRoute([
         * '/user/view/delete',
         * 'id' => $model->id
         * ]);
         * return Html::a('<span class="glyphicon glyphicon-eye"></span>', $url);
         * },
         * 'update' => function ($url, $model) {
         * if ($model->role_id == User::ROLE_DOCTOR) {
         * $url = Url::toRoute([
         * '/user/update-doctor/delete',
         * 'id' => $model->id
         * ]);
         * } elseif ($model->role_id == User::ROLE_PATIENT) {
         * $url = Url::toRoute([
         * '/user/update-patient/delete',
         * 'id' => $model->id
         * ]);
         * } else {
         * $url = Url::toRoute([
         * '/user/update/',
         * 'id' => $model->id
         * ]);
         * }
         * return Html::a('<span class="glyphicon glyphicon-eye"></span>', $url);
         * },
         * 'delete' => function ($url, $model) {
         * $url = Url::toRoute([
         * '/user/delete',
         * 'id' => $model->id
         * ]);
         * return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
         * 'title' => Yii::t('app', 'delete'),
         * 'class' => 'btn btn-danger btn-red',
         * 'data-confirm' => "Are you sure to delete this group?",
         * 'data-method' => "POST"
         * ]);
         * }
         * ]
         */
        ]
    ]
]);

?>
<?php

Pjax::end()?>
</div>

<script>
	$('#bulk-delete').click(function(e) {
		e.preventDefault();
		 var keys = $('#user-grid').yiiGridView('getSelectedRows');
		 if ( keys != '' ) {
			var ok = confirm("Do you really want to delete these items?");
			if( ok ) {
				$.ajax({
					url  : '<?php

    echo Url::toRoute([
        '/user/mass',
        'action' => 'delete',
        'model' => get_class($searchModel)
    ]);
    ?>',
					type : "POST",
					data : {
						ids : keys
					},
					success : function( response ) {
						if ( response.status == "OK" ) {
							 $("#error_flash").show();
							 
							 $.pjax.reload({container: '#user-pjax-grid'});
						} else { 
							 $("#error_flash").hide();
						}
					}
			     });
			}
		 } else {
			alert('Please select items to delete');
		 }
	});
</script>