<?php
use app\components\TActiveForm;
use app\models\ContactForm;
?>
<div class="ht__bradcaump__area">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bradcaump__title text-center">
					<h2 class="bradcaump-title">Contact Us</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Bradcaump area -->


<!-- Start Contact Area -->
<section class="htc__contact__area bg__white pt--30 pb--15">
	<div class="container">
		<div class="row contact__addres__wrapper">
			<!-- Start Single Addrss -->
			<div class="col-lg-4 col-xl-4 col-md-6 col-12">
				<div class="address">
					<div class="address__icon">
						<i class="zmdi zmdi-pin"></i>
					</div>
					<div class="address__details">
						<p>Somashekara S #375 Doddaianapalya., After Govt bus stand
							Tiptur- 572201</p>
					</div>
				</div>
			</div>
			<!-- End Single Addrss -->
			<!-- Start Single Addrss -->
			<div class="col-lg-4 col-xl-4 col-md-6 col-12 xmt--40">
				<div class="address">
					<div class="address__icon">
						<i class="zmdi zmdi-phone"></i>
					</div>
					<div class="address__details">
						<p>
							<a href="#">9740577471</a>
						</p>
					</div>
				</div>
			</div>
			<!-- End Single Addrss -->
			<!-- Start Single Addrss -->
			<div class="col-lg-4 col-xl-4 col-md-6 col-12 smt--40 xmt--40">
				<div class="address">
					<div class="address__icon">
						<i class="zmdi zmdi-globe"></i>
					</div>
					<div class="address__details">
						<p>
							<a href="#">callvydya@gmail.com </a>
						</p>
					</div>
				</div>
			</div>
			<!-- End Single Addrss -->

		</div>
	</div>
	<!-- Start Google Map -->
	<div class="htc__google__map mt-5 mb-5">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3883.3859883030095!2d76.47259321478879!3d13.26380266198787!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bb000b743adebbb%3A0xae1f069ec4b8d315!2sKSRTC+Bus+Stand!5e0!3m2!1sen!2sin!4v1554285110011!5m2!1sen!2sin"
			width="100%" height="250" frameborder="0" style="border: 0"
			allowfullscreen></iframe>
	</div>
	<!-- End Google Map -->
	<!-- Start Conatact Form -->
	<div class="psy__contact__form">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
					<div class="htc__contact__form__wrap">
						<div class="contact-form-wrap">
							<h2 class="ct__title text--theme">Send us a message</h2>
							<?php
    $model = new ContactForm();
    $form = TActiveForm::begin([
        'id' => 'contact-formwef',
        'options' => [ // 'class' => 'driver-form form-horizontal',
                           // 'tags' => false
        ]
        // 'enableAjaxValidation' => true
    
    ]);
    ?>
            		
                    
					
	
                   
							
								<div class="single-contact-form name">
								<div class="contact-box name_email">
									<div class="contact-box">
										 <?php echo $form->field ( $model, 'name',['template'=>'{input}{error}'])->textInput ( [ 'placeholder' => 'Name' ] )->label ( false )?>
											
										</div>
									<div class="contact-box">
										<?php echo $form->field ( $model, 'contact_no',['template'=>'{input}{error}'])->textInput ( [ 'placeholder' => 'Phone', 'maxlength' => 16 ] )->label ( false )?>
											
										</div>
								</div>
							</div>
							<div class="single-contact-form">
								<div class="contact-box subject">
									<?php echo $form->field ( $model, 'email')->textInput ( [ 'placeholder' => 'Email' ] )->label ( false )?>
										
									</div>
							</div>
							<div class="single-contact-form">
								<div class="contact-box message">
									<?php echo $form->field ( $model, 'body',['template'=>'{input}{error}'] )->textArea ( [ 'rows' => 6,'placeholder' => 'Message' ] )->label ( false )?>
										
									</div>
							</div>
							<div class="contact-btn"><?php
    
    echo \yii\helpers\Html::submitButton('Send Message', [
        'class' => 'a-class',
        'name' => 'submit-button'
    ])?>
									
								</div>
							 <?php TActiveForm::end(); ?>  
						
						
						</div>
						<div class="form-output">
							<p class="form-messege"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End Conatact Form -->
</section>