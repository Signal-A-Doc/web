<?php
use yii\console\Exception;

$fp = fopen(__DIR__ . '/timer-schedule.lock', 'w+');

if (! flock($fp, LOCK_EX | LOCK_NB)) {
    exit();
}
require 'common.php';

$config = require (DB_CONFIG_PATH . '/console.php');

require (VENDOR_PATH . 'autoload.php');
require (VENDOR_PATH . 'yiisoft/yii2/Yii.php');

$application = new yii\console\Application($config);

function dlog($str)
{
    echo $str . PHP_EOL;
}

function cmd($application, $cmd)
{
    try {
        ob_start();
        $application->runAction($cmd);
        dlog(ob_get_clean());
    } catch (Exception $ex) {
        echo $ex->getMessage();
    }
    echo htmlentities(ob_get_clean(), null, Yii::$app->charset);
}
cmd($application, 'timer/email');
cmd($application, 'timer/send-appointment-alert');

flock($fp, LOCK_UN);

fclose($fp);
