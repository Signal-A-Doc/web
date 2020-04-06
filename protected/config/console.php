<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
if (php_sapi_name() != "cli") {
    echo 'Please run this file from command line interface !!!';
    exit();
}
$params = require (__DIR__ . '/params.php');

$config = [
    'id' => PROJECT_ID,
    'name' => PROJECT_NAME,
    'basePath' => PROTECTED_PATH,
    'runtimePath' => RUNTIME_PATH,

    'bootstrap' => [
        'log'
    ],

    'vendorPath' => VENDOR_PATH,
    'timeZone' => date_default_timezone_get(),
    'controllerNamespace' => 'app\commands',

    'components' => [
        'urlManager' => [
            'class' => 'app\components\TUrlManager',
            'baseUrl' => (YII_ENV == 'dev') ? 'https://callvydya.com/' : 'https://callvydya.com/',
            'enablePrettyUrl' => true,
            'showScriptName' => false
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache'
        ],
        'log' => [
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => [
                        'error',
                        'warning'
                    ]
                ]
            ]
        ],
        'html2pdf' => [
            'class' => 'yii2tech\html2pdf\Manager',
            'viewPath' => '@app/pdf',
            'converter' => [
                'class' => 'yii2tech\html2pdf\converters\Wkhtmltopdf',
                'defaultOptions' => [
                    'pageSize' => 'A4'
                ]
            ]
        ],
        'settings' => [
            'class' => 'app\components\Settings'
        ],
        // 'user' => [
        // 'class' => 'app\components\WebUser'
        // ],
        'mailer' => [
            'class' => 'app\components\TMailer',
            'useFileTransport' => YII_ENV == 'dev' ? true : false
        ],
        'session' => [
            'class' => 'yii\web\Session'
        ]
    ],
    'params' => $params,
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset'
    ]

];

if (file_exists(DB_CONFIG_FILE_PATH)) {
    $config['components']['db'] = require (DB_CONFIG_FILE_PATH);
}

$config['modules']['installer'] = [
    'class' => 'app\modules\installer\Module',
    'sqlfile' => [
        DB_BACKUP_FILE_PATH . '/install.sql'
    ],
    'exts' => [
        'imap'
    ]
];
$config['modules']['notification'] = [
    'class' => 'app\modules\notification\Module',
    'isNotify' => true
];
$config['modules']['backup'] = [
    'class' => 'app\modules\backup\Module'
];
return $config;
