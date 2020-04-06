<?php
use yii\helpers\Url;
use yii\helpers\HtmlPurifier;

?>
<div class="grid-item col-lg-4 col-md-6 col-12">
	<div class="single_latest_post mb--30">
		<div class="ht__blog__thumb">
			<a href="<?= Url::toRoute(['/site/blog-detail','id'=>$model->id]) ?>"> <?= $model->displayImage($model->image_file,['height'=>'200']) ?>
			</a>
		</div>


		<div class="blog__post_title item-same-address">
			<h2>
				<a
					href="<?=Url::toRoute(['/site/blog-detail','id' => $model->id]) ?>"><?= HtmlPurifier::process($model->title) ?></a>
			</h2>
			<?php
$string = strip_tags($model->content);
if (strlen($string) > 100) {
    $trimstring = substr($string, 0, 200) . '... <br><a href="' . Url::toRoute([
        '/site/blog-detail',
        'id' => $model->id
    ]) . '" class="a-class">Read More</a>';
} else {
    $trimstring = strip_tags($model->content);
}

?>
			
			<p><?= $trimstring ?></p>

		</div>


	</div>
</div>