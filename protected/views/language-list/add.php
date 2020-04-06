<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\LanguageList */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Language Lists'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('app', 'Add');
?>

<div class="wrapper">
	<div class="card">
		<div class="language-list-create">
			<?=  \app\components\PageHeader::widget(); ?>
		</div>
	</div>

	<div class="content-section clearfix card">
		<?= $this->render ( '_form', [ 'model' => $model ] )?>
	</div>
</div>


