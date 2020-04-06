<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class LoginForm extends Model
{

    public $username;

    public $contact_no;

    public $role_id;

    public $password;

    public $rememberMe = true;

    private $_user = false;

    public $device_token;

    public $device_type;

    public $device_name;

    public function asJson()
    {
        $Json = [];
        $Json['username'] = $this->username;
        $Json['role_id'] = $this->role_id;
        $Json['contact_no'] = $this->contact_no;
        $Json['device_token'] = $this->device_token;
        $Json['device_type'] = $this->device_type;
        $Json['device_name'] = $this->device_name;
        return $Json;
    }

    /**
     *
     * @return array the validation rules.
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();

        $scenarios['patient-login'] = [
            'contact_no',
            'password',
            'device_token',
            'device_type',
            'device_name'
        ];

        return $scenarios;
    }

    public function rules()
    {
        return [
            // username and password are both required
            [
                [
                    'username',
                    'password'
                ],
                'required'
            ],
            [
                [
                    'contact_no',
                    'password'
                ],
                'required',
                'on' => 'patient-login'
            ],
            [
                [
                    'username',
                    'password'
                ],
                'trim'
            ],
            [
                [
                    'username'
                ],
                'email',
                'message' => \Yii::t('app', 'Email is not a valid email address.')
            ],
            // rememberMe must be a boolean value
            [
                'rememberMe',
                'boolean'
            ],
            [
                [
                    'device_token',
                    'device_type',
                    'contact_no',
                    'user_name',
                    'role_id'
                ],
                'safe'
            ]
        ];
    }

    public function validatePassword($user)
    {
        if (! $this->hasErrors()) {
            if (! $user || ! $user->validatePassword($this->password)) {
                $this->addError('password', \Yii::t('app', 'Incorrect username or password.'));
            }
        }
        return true;
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return boolean whether the user is logged in successfully
     */
    public function login($is_api = false)
    {
        if ($this->validate()) {
            $user = $this->getUser();
            if ($user) {
                if ($is_api) {
                    if (! $user->isActive()) {
                        $this->addError('Email', 'User is ' . $user->state);
                    } elseif ($user->role_id == User::ROLE_ADMIN) {
                        $this->addError('username', 'You are not allowed to perform this action.');
                    } elseif (! $user->validatePassword($this->password)) {
                        $this->addError('password', 'Incorrect Email or password.');
                    }
                } else {
                    if (! $user->isActive()) {
                        $this->addError('Email', 'User is ' . $user->state);
                    } elseif ($user->role_id == User::ROLE_PATIENT || $user->role_id == User::ROLE_DOCTOR) {
                        $this->addError('username', 'You are not allowed to perform this action.');
                    } elseif (! $user->validatePassword($this->password)) {
                        $this->addError('password', 'Incorrect Email or password.');
                    }
                }
                if (! $this->hasErrors()) {
                    LoginHistory::add(true, $user, null);
                    return Yii::$app->user->login($user, $this->rememberMe ? 3600 * 24 * 30 : 0);
                }
            } else {
                $this->addError('username', 'Incorrect Email.');
            }
            LoginHistory::add(false, $user, $this->errors);
        }
        return false;
    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }

    public function getPatient()
    {
        if ($this->_user === false) {

            $this->_user = User::findByContactno($this->contact_no);
        }

        return $this->_user;
    }

    public function getErrorsString()
    {
        $out = '';
        if ($this->errors != null)
            foreach ($this->errors as $err) {
                $out .= implode(',', $err);
            }
        return $out;
    }
}
