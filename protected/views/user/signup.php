<?php
use app\models\User;
use app\components\TActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->title = 'Signup';
?>







<div id="login-register" class="register-page">
  <div class="lr-form">
    <div class="logo">
      <img src="<?php echo $this->theme->getUrl('img/logo.svg')?>" alt="">
    </div>
    <h3 class="sm-hd text-uppercase">Create account</h3>
   	<?php

$form = TActiveForm::begin([
    'id' => 'form-signup',
    'options' => [
        'class' => 'login-form form-horizontal'
    ],
     'fieldConfig' => [
        'options' => [
            'tag' => false,
        ],
    ],
    
]);
?>
      <div class="row">
        <div class="col-6">
          <div class="form-group">
           <?=$form->field ( $model, 'first_name', [ 'template' => '<div class="col-sm-12">{input}{error}</div>' ] )->textInput ( [ 'maxlength' => true,'placeholder' => 'First Name' ] )->label ( false )?>
          </div>
        </div>
        <div class="col-6">
          <div class="form-group">
                     <?=$form->field ( $model, 'last_name', [ 'template' => '<div class="col-sm-12">{input}{error}</div>' ] )->textInput ( [ 'maxlength' => true,'placeholder' => 'Last Name' ] )->label ( false )?>
          
          </div>
        </div>
      </div>
            <div class="form-group">
            <?=$form->field ( $model, 'email', [ 'template' => '<div class="col-sm-12">{input}{error}</div>' ] )->textInput ( [ 'maxlength' => true,'placeholder' => 'Email' ] )->label ( false )?>
      </div>
      <div class="form-group">
 <?=$form->field ( $model, 'password', [ 'template' => '<div class="col-sm-12">{input}{error}</div>' ] )->passwordInput ( [ 'maxlength' => true,'placeholder' => 'Password' ] )->label ( false )?>
      </div>
      <div class="form-group">
              <?=$form->field ( $model, 'confirm_password', [ 'template' => '<div class="col-sm-12">{input}{error}</div>' ] )->passwordInput ( [ 'maxlength' => true,'placeholder' => 'Confirm Password' ] )->label ( false )?>
      </div>
      <div class="form-group">
     	  	<?=Html::submitButton ( 'Register', [ 'class' => 'butn butn-bg w-100','id' => 'register','name' => 'register-button' ] )?>
      </div>
      <div class="form-group">
        <button type="submit" class="border-gry google-btn w-100">Continue with Google</button>
      </div>
      <p class="font-18 text-center pt-10">Have already an account? <a href="<?php echo Url::toRoute(['user/login']);?>">Login here</a></p>
    	<?php TActiveForm::end()?>
    <div class="lr-downloads">
      <div class="row align-items-center">
        <div class="col-5 pr-0">
          <p class="theme-blue mb-0">Download our</p>
          <p class="theme-blue mb-0"><b>Doctors Mobile App</b></p>
        </div>
        <div class="col-7">
          <div class="d-flex">
            <div class="pr-1">
              <a href="#0"><img src="<?php echo $this->theme->getUrl('img/gplay-icon.png')?>" alt=""></a>
            </div>
            <div class="pl-2">
              <a href="#0"><img src="<?php echo $this->theme->getUrl('img/apple-icon.png')?>" alt=""></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="lr-image" style="background-image: url(<?php echo $this->theme->getUrl('img/login-banner.png')?>);">
    <h3 class="lr-img-text">We’re driving the development of healthcare</h3>
  </div>
</div>






