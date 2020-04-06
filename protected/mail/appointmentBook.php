<?php
use app\models\User;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user common\models\User */

?>
<?= $this->render ( 'header.php' );?>
<tr>
	<td align="left"
		style="font-family: Lato, sans-serif; padding-top: 30px; padding-bottom: 0; color: #333333;"><h3
			style="margin: 0; font-weight: 500; font-size: 19px;">Hi <?php

echo Html::encode(! empty($user->doctor) ? $user->doctor->full_name : '')?>,</h3></td>
</tr>

<tr>

	<td align="left">
		<p
			style="font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;">New Appointment has been booked by <?= $user->createdBy->full_name ?>. You can seen the user details below :</p>

		<p
			style="font-size: 14px; padding: 0 0px 23px; border-bottom: 1px solid #ececec; text-align: left; color: #666; margin-bottom: 8px;">
			
			Username:<?php

echo Html::encode($user->createdBy->full_name)?></br> </br>
			User Email:<?php

echo Html::encode($user->createdBy->email)?></br> </br>
		</p>


	</td>
</tr>

<?= $this->render ( 'footer.php' );?>
  
  