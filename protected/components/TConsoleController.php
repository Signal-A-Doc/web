<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */
namespace app\components;

use yii\console\Controller;

class TConsoleController extends Controller
{
    public $force = false;

    public $dryRun = false;

    public function options($actionID)
    {
        return [
            'dryRun',
            'force'
        ];
    }

    public function optionAliases()
    {
        return [
            'd' => 'dryRun',
            'f' => 'force'
        ];
    }
    public static function shellExec($strings)
    {
        echo shell_exec($strings);
    }
    public static function log($strings)
    {
        if (php_sapi_name() == "cli") {
            echo $strings . PHP_EOL;
        } else {
            \Yii::debug($strings);
        }
    }
}

