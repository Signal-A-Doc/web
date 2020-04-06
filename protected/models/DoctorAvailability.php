<?php

/**
 * This is the model class for table "tbl_doctor_availability".
 *
 * @property integer $id
 * @property string $date
 * @property integer $state_id
 * @property integer $type_id
 * @property string $created_on
 * @property string $updated_on
 * @property integer $created_by_id

 * === Related data ===
 * @property Availabilitytime[] $availabilitytimes
 * @property User $createdBy
 */
namespace app\models;

use Yii;

class DoctorAvailability extends \app\components\TActiveRecord
{

    public function __toString()
    {
        return (string) $this->date;
    }
    
    public $data;

    const STATE_INACTIVE = 0;

    const STATE_ACTIVE = 1;

    const STATE_DELETED = 2;

    const SPLIT_BY = '15';

    public static function getStateOptions()
    {
        return [
            self::STATE_INACTIVE => \Yii::t('app', "New"),
            self::STATE_ACTIVE => \Yii::t('app', "Active"),
            self::STATE_DELETED => \Yii::t('app', "Archived")
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
            self::STATE_INACTIVE => "primary",
            self::STATE_ACTIVE => "success",
            self::STATE_DELETED => "danger"
        ];
        return isset($list[$this->state_id]) ? \yii\helpers\Html::tag('span', $this->getState(), [
            'class' => 'label label-' . $list[$this->state_id]
        ]) : \Yii::t('app', 'Not Defined');
    }

    public static function getTypeOptions()
    {
        return [
            "TYPE1",
            "TYPE2",
            "TYPE3"
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
     *
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%doctor_availability}}';
    }

    /**
     *
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    // 'date',
                    'created_on',
                    'created_by_id'
                ],
                'required'
            ],
            [
                [
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'date',
                    'created_on',
                    'updated_on',
                    'data'
                ],
                'safe'
            ],
            [
                [
                    'date'
                ],
                'string',
                'max' => 256
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
                    'date'
                ],
                'trim'
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
     *
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'date' => Yii::t('app', 'Date'),
            'state_id' => Yii::t('app', 'State'),
            'type_id' => Yii::t('app', 'Type'),
            'created_on' => Yii::t('app', 'Created On'),
            'updated_on' => Yii::t('app', 'Updated On'),
            'created_by_id' => Yii::t('app', 'Created By')
        ];
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAvailabilitytimes()
    {
        return $this->hasMany(AvailabilityTime::className(), [
            'doctor_availability_id' => 'id'
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

    public static function getHasManyRelations()
    {
        $relations = [];
        $relations['Availabilitytimes'] = [
            'availabilitytimes',
            'Availabilitytime',
            'id',
            'doctor_availability_id'
        ];
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
        $relations['created_by_id'] = [
            'createdBy',
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
        // Availabilitytime::deleteRelatedAll(['doctor_availability_id'=>$this->id]);
        return parent::beforeDelete();
    }

    public function asJson($with_relations = false)
    {
        $json = [];
        $json['id'] = $this->id;
        $json['date'] = $this->date;

        $json['created_by_id'] = $this->created_by_id;
        if (\Yii::$app->controller->action->id != 'view-doctor-availability') {
            // $json['availabilitytimes'] = $this->getTimeSlotes();
        }
        if ($with_relations) {}
        return $json;
    }

    public function getTimeSlotes()
    {
        $subquery = Appointment::find()->select('availability_time_id')
            ->where([
            'availability_id' => $this->id
        ])
            ->column();

        $models = AvailabilityTime::find()->where([
            'NOT IN',
            'id',
            $subquery
        ])->all();
        if (! empty($models)) {
            foreach ($models as $model) {
                if (($model->time > date('H:i:s'))) {
                    $list[] = $model->asJson();
                }
            }
        }
        return ! empty($list) ? $list : [];
    }

    public function getWeekDates($day, $repeat)
    {
        switch ($day) {
            case 1:
                $day_name = 'Sunday';
                break;
            case 2:
                $day_name = 'Monday';
                break;
            case 3:
                $day_name = 'Tuesday';
                break;
            case 4:
                $day_name = 'Wednesday';
                break;
            case 5:
                $day_name = 'Thursday';
                break;
            case 6:
                $day_name = 'Friday';
                break;
            case 7:
                $day_name = 'Saturday';
                break;
        }
        $date = date('Y-m-d');
        $date_array = [];
        $today = date('w');
        if (! empty($repeat)) {

            if ($day == $today + 1) {
                $date_array[] = date('Y-m-d');
                $repeat = $repeat - 1;
            }

            for ($i = 1; $i <= $repeat; $i ++) {

                $weekdate = date('Y-m-d', strtotime('next ' . $day_name, strtotime($date)));

                $date = $weekdate;
                if (! in_array($weekdate, $date_array))
                    $date_array[] = $weekdate;
            }
        }

        return $date_array;
    }

    public function saveTimeSlots($timeArray, $doctorAvailability_id)
    {
        $flag = false;
        $list = [];
        $list['status'] = 'OK';
        foreach ($timeArray as $i => $time) {

            $starttime = $time->start_time;
            $endtime = $time->end_time;
            $duration = self::SPLIT_BY; // split by 30 mins

            $array_of_time = array();
            $start_time = strtotime($starttime); // change to strtotime
            $end_time = strtotime($endtime); // change to strtotime

            $add_mins = $duration * 60;

            while ($start_time < $end_time) {
                $availabilityTime = AvailabilityTime::find()->where([

                    'doctor_availability_id' => $doctorAvailability_id
                ])
                    ->andWhere([
                    'between',
                    'time',
                    date("H:i:s", $start_time),
                    date("H:i:s", $end_time)
                ])
                    ->one();
                if (empty($availabilityTime)) {
                    $availabilityTime = new AvailabilityTime();
                    $availabilityTime->time = date("H:i:s", $start_time);
                    $availabilityTime->price = $time->price;
                    $availabilityTime->description = $time->description;
                    $availabilityTime->doctor_availability_id = $doctorAvailability_id;
                    if (! $availabilityTime->save()) {
                        $flag = true;
                        $list['error'] = $availabilityTime->getErrorsString();
                        $list['status'] = 'NOK';
                        break;
                    }
                }
                $start_time += $add_mins; // to check endtie=me
            }
            if ($flag == true) {
                break;
            }
        }
        return $list;
    }

    public function getTime()
    {
        $models = AvailabilityTime::find()->where([
            'doctor_availability_id' => $this->id
        ]);

        if (! empty($models)) {

            foreach ($models->each() as $model) {

                $list[$model->date][] = [
                    'start_time' => $model->start_time,
                    'end_time' => $model->end_time
                ];
            }
        }
        return ! empty($list) ? $list : null;
    }
}
