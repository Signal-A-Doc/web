<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\components\validators;

use yii\validators\Validator;

class TNameValidator extends Validator {
    public $pattern = "/^[A-Za-z.]+((\s)?([A-Za-z])+)*$/" ;
	public function validateAttribute($model, $attribute) {
	    if (!defined('MIGRATION_IN_PROGRESS') && ! preg_match ( $this->pattern, $model->$attribute ))
			$model->addError ( $attribute, $model->getAttributeLabel ( $attribute ) . ' is invalid.' );
	}
}