<?php
use yii\widgets\ListView;

/**
 *
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author : Shiv Charan Panjeta < shiv@toxsl.com >
 */
/* @var $this yii\web\View */
$this->title = Yii::$app->name;

?>
<?php if (!empty($banners)){?>
<div class="slider__container">
	<div class="slider-active owl-carousel">
	<?php foreach ($banners as $banner){?>
		<div class="slider-wrapper bg-opacity"
			style="background-image: url(<?=\Yii::$app->urlManager->createAbsoluteUrl(['user/download','profile_file' => $banner->image_file])?>)">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="slider-content slider-text-animation">
							<h3><?= $banner->name ?></h3>
							<h2>
								<?= strip_tags($banner->description) ?>
							</h2>
							<div class="htc__spt__dai">
								<div class="play_video">
									<a href="#"><i class="zmdi zmdi-play"></i></a> <span>Watch
										Video</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php } ?>
		
	</div>
</div>
<?php } ?>
<section class="pt--50">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
			  <h2 class="my-3">Watch Video</h2>
				
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="video-section">
				<video id="video_src" controls="" playsinline="" autoplay=""
					muted="" loop="" width="100%">
					<source src="themes/base/frontend/Callvydya_male_voice.mp4"
						type="video/mp4">
				</video>
			</div>
		</div>
	</div>
</section>


<!-- slider-area-end -->
<?php if (!empty($features)){ ?>
<!--How it work section start-->
<div class="how_it_work_section ptb--100">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<div class="section_title--2 text-center pb--60">
					<h2>Treatment Services We Offer</h2>

				</div>
			</div>
		</div>




		<div class="row">
		<?php foreach ($features as $feature){?>
			<div class="col-xl-4  col-lg-4 col-md-6 col-12">
				<div class="single_how_work">
					<div class="how_work_icon">
						<?= $feature->displayImage($feature->image_file) ?>
					</div>

					<div class="f-r">

						<h4><?= $feature->title ?></h4>
						<p><?= $feature->description ?></p>
					</div>
				</div>
			</div>
			<?php } ?>
			
		</div>
	</div>
</div>
<?php } ?>
<div class="download_app_banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-md-6 col-12">
				<div class="download__app_content">
					<div class="download_app_heading">
						<h2>
							Download This App & <br> Make Appointment <br> from anywhere.
						</h2>
					</div>
					<div class="donload_button">
						<ul>
							<li><a href="#"><img
									src="<?php
        
        echo $this->theme->getUrl('')?>frontend/images/app/app-store-btn.png"
									alt=""></a></li>
							<li><a href="#"><img
									src="<?php
        
        echo $this->theme->getUrl('')?>frontend/images/app/play-store-btn.png"
									alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-5 col-md-6 col-12">
				<div class="app_mobile text-right">
					<img
						src="<?php
    
    echo $this->theme->getUrl('')?>frontend/images/app/mobile.png"
						alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!--How it work section end-->



<!--Special Banner start-->

<!--special Banner end-->

<?php if (!empty($testimonials)){ ?>
<!-- Start Appoinment Area -->
<section class="htc__appoinment__area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-12">
				<div class="section__title text-center">
					<h2>Our testimonials</h2>
				</div>

				<div class="primary_testimonial_slider owl-carousel">
				<?php foreach ($testimonials as $testimonial){?>
					<div class="primary_testimonial_item_wrpaer">
						<div class="primary_testimonial_item item-same-address">
							<p><?= strip_tags($testimonial->description) ?></p>
							<div class="testimonial_title bottom">
								<div class="testimonial_img">
									<?= $testimonial->displayImage($testimonial->image_file,['class'=>'']) ?>
								</div>
								<h5><?= $testimonial->name ?></h5>
								<span><?= $testimonial->designation ?></span>
							</div>
						</div>
					</div>
					<?php } ?>
					
				</div>
			</div>

		</div>
	</div>
</section>
<?php } ?>

<!--Download app banner start-->

<!--Download app banner end-->

<!--Special doctor section 2 start-->
<?php if (!empty($teams)){?>
<div class="special_doctor_section_2 ptb--100">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 ">
				<div class="section_title--2 pb--60 text-center">
					<h2>Meet Our Team</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting.</p>
				</div>
			</div>
		</div>
		<div class="row">
		<?php foreach ($teams as $team){?>
			<div class="col-xl-4 col-lg-4 col-md-6 col-12">
				<div
					class="single_special_doctor text-center mb--30 item-same-address">
					<div class="doctor_image_2">
						<?= $team->displayImage($team->image_file,['class'=>'']) ?>
					</div>
					<div class="doctor_brief_desc">
						<div class="doctor_top_desc">
							<div class="doctor_name">
								<h4><?= $team->name ?></h4>
							</div>
							<div class="doctor_designation">
								<h5><?= $team->designation ?></h5>
							</div>
							<p><?= strip_tags($team->description) ?></p>
						</div>

					</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>

