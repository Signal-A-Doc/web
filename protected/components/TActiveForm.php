<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\components;

use yii\bootstrap4\ActiveForm;

class TActiveForm extends ActiveForm {
	public $enableAjaxValidation = true;
	public $enableClientValidation = true;
	public $options = [ 
			'enctype' => 'multipart/form-data' 
	];
	public $fieldClass = 'app\components\TActiveField';
}
