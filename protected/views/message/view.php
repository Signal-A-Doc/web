<?php
$this->params['breadcrumbs'][] = ['label' => 'Messages', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<?=  \app\components\PageHeader::widget(['title'=>$model]); ?>
<div class="vd_content-section clearfix">

	<div class=" panel widget light-widget ">
		<div
			class="message-view panel-body">

    <?= \app\components\TDetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'session_id',
            [
			'attribute' => 'state_id', 
			'value' => $model->getStateOptions($model->state_id), ],
            [
			'attribute' => 'type_id', 
			'value' => $model->getTypeOptions($model->type_id), 	
			],
            'to_id',
            'from_id',
            'group_id',
            'create_time:datetime',
            'update_time:datetime',
            'create_user_id',
        ],
    ]) ?>

</div>
		<div
			class="message-panel">
<?php
$this->context->startPanel();
	$this->context->addPanel('User', 'CreateUser', 'User',$model);

$this->context->endPanel();
?>
</div>

</div>
</div>

