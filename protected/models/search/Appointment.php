<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Appointment as AppointmentModel;

/**
 * Appointment represents the model behind the search form about `app\models\Appointment`.
 */
class Appointment extends AppointmentModel
{

    /**
     *
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'id',
                    'doctor_id',
                    'availability_id',
                    'availability_time_id',
                    'payment_status',
                    'age',
                    'discount',
                    'gender',
                    'type_id',
                    'state_id',
                    'created_by_id',
                    'patient_id'
                ],
                'integer'
            ],
            [
                [
                    'document_ids',
                    'name',
                    'health_issue',
                    'reschedule_reason',
                    'cancel_reason',
                    'price',
                    'final_price',
                    'date',
                    'time',
                    'prescription_image',
                    'created_on',
                    'updated_on'
                ],
                'safe'
            ]
        ];
    }

    /**
     *
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function beforeValidate()
    {
        return true;
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = AppointmentModel::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ]
        ]);

        if (! ($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'doctor_id' => $this->doctor_id,
            'availability_id' => $this->availability_id,
            'availability_time_id' => $this->availability_time_id,
            'payment_status' => $this->payment_status,
            'age' => $this->age,
            'discount' => $this->discount,
            'gender' => $this->gender,
            'date' => $this->date,
            'time' => $this->time,
            'type_id' => $this->type_id,
            'state_id' => $this->state_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
            'created_by_id' => $this->created_by_id
        ]);

        $query->andFilterWhere([
            'like',
            'document_ids',
            $this->document_ids
        ])
            ->andFilterWhere([
            'like',
            'name',
            $this->name
        ])
            ->andFilterWhere([
            'like',
            'health_issue',
            $this->health_issue
        ])
            ->andFilterWhere([
            'like',
            'reschedule_reason',
            $this->reschedule_reason
        ])
            ->andFilterWhere([
            'like',
            'cancel_reason',
            $this->cancel_reason
        ])
            ->andFilterWhere([
            'like',
            'price',
            $this->price
        ])
            ->andFilterWhere([
            'like',
            'final_price',
            $this->final_price
        ])
            ->andFilterWhere(['like', 'prescription_image', $this->prescription_image]);

        return $dataProvider;
    }
}
