<?php
$this->params ['breadcrumbs'] [] = $this->title;
?>
<div class="message-index">

<?=  \app\components\PageHeader::widget([]); ?>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    
<div class="vd_content-section clearfix">
		<?php echo $this->render('_grid', ['dataProvider' => $dataProvider, 'searchModel' => $searchModel]); ?>
</div>

</div>

