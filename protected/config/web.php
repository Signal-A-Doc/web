<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
$params = require (__DIR__ . '/params.php');

$config = [
    'id' => PROJECT_ID,
    'name' => PROJECT_NAME,
    'basePath' => PROTECTED_PATH,
    'runtimePath' => RUNTIME_PATH,
    'defaultRoute' => 'user/login',
    'bootstrap' => [
        'log',
        'app\components\TBootstrap',
        'languagepicker',
        'session'
    ],
    'vendorPath' => VENDOR_PATH,
    'timeZone' => date_default_timezone_get(),
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset'
    ],
    'components' => [
        'session' => [
            'class' => 'app\components\TSession'
        ],

        'request' => [
            'class' => 'app\components\TRequest'
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

        'languagepicker' => [
            'class' => 'lajax\languagepicker\Component',
            'languages' => [
                'hi' => 'Hindi',
                'kn' => 'Kannada',
                'en' => 'English'
            ]
        ],

        'settings' => [
            'class' => 'app\components\Settings'
        ],
        'firebase' => [
            'class' => 'app\components\FireBaseNotification',
            'authKey' => 'AAAAssOc-lI:APA91bFuYgVJoVG7oy4QW5zQYAHsT9AgLYPCZPxnrs_R_JK9y2FOW6kq-clVZW8Pky9fImXslhmpdT5QEzkzqELFWGTLq1YCw59kfFydxS9D2mddnPrnejQztucwNiQg3qru_yhw0TT2'
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache'
        ],
        'user' => [
            'class' => 'app\components\WebUser'
        ],
        'mailer' => [
            'class' => 'app\components\TMailer',
            'useFileTransport' => YII_ENV == 'dev' ? true : false
        ],
        'log' => [
            'traceLevel' => defined('YII_DEBUG') ? 3 : 0,
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

        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'thousandSeparator' => ',',
            'decimalSeparator' => '.',
            'defaultTimeZone' => date_default_timezone_get(),
            'datetimeFormat' => 'php:Y-m-d h:i:s A',
            'dateFormat' => 'php:Y-m-d'
        ],
        'urlManager' => [
            'class' => 'app\components\TUrlManager',
            'rules' => [
                [
                    'pattern' => 'doctor',
                    'route' => 'user/doctor-index'
                ],
                [
                    'pattern' => 'patient',
                    'route' => 'user/patient-index'
                ],
                [
                    'pattern' => 'patient',
                    'route' => 'user/index'
                ],
                '<controller:file>/<action:files>/<file>' => '<controller>/<action>',
                '<controller:[A-Za-z-]+>/<action:[A-Za-z-]+>/<id:\d+>/<title>' => '<controller>/<action>',
                '<module:[A-Za-z-]+>/<controller:[A-Za-z-]+>/<action:[A-Za-z-]+>/<id:\d+>/<title>' => '<module>/<controller>/<action>',
                '<module:[A-Za-z-]+>/<controller:[A-Za-z-]+>/<id:\d+>/<title>' => '<module><controller>/view',
                '<module:[A-Za-z-]+>/<controller:[A-Za-z-]+>/<action:[A-Za-z-]+>/<id:\d+>' => '<module>/<controller>/<action>',
                '<controller:[A-Za-z-]+>/<id:\d+>/<title>' => '<controller>/view',
                '<controller:[A-Za-z-]+>/<id:\d+>' => '<controller>/view',
                '<controller:[A-Za-z-]+>/<action:[A-Za-z-]+>/<id:\d+>' => '<controller>/<action>',
                '<action:about|contactus|privacy|settings|copyright|terms>' => 'site/<action>'
            ]
        ],
        'view' => [
            'theme' => [
                'class' => 'app\components\AppTheme',
                'name' => 'signal-theme', // 'admin_pro' 'new'
                //'name' => 'base', // 'admin_pro' 'new'
                'style' => 'success' // ['info',danger,warning,success]
            ]
        ]
    ],
    'params' => $params,
    'modules' => [
        'sitemap' => [
            'class' => 'app\modules\sitemap\Module',
            'models' => [
                // your models
                'app\models\Page'
            ],
            'urls' => [
                [
                    'loc' => '/',
                    'priority' => '1.0'
                ],
                [
                    'loc' => 'contact'
                ],
                [
                    'loc' => 'features'
                ],
                [
                    'loc' => 'our-team'
                ],
                [
                    'loc' => 'how-it-works'
                ],
                [
                    'loc' => 'about'
                ],
                [
                    'loc' => 'blogs'
                ]
            ],
            'enableGzip' => true
        ]
    ]
];

if (file_exists(DB_CONFIG_FILE_PATH)) {
    $config['components']['db'] = require (DB_CONFIG_FILE_PATH);
} else {
    $config['modules']['installer'] = [
        'class' => 'app\modules\installer\Module',
        'sqlfile' => [
            DB_BACKUP_FILE_PATH . '/install.sql'
        ],
        'exts' => [
            'imap'
        ]
    ];
    // define('MODE_INSTALL', true);
}
$config['modules']['notification'] = [
    'class' => 'app\modules\notification\Module',
    'isNotify' => true
];
$config['modules']['payment'] = [
    'class' => 'app\modules\payment\Module'
];

$config['modules']['backup'] = [
    'class' => 'app\modules\backup\Module'
];
$config['modules']['api'] = [
    'class' => 'app\modules\api2\Module'
];
$config['components']['errorHandler'] = [
    'errorAction' => 'log/custom-error'
];
$config['modules']['file'] = [
    'class' => 'app\modules\file\Module'
];
// $config['modules']['blog'] = [
// 'class' => 'app\modules\blog\Module'
// ];

// $config['modules']['comment'] = [
// 'class' => 'app\modules\comment\Module'
// ];
// $config['modules']['seo'] = [
// 'class' => 'app\modules\seo\Module'
// ];
if (YII_ENV == 'dev') {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = 'yii\debug\Module';

    $config['modules']['tugii'] = [
        'class' => 'app\modules\tugii\Module'
    ];
}
return $config;