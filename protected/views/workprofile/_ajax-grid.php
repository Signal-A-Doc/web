<?php

use app\components\TGridView;
use yii\grid\GridView;
use yii\widgets\Pjax;
/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\Workprofile $searchModel
 */

?>
<?php Pjax::begin(['id'=>'workprofile-pjax-ajax-grid','enablePushState'=>false,'enableReplaceState'=>false]); ?>
    <?php echo TGridView::widget([
    	'id' => 'workprofile-ajax-grid-view',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions'=>['class'=>'table table-bordered'],
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn','header'=>'<a>S.No.<a/>'],

            [
				'attribute' => 'id',
				'format'=>'raw',
				'value' => function ($data) { return $data->getRelatedDataLink('id');  },
				],
            [
				'attribute' => 'professional_status',
				'format'=>'raw',
				'value' => function ($data) { return $data->getRelatedDataLink('professional_status');  },
				],
            'professional_indemnity',
            'MDCN_folio_number',
            'MDCN_certificate',
            [
			'attribute' => 'state_id','format'=>'raw','filter'=>isset($searchModel)?$searchModel->getStateOptions():null,
			'value' => function ($data) { return $data->getStateBadge();  },],
            /* ['attribute' => 'type_id','filter'=>isset($searchModel)?$searchModel->getTypeOptions():null,
			'value' => function ($data) { return $data->getType();  },],*/
            /* 'created_on:datetime',*/
            /* 'updated_on:datetime',*/
            [
				'attribute' => 'created_by_id',
				'format'=>'raw',
				'value' => function ($data) { return $data->getRelatedDataLink('created_by_id');  },
				],

            ['class' => 'app\components\TActionColumn','header'=>'<a>Actions</a>'],
        ],
    ]); ?>
<?php Pjax::end(); ?>

