<?php
$this->params['breadcrumbs'][] = ['label' => 'Messages', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div
	class="message-update">

<?=  \app\components\PageHeader::widget(['title'=>$this->title]); ?>

    
<div class="vd_content-section clearfix">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

