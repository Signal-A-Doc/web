<?php
namespace app\base;

use app\models\User;
use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Html;
use app\modules\payment\models\Transaction;
use Stripe\Subscription;
use app\models\SubscribedUsers;
use Stripe\Stripe;

/**
 * This is the generic model class
 */
class TBaseActiveRecord extends ActiveRecord
{

    public function isAllowed()
    {
        if (User::isAdmin())
            return true;
        if ($this instanceof User) {
            return ($this->id == Yii::$app->user->id);
        }
        if ($this instanceof self) {
            if ($this->created_by_id == Yii::$app->user->id)
                return ($this->created_by_id == Yii::$app->user->id);
        }
        return false;
    }

    public function displayImage($file, $options = [], $defaultImg = 'default.png')
    {
        $opt = [
            'class' => 'img-responsive',
            'id' => 'profile_file'
        ];
        
        $arr = array_merge($opt, $options);
        
        if (! empty($file) && file_exists(UPLOAD_PATH . '/' . $file)) {
            return Html::img([
                '/user/download',
                'profile_file' => $file
            ], $arr);
        } else {
            return Html::img(\Yii::$app->view->theme->getUrl('/img/') . $defaultImg, $arr);
        }
    }

    public function payment($model, $token, $amount)
    {
        $setting = \Yii::$app->settings;
        
        $stripeKey = $setting->getValue('stripeKey', '', 'stripe');
        if (empty($stripeKey)) {
            $stripeKey = 'sk_test_oxorbKKcqQsgaJvGMBL1vOjz';
        }
        $data['status'] = 'NOK';
        Stripe::setApiKey($stripeKey);
        
        $finalAmout = $amount * 100;
        try {
            $charge = \Stripe\Charge::create([
                'amount' => $finalAmout,
                'currency' => 'INR',
                'source' => $token
            ]);
            
            if (! empty($charge)) {
                $user = \Yii::$app->user->identity;
                $transaction = new Transaction();
                $transaction->name = $user->full_name;
                $transaction->model_id = $model->id;
                $transaction->model_type = get_class($model);
                $transaction->amount = $amount;
                $transaction->currency = 'INR';
                $transaction->transaction_id = $charge['id'];
                $transaction->value = json_encode($charge);
                $transaction->payment_status = Transaction::PAYMENT_STATUS_SUCCESS;
                $transaction->gateway_type = \app\models\Subscription::PAYMENT_TYPE_CARD;
                if (empty($charge['failure_code'])) {
                    
                    $transaction->payment_status = SubscribedUsers::PAYMENT_STATUS_PAID;
                } else {
                    $transaction->payment_status = SubscribedUsers::PAYMENT_STATUS_UNPAID;
                }
                
                if (! $transaction->save()) {
                    
                    $data['error'] = $transaction->getErrorsString();
                } else {
                    $data['status'] = 'OK';
                }
            }
        } catch (\Stripe\Error\Card $e) {
            $data['error'] = $e->getMessage();
        } catch (\Stripe\Error\RateLimit $e) {
            $data['error'] = $e->getMessage();
        } catch (\Stripe\Error\InvalidRequest $e) {
            $data['error'] = $e->getMessage();
        } catch (\Stripe\Error\Authentication $e) {
            $data['error'] = $e->getMessage();
        } catch (\Stripe\Error\ApiConnection $e) {
            $data['error'] = $e->getMessage();
        } catch (\Stripe\Error\Base $e) {
            $data['error'] = $e->getMessage();
        } catch (\Exception $e) {
            $data['error'] = $e->getMessage();
        }
        
        return $data;
    }
}
