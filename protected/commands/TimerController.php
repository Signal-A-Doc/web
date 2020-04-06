<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\commands;

use app\components\Settings;
use app\models\EmailQueue;
use app\modules\backup\helpers\MysqlBackup;
use yii\console\Controller;
use app\models\SubscribedUsers;
use app\models\User;
use app\models\Subscription;
use app\modules\notification\models\Notification;
use app\models\Appointment;
use app\models\CallLog;
use app\components\TConsoleController;
class TimerController extends  TConsoleController
{

    const MAX_ATTEMPTS = 5;

    public function actionEmail()
    {
        $mails = EmailQueue::find()->limit(50)
            ->orderBy('id asc')
            ->all();
        foreach ($mails as $mail) {
            $mail->sendNow();
        }
        return true;
    }

    public function log($string)
    {
        echo $string . PHP_EOL;
    }

    public function actionBackup()
    {
        $sql = new MysqlBackup();
        $settings = \Yii::$app->settings;
        $backup_interval = $settings->getValue('db_backup', '7');
        $last_backup = $settings->getValue('last_backup', '2017-10-10');
        $last_backup_time = strtotime($last_backup);
        $next_backup_time = strtotime("+" . $backup_interval . "days", $last_backup_time);
        $this->log(__FUNCTION__ . ":last_backup_time = $last_backup_time  and next_backup_time=$next_backup_time");
        if (time() >= $next_backup_time) {
            $settings->setValue('last_backup', date("Y-m-d H:i:s"));
            if (! $sql->startBackup()) {
                $this->log(__FUNCTION__ . ":Started");
            }
            $tables = $sql->getTables();
            foreach ($tables as $tableName) {
                $sql->getColumns($tableName);
            }
            foreach ($tables as $tableName) {
                $sql->getData($tableName);
            }
            
            $sqlFile = $sql->endBackup();
            $this->log(__FUNCTION__ . ":Finished : " . $sqlFile);
            return $sqlFile;
        }
    }

    public function actionCheckSubscriptionValidity()
    {
        $today = date('Y-m-d');
        $models = SubscribedUsers::find()->where([
            'state_id' => SubscribedUsers::STATE_ACTIVE,
            'payment_status' => SubscribedUsers::PAYMENT_STATUS_PAID
        ]);
        foreach ($models->batch() as $users) {
            foreach ($users as $user) {
                if ($user->type_id == SubscribedUsers::TYPE_DOCTOR) {
                    if ($user->userPlan->type_id == Subscription::TYPE_MONTHLY) {
                        $date = date('Y-m-d', strtotime("+1 months", strtotime($user->created_on)));
                    } elseif ($user->userPlan->type_id == Subscription::TYPE_QUARTERLY) {
                        $date = date('Y-m-d', strtotime("+3 months", strtotime($user->created_on)));
                    } elseif ($user->userPlan->type_id == Subscription::TYPE_HALF_YEARLY) {
                        $date = date('Y-m-d', strtotime("+6 months", strtotime($user->created_on)));
                    } else {
                        $date = date('Y-m-d', strtotime("+12 months", strtotime($user->created_on)));
                    }
                } else {
                    
                    if ($user->patientPlan->type_id == Subscription::TYPE_MONTHLY) {
                        $date = date('Y-m-d', strtotime("+1 months", strtotime($user->created_on)));
                    } elseif ($user->patientPlan->type_id == Subscription::TYPE_QUARTERLY) {
                        $date = date('Y-m-d', strtotime("+3 months", strtotime($user->created_on)));
                    } elseif ($user->patientPlan->type_id == Subscription::TYPE_HALF_YEARLY) {
                        $date = date('Y-m-d', strtotime("+6 months", strtotime($user->created_on)));
                    } else {
                        $date = date('Y-m-d', strtotime("+12 months", strtotime($user->created_on)));
                    }
                }
                if ($date < $today) {
                    $user->state_id = SubscribedUsers::STATE_INACTIVE;
                    if ($user->updateAttributes([
                        'state_id'
                    ])) {
                        $message = 'Your Plan has been expired';
                        
                        Notification::create($param = [
                            'to_user_id' => $user->created_by_id,
                            'created_by_id' => $user->created_by_id,
                            'title' => $message,
                            'model' => $user
                        ]);
                    }
                }
            }
        }
    }

    public function actionSendAppointmentAlert()
    {
        $date = date('Y-m-d');
        $time = date('H:i:s');
        
        $timestamp = strtotime($time);
        $timestamp = $timestamp - (15 * 60);
        $time_match = date("H:i:s", $timestamp);
        
        $notification = Notification::find()->select('model_id')
            ->where([
            'type_id' => CallLog::TYPE_APPOINTMENT_ALERT,
            'model_type' => Appointment::className()
        ])
            ->column();
        
        $models = Appointment::find()->where([
            'date' => $date,
            'payment_status' => SubscribedUsers::PAYMENT_STATUS_PAID
        ])
            ->andWhere([
            'IN',
            'state_id',
            [
                Appointment::STATE_ACCEPT,
                Appointment::STATE_SCHEDULE
            ]
        ])
            ->andWhere([
            '>=',
            'time',
            $time_match
        ])
            ->andWhere([
            'NOT IN',
            'id',
            $notification
        ]);
        foreach ($models->batch() as $users) {
            
            foreach ($users as $user) {
                
                if (! empty($user->doctor)) {
                    
                    $message = 'You have an appointment with ' . $user->createdBy->full_name . ' at ' . $user->time;
                    
                    Notification::create($param = [
                        'to_user_id' => $user->doctor_id,
                        'created_by_id' => $user->created_by_id,
                        'title' => $message,
                        'type_id' => CallLog::TYPE_APPOINTMENT_ALERT,
                        'model' => $user
                    ]);
                    
                    EmailQueue::add([
                        'model' => $user,
                        'from' => \Yii::$app->params['adminEmail'],
                        'to' => $user->doctor->email,
                        'subject' => 'Appointment Alert',
                        'view' => 'sendProjectRequest',
                        'viewArgs' => [
                            'model' => $user,
                            'login' => $user->doctor,
                            'user' => $user->createdBy
                        ]
                    ]);
                }
                
                if (! empty($user->createdBy)) {
                    $message = 'You have an appointment with ' . $user->doctor->full_name . ' at ' . $user->time;
                    
                    Notification::create($param = [
                        'to_user_id' => $user->created_by_id,
                        'created_by_id' => $user->doctor_id,
                        'title' => $message,
                        'type_id' => CallLog::TYPE_APPOINTMENT_ALERT,
                        'model' => $user
                    ]);
                    
                    EmailQueue::add([
                        'model' => $user,
                        'from' => \Yii::$app->params['adminEmail'],
                        'to' => $user->createdBy->email,
                        'subject' => 'Appointment Alert',
                        'view' => 'sendProjectRequest',
                        'viewArgs' => [
                            'model' => $user,
                            'login' => $user->createdBy,
                            'user' => $user->doctor
                        ]
                    ]);
                }
            }
        }
    }
}


