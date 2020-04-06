<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
use app\models\User;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */

$Link = $user->getLoginUrl();
?>
<?= $this->render ( 'header.php' );?>
<tr>
	<td align="left">
		<p> <?= \Yii::t('app', 'Hello'. $login->full_name) ?> </p>

		<p>
		<?= \Yii::t('app', 'You have an appointment with : ') ?> </p>
		
		<?= \Yii::t('app', 'Patient Name : ') ?><?= $user->full_name ?> </p>
		
		<?= \Yii::t('app', 'Time : ') ?><?= $model->time ?> </p>
	</td>
</tr>
<?= $this->render ( 'footer.php' );?>