<?php
use app\components\TGridView;
use yii\grid\GridView;
use yii\widgets\Pjax;
/**
 *
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var app\models\search\Banner $searchModel
 */

?>
<?php Pjax::begin(['id'=>'banner-pjax-ajax-grid','enablePushState'=>false,'enableReplaceState'=>false]); ?>
    <?php
    
echo TGridView::widget([
        'id' => 'banner-ajax-grid-view',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
            'class' => 'table table-bordered'
        ],
        'columns' => [
            // ['class' => 'yii\grid\SerialColumn','header'=>'<a>S.No.<a/>'],
            
            [
                'attribute' => 'id',
                'format' => 'raw',
                'value' => function ($data) {
                    return $data->getRelatedDataLink('id');
                }
            ],
            'name',
            'description:html',
            [
                'attribute' => 'image_file',
                'filter' => $searchModel->getFileOptions(),
                'value' => function ($data) {
                    return $data->getFileOptions($data->image_file);
                }
            ],
            
            'created_on:datetime',
            
            [
                'class' => 'app\components\TActionColumn',
                'header' => '<a>Actions</a>'
            ]
        ]
    ]);
    ?>
<?php Pjax::end(); ?>

