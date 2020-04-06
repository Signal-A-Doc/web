<?php

/**
 * This is the model class for table "tbl_call_log".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $session_id
 * @property integer $appointment_id
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id
 
 * === Related data ===
 * @property Appointment $appointment
 * @property User $createdBy
 * @property User $user
 */
namespace app\models;

use Yii;
use app\models\Appointment;
use app\models\User;
use yii\helpers\ArrayHelper;

class CallLog extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->user_id;
    }

    public static function getUserOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( User::findActive ()->all (), 'id', 'title' );
    }

    public static function getSessionOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Session::findActive ()->all (), 'id', 'title' );
    }

    public function getSession()
    {
        $list = self::getSessionOptions();
        return isset($list[$this->session_id]) ? $list[$this->session_id] : \Yii::t('app', 'Not Defined');
    }

    public static function getAppointmentOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
        ];
        // return ArrayHelper::Map ( Appointment::findActive ()->all (), 'id', 'title' );
    }

    const STATUS_INITIATED = 1;

    const STATUS_RECIEVER = 2;

    const STATUS_STARTED = 3;

    const STATUS_DISCONNECTED = 4;

    const STATUS_DELETED = 5;

    const STATUS_NOTPICKED = 6;

    const STATUS_FAILED = 7;

    const STATUS_ENDED = 8;

    public static function getStateOptions()
    {
        return [
            self::STATUS_INITIATED => \Yii::t('app', "Initiated"),
            self::STATUS_RECIEVER => \Yii::t('app', "Receiver"),
            self::STATUS_STARTED => \Yii::t('app', "Started"),
            self::STATUS_DISCONNECTED => \Yii::t('app', "Disconnected"),
            self::STATUS_DELETED => \Yii::t('app', "Deleted"),
            self::STATUS_NOTPICKED => \Yii::t('app', "Not Picked"),
            self::STATUS_FAILED => \Yii::t('app', "Failed"),
            self::STATUS_ENDED => \Yii::t('app', "Ended")
        ];
    }

    public function getState()
    {
        $list = self::getStateOptions();
        return isset($list[$this->state_id]) ? $list[$this->state_id] : \Yii::t('app', 'Not Defined');
    }

    public function getStateBadge()
    {
        $list = [
            self::STATUS_INITIATED => "primary",
            self::STATUS_RECIEVER => "success",
            self::STATUS_STARTED => "danger",
            self::STATUS_DISCONNECTED => "primary",
            self::STATUS_DELETED => "success",
            self::STATUS_NOTPICKED => "danger",
            self::STATUS_FAILED => "primary",
            self::STATUS_ENDED => "success"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : \Yii::t('app', 'Not Defined');
    }

    const TYPE_VIDEO_CALL = 1;

    const TYPE_AUDIO_CALL = 2;

    const TYPE_CHAT = 3;

    const TYPE_APPOINTMENT = 4;

    const TYPE_APPOINTMENT_ALERT = 5;

    const TYPE_QUESTION = 6;

    const TYPE_PROMO = 7;

    public static function getTypeOptions()
    {
        return [
            self::TYPE_VIDEO_CALL => \Yii::t('app', "Video Call"),
            self::TYPE_AUDIO_CALL => \Yii::t('app', "Audio Call"),
            self::TYPE_CHAT => \Yii::t('app', "Chat")
        
        ];
        // return ArrayHelper::Map ( Type::findActive ()->all (), 'id', 'title' );
    }

    public function getType()
    {
        $list = self::getTypeOptions();
        return isset($list[$this->type_id]) ? $list[$this->type_id] : \Yii::t('app', 'Not Defined');
    }

    public function beforeValidate()
    {
        if ($this->isNewRecord) {
            if (! isset($this->user_id))
                $this->user_id = Yii::$app->user->id;
            if (! isset($this->created_on))
                $this->created_on = date('Y-m-d H:i:s');
            if (! isset($this->updated_on))
                $this->updated_on = date('Y-m-d H:i:s');
            if (! isset($this->created_by_id))
                $this->created_by_id = Yii::$app->user->id;
        } else {
            $this->updated_on = date('Y-m-d H:i:s');
        }
        return parent::beforeValidate();
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%call_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'user_id',
                    'session_id',
                    'appointment_id',
                    'created_on',
                    'updated_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'user_id',
                    'appointment_id',
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'session_id',
                    'created_on',
                    'updated_on',
                    'start_time',
                    'end_time'
                ],
                'safe'
            ],
            [
                [
                    'appointment_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => Appointment::className(),
                'targetAttribute' => [
                    'appointment_id' => 'id'
                ]
            ],
            [
                [
                    'created_by_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => [
                    'created_by_id' => 'id'
                ]
            ],
            [
                [
                    'user_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => [
                    'user_id' => 'id'
                ]
            ],
            [
                [
                    'state_id'
                ],
                'in',
                'range' => array_keys(self::getStateOptions())
            ],
            [
                [
                    'type_id'
                ],
                'in',
                'range' => array_keys(self::getTypeOptions())
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'Reciever'),
            'session_id' => Yii::t('app', 'Session'),
            'appointment_id' => Yii::t('app', 'Appointment'),
            'state_id' => Yii::t('app', 'State'),
            'type_id' => Yii::t('app', 'Type'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Sender')
        ];
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAppointment()
    {
        return $this->hasOne(Appointment::className(), [
            'id' => 'appointment_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), [
            'id' => 'created_by_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), [
            'id' => 'user_id'
        ]);
    }

    public static function getHasManyRelations()
    {
        $relations = [];
        return $relations;
    }

    public static function getHasOneRelations()
    {
        $relations = [];
        $relations['id'] = [
            'feeds',
            'Feed',
            'model_id'
        ];
        $relations['appointment_id'] = [
            'appointment',
            'Appointment',
            'id'
        ];
        $relations['created_by_id'] = [
            'createdBy',
            'User',
            'id'
        ];
        $relations['user_id'] = [
            'user',
            'User',
            'id'
        ];
        return $relations;
    }

    public function getFeeds()
    {
        return $this->hasMany(Feed::className(), [
            'model_id' => 'id'
        ])->andWhere([
            'model_type' => self::className()
        ]);
    }

    public function beforeDelete()
    {
        return parent::beforeDelete();
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['user_id'] = $this->user_id;
        $json['session_id'] = $this->session_id;
        $json['appointment_id'] = $this->appointment_id;
        $json['start_time'] = $this->start_time;
        $json['end_time'] = $this->end_time;
        $json['state_id'] = $this->state_id;
        $json['type_id'] = $this->type_id;
        $json['created_on'] = $this->created_on;
        $json['created_by_id'] = $this->created_by_id;
        if ($with_relations) {
            // appointment
            $list = $this->appointment;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['appointment'] = $relationData;
            } else {
                $json['Appointment'] = $list;
            }
            // createdBy
            $list = $this->createdBy;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['createdBy'] = $relationData;
            } else {
                $json['CreatedBy'] = $list;
            }
            // user
            $list = $this->user;
            
            if (is_array($list)) {
                $relationData = [];
                foreach ($list as $item) {
                    $relationData[] = $item->asJson();
                }
                $json['user'] = $relationData;
            } else {
                $json['User'] = $list;
            }
        }
        return $json;
    }

    public static function saveLog($id, $sessionId, $type, $appointment_id)
    {
        $log = new CallLog();
        $log->user_id = $id;
        $log->session_id = $sessionId;
        $log->created_by_id = \Yii::$app->user->id;
        $log->state_id = CallLog::STATUS_INITIATED;
        $log->type_id = $type;
        $log->appointment_id = $appointment_id;
        if (! $log->save()) {
            
            \Yii::error('CALL LOG ERRORS');
            \Yii::error(\yii\helpers\VarDumper::dumpAsString($log->errors));
            return false;
        }
        return $log;
    }
}
