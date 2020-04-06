<div class="col-xl-4 col-lg-4 col-md-6 col-12">
	<div class="single_special_doctor text-center mb--30">
		<div class="doctor_image_2">
			<?= $model->displayImage($model->image_file,['class'=>'']) ?>
		</div>
		<div class="doctor_brief_desc">
			<div class="doctor_top_desc">
				<div class="doctor_name">
					<h4><?= $model->name ?></h4>
				</div>
				<div class="doctor_designation">
					<h5><?= $model->designation ?></h5>
				</div>
				<p><?= $model->description ?></p>
			</div>

		</div>
	</div>
</div>