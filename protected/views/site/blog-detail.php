<?php
use yii\helpers\Url;
use app\modules\blog\models\Post;
?>
<div class="ht__bradcaump__area">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bradcaump__title text-center">
					<div class="breadcurumb_menu">
						<ul>
							<li><a href="<?= Url::toRoute(['/site/index']) ?>">Home</a></li>
							<li>>></li>
							<li>Blog Detail</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Bradcaump area -->

<!--Our blob page-->
<div class="our_blog_area ptb--100">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-12 col-12">
				<div class="post_details_inner">
					<div class="single_post_thumbnail">
						<?= $model->displayImage($model->image_file) ?>
					</div>
					<div class="single_post_content">
						<div class="single_post_top_contnt">
							<div class="single_post_title">
								<h2><?= $model->title ?></h2>
							</div>
							<div class="single_post_meta">
								<div class="single_post_left_meta">
								<?php
        
        $timestamp = strtotime($model->created_on);
        $newDate = date('F d, Y', $timestamp);
        ?>
									<ul>
										<li><?= $newDate ?></li>
										<li>By: <?= $model->createUser->full_name ?></li>

									</ul>
								</div>

							</div>
						</div>

						<div class="post_excerpt">
							<p><?= $model->content ?></p>

						</div>

					</div>

					<!--Comment box -->

					<!--Comment box end-->

				</div>
			</div>
			<div class="col-lg-4 col-md-8 col-12">
				<div class="sidebar_right">
					<div class="widget recent_post">
						<div class="sidebar_title">
							<h3>Recent Posts</h3>
						</div>
<?php

$recents = Post::findActive()->andWhere([
    'NOT IN',
    'id',
    $model->id
])
    ->orderBy('id DESC')
    ->limit(3)
    ->all();
if (! empty($recents)) {
    foreach ($recents as $recent) {
        
        ?>

					
						<div class="single_recent_post">
							<div class="recent_post_img">
								<a
									href="<?= Url::toRoute(['/site/blog-detail','id'=>$recent->id]) ?>"><?= $recent->displayImage($recent->image_file) ?></a>
							</div>
							<div class="post_content">
								<h3>
									<a
										href="<?= Url::toRoute(['/site/blog-detail','id'=>$recent->id]) ?>"><?= $recent->title ?> </a>
								</h3>
								<?php
        
        $timestamp = strtotime($recent->created_on);
        $newDate = date('F d, Y', $timestamp);
        ?>
								<span class="post_publist_date"> <?= $newDate ?></span>
							</div>
						</div>
						
						<?php }} ?>
					</div>



				</div>
			</div>
		</div>

	</div>
</div>