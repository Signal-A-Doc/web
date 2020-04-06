<?php
$this->params ['breadcrumbs'] [] = [ 
		'label' => 'Messages',
		'url' => [ 
				'index' 
		] 
];
$this->params ['breadcrumbs'] [] = $this->title;
?>
<div class="message-create">

<?=  \app\components\PageHeader::widget(['title'=>$this->title]); ?>

    
<div class="vd_content-section clearfix">
		<?= $this->render ( '_form', [ 'model' => $model ] )?></div>
</div>

