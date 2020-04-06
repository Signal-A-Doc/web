<?php
namespace app\models;

use app\components\TActiveRecord;

class Message extends TActiveRecord
{

    const STATUS_UNREAD = 0;

    const STATUS_READ = 1;

    public function beforeSave($insert)
    {
        return parent::beforeSave($insert);
    }

    public function afterSave($insert = true, $changedAttributes = NULL)
    {}

    public function beforeDelete()
    {
        return parent::beforeDelete();
    }

    /*
     * public function notify()
     * {
     * $notification = new FirebaseNotifications();
     * $data = [];
     * $data['controller'] = \yii::$app->controller->id;
     * $data['action'] = \yii::$app->controller->action->id;
     * $data['message'] = $this->message;
     * $data['from_id'] = $this->from_id;
     * $data['from_name'] = isset($this->from) ? $this->from->full_name : '';
     * $tokens = [];
     * if (isset($this->to)) {
     * $tokens = $this->to->authSessions;
     * }
     * $patient = Patient::find()->where([
     * 'id' => $this->from_id
     * ])->one();
     * $doctor = Doctor::find()->where([
     * 'id' => $this->from_id
     * ])->one();
     *
     * $androidtoken = [];
     * $iostoken = [];
     * if (count($tokens) > 0) {
     * foreach ($tokens as $token) {
     * if ($token->type_id == 1)
     * $androidtoken[] = $token->device_token;
     * if ($token->type_id == 2)
     * $iostoken[] = $token->device_token;
     * }
     * if (count($androidtoken) >= 1) {
     * $notification->sendDataMessage($androidtoken, $data);
     * }
     * \Yii::error("IOS TOKENS FOR MESSAGE");
     * \Yii::error(\yii\helpers\VarDumper::dumpAsString($iostoken));
     *
     * if (count($iostoken) >= 1) {
     * $apnsGcm = \Yii::$app->apnsGcm;
     * foreach ($iostoken as $tokn) {
     * $out = $apnsGcm->send(\bryglen\apnsgcm\ApnsGcm::TYPE_APNS, $tokn, $data['message'], $data, [
     * 'sound' => 'default',
     * 'badge' => 1
     * ]);
     * }
     * }
     * }
     * }
     */
    public function asJson()
    {
        $Json = [];
        $Json['id'] = $this->id;
        $Json['message'] = utf8_decode($this->message);
        $Json['session_id'] = $this->session_id;
        $Json['to_id'] = $this->to_id;
        $Json['create_time'] = $this->create_time;
        $Json['send_time'] = isset($this->send_time) ? $this->send_time : "";
        $Json['from_id'] = $this->from_id;
        if (! empty($this->image_file)) {
            $Json['image_file'] = \Yii::$app->urlManager->createAbsoluteUrl([
                'user/download',
                'profile_file' => $this->image_file
            ]);
        }
        return $Json;
    }
}
