<?php
use app\assets\AppAsset;
use app\models\User;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Html;
use yii\helpers\Url;
use app\components\FlashMessage;

/* @var $this \yii\web\View */
/* @var $content string */

$this->title = yii::$app->name;
AppAsset::register($this);
?>
<?php $this->beginPage()?>
<!DOCTYPE html>
<html lang="<?=Yii::$app->language?>">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
  <meta charset="<?=Yii::$app->charset?>" />
  <?=Html::csrfMetaTags()?>
  <title>
    <?=Html::encode($this->title)?>
  </title>
  <?php	$this->head()?>

  <link rel="shortcut icon" href="" />

  <!-- Plugins -->
  <link rel="stylesheet" href="<?php  echo $this->theme->getUrl('css/plugins.css')?>" />

  <!-- Core Style Css -->
  <link rel="stylesheet" href="<?php  echo $this->theme->getUrl('css/style.css')?>" />

  <!-- Core Style Css -->
  <link rel="stylesheet" href="<?php  echo $this->theme->getUrl('css/customscrollbar.css')?>" />

  <!-- responsive Css -->
  <link rel="stylesheet" href="<?php  echo $this->theme->getUrl('css/responsive.css')?>" />

 <link rel="shortcut icon" href="<?php  echo $this->theme->getUrl('frontend/images/favicon.ico')?>" type="image/x-icon">
  <link rel="icon" href="<?php  echo $this->theme->getUrl('frontend/images/favicon.ico')?>" type="image/x-icon">

  <link rel="shortcut icon" href="<?php	echo $this->theme->getUrl('img/favicon.ico')?>" type="image/x-icon">
  <link rel="icon" href="<?php	echo $this->theme->getUrl('img/favicon.ico')?>" type="image/x-icon">
</head>
<body class="inner-page">
  <?php  $this->beginBody()?>
  <!-- body content start-->

  <div class="main_wrapper">
    <?=FlashMessage::widget(['type' => 'toaster' /* 'position' => 'bottom-right' */])?>

    <?=$content?>
  </div>

  <!--body wrapper end-->

<!-- custom -->
<script src="<?php  echo $this->theme->getUrl('js/custom.js')?>"></script>

<!-- Custom Scrollbar -->
<script src="<?php  echo $this->theme->getUrl('js/customscrollbar.js')?>"></script>

  <!-- body content end-->
  <?php $this->endBody()?>
</body>
<?php $this->endPage()?>
</html>
