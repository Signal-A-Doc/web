<div class="col-xl-4  col-lg-4 col-md-6 col-12">
	<div class="single_how_work">
		<div class="how_work_icon">
			
			<?= $model->displayImage($model->image_file) ?>
		</div>

		<div class="f-r">

			<h4><?= HtmlPurifier::process($model->title) ?></h4>
			<p><?= strip_tags($model->description) ?></p>
		</div>
	</div>
</div>