<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\base;

use app\models\User;
use Yii;
use yii\web\Controller;
use app\models\Promocode;

class TBaseController extends Controller
{

    public $layout = '//guest-main';

    public $menu = [];

    public $top_menu = [];

    public $side_menu = [];

    public $user_menu = [];

    public $tabs_data = null;

    public $tabs_name = null;

    public $dryRun = false;

    public $assetsDir = '@webroot/assets';

    public $ignoreDirs = [];

    public $nav_left = [];

    public $_author = '@toxsl';

    // nav-left-medium';
    protected $_pageCaption;

    protected $_pageDescription;

    protected $_pageKeywords;

    public function beforeAction($action)
    {
        if (User::isAdmin()) {
            $this->layout = 'main';
        } else {
            $this->layout = 'guest-main';
        }

        $promocodes = Promocode::findActive()->all();

        if (! empty($promocodes)) {
            foreach ($promocodes as $promocode) {

                if (strtotime($promocode->valid_till) < strtotime(date('d-m-Y'))) {
                    $promocode->state_id = Promocode::STATE_EXPIRED;
                    $promocode->updateAttributes([
                        'state_id'
                    ]);
                }
            }
        }

        if (\Yii::$app->controller->action->id == "payment-complete") {
            $this->enableCsrfValidation = false;
        }

        return parent::beforeAction($action);
    }

    public static function addmenu($label, $link, $icon, $visible = null, $list = null)
    {
        if (! $visible)
            return null;
        $item = [
            'label' => '<i
							class="fa fa-' . $icon . '"></i> <span>' . $label . '</span>',
            'url' => [
                $link
            ]
        ];
        if ($list != null) {
            $item['options'] = [
                'class' => 'menu-list'
            ];

            $item['items'] = $list;
        }

        return $item;
    }

    public function renderNav()
    {
        $this->nav_left = [
            self::addMenu(Yii::t('app', 'Dashboard'), '//dashboard/index', 'home', ! User::isGuest()),
            self::addMenu(Yii::t('app', 'Doctor'), '//user/doctor-index', 'stethoscope', (User::isAdmin())),
            self::addMenu(Yii::t('app', 'Patient'), '//user/patient-index', 'user', (User::isAdmin())),
            self::addMenu(Yii::t('app', 'Medical Condition'), '//category/', 'stethoscope', (User::isAdmin())),
            self::addMenu(Yii::t('app', 'Area of specialization'), '//category/department', 'stethoscope', (User::isAdmin())),
            self::addMenu(Yii::t('app', 'Professional status'), '//doctorprofessionalstatus/', 'tasks', (User::isAdmin())),
            self::addMenu(Yii::t('app', 'Banner'), '//banner/index', 'flag', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Category Question'), '//category-question/index', 'question', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Category Answer'), '//category-answer/index', 'reply', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Language List'), '//language-list/index', 'reply', User::isAdmin()),
            //self::addMenu(Yii::t('app', 'Symptoms'), '//symptom/index', 'medicine', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Consultation Modes'), '//consultation-availability/index', 'mobile', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Appointment Question'), '//appointment-questions/index', 'question', User::isAdmin()),
            self::addMenu(Yii::t('app', 'Thermometer Location'), '//thermometer-location/index', 'thermometer-full', User::isAdmin()),
            
            'Manage' => self::addMenu(Yii::t('app', 'Manage'), '#', 'tasks', User::isAdmin(), [
                self::addMenu(Yii::t('app', 'Logs'), '//log/index', 'file', User::isAdmin()),
                self::addMenu(Yii::t('app', 'Email Queue'), '//email-queue/index', 'envelope', User::isAdmin()),

                self::addMenu(Yii::t('app', 'Login History'), '//login-history/index', 'history', User::isAdmin()),

                self::addMenu(Yii::t('app', 'Settings'), '//setting/index', 'gear', User::isAdmin())
            ]),
            self::addMenu(Yii::t('app', 'Page'), '//page/', 'file-text', ! User::isGuest())
        ];
        $this->nav_left = array_merge($this->nav_left, $this->renderModuleNev());
        return $this->nav_left;
    }

    public function renderModuleNev()
    {
        $config = include (DB_CONFIG_PATH . 'web.php');
        $nav = [];
        if (! empty($config['modules'])) {
            foreach ($config['modules'] as $modules) {
                $class = isset($modules['class']) ? $modules['class'] : null;
                if (class_exists("$class") && method_exists($class, 'subNav')) {
                    if (! empty($class::subNav())) {
                        $nav[] = $class::subNav();
                    }
                }
            }
        }
        return $nav;
    }
}
