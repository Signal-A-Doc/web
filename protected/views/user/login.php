<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
use app\components\TActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;
use app\models\User;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = 'Sign In';

$fieldOptions1 = [
    'options' => [
        'class' => 'form-group has-feedback'
    ],
    
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-envelope form-control-feedback'></span>"
];

$fieldOptions2 = [
    'options' => [
        'class' => 'form-group has-feedback'
    ],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-lock form-control-feedback'></span>"
];
?>
<?php if (Yii::$app->session->hasFlash('success')): ?>
<div class="alert alert-success">
    <?php echo Yii::$app->session->getFlash('success')?>
</div>
<?php endif; ?>
<div id="login-register" class="login-page">
  <div class="lr-form">
    <div class="logo">
      <a class="d-inline-block" href="index.php">
        <img src="<?php  echo $this->theme->getUrl('img/logo.svg')?>" alt="img">
      </a>
    </div>
    <h3 class="sm-hd text-uppercase"><?=  Yii::t('app', 'WELCOME BACK')?></h3>
     <?php
    
    $form = TActiveForm::begin([
        'id' => 'login-form',
        'options' => [
            'class' => 'login-form form',
            
        ],
        'enableClientValidation' => false,
        'enableAjaxValidation' => false
    ]);
    ?>
      <div class="form-group">
        <?=$form->field ( $model, 'username' )->label ( false )->textInput ( [ 'placeholder' => 'Email address' ] )?>

      </div>
      <div class="form-group">
      		<?=$form->field ( $model, 'password' )->label ( false )->passwordInput ( [ 'placeholder' => 'Password' ] )?>
      </div>
      <div class="row">
        <div class="col-6">
          <div class="form-group form-check">
             <?php echo $form->field($model, 'rememberMe')->checkbox(['value'=>User::IS_NOTCHECKED]);?>

          </div>
        </div>
        <div class="col-6">
          <div class="form-group text-right">
            <a class="for-got" href="<?php echo Url::toRoute(['user/recover'])?>"><?=  Yii::t('app', 'Forgot password?')?></a>
          </div>
        </div>
      </div>
      <div class="form-group">
        <?=Html::submitButton ( 'Login', [ 'class' => 'butn butn-bg d-inline-block text-center w-100','id' => 'login','name' => 'login-button' ] )?>
      </div>
      <div class="form-group">
        <button type="submit" class="border-gry google-btn w-100"><?=  Yii::t('app', 'Continue with Google')?></button>
      </div>
      <p class="font-18 text-center pt-10"><?=  Yii::t('app', 'New to SignalADoc? ')?><a href="<?php echo Url::toRoute(['user/signup'])?>"><?=  Yii::t('app', 'Create an account')?></a></p>
    <?php TActiveForm::end()?>
    <div class="lr-downloads">
      <div class="row align-items-center">
        <div class="col-5 pr-0">
          <p class="theme-blue mb-0"><?=  Yii::t('app', 'Download our')?></p>
          <p class="theme-blue mb-0"><b><?=  Yii::t('app', 'Doctors Mobile App')?></b></p>
        </div>
        <div class="col-7">
          <div class="d-flex">
            <div class="pr-1">
              <a href="#0"><img src="<?php  echo $this->theme->getUrl('img/gplay-icon.png')?>" alt="img"></a>
            </div>
            <div class="pl-2">
              <a href="#0"><img src="<?php  echo $this->theme->getUrl('img/apple-icon.png')?>" alt="img"></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="lr-image" style="background-image: url(<?php  echo $this->theme->getUrl('img/login-banner.png')?>);">
    <h3 class="lr-img-text"><?=  Yii::t('app', 'We’re driving the development of healthcare')?></h3>
  </div>
</div>
