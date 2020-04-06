<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AppointmentPlans as AppointmentPlansModel;

/**
 * AppointmentPlans represents the model behind the search form about `app\models\AppointmentPlans`.
 */
class AppointmentPlans extends AppointmentPlansModel
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'id',
                    'state_id',
                    'type_id',
                    'created_by_id'
                ],
                'integer'
            ],
            [
                [
                    'amount',
                    'doctor_id',
                    'description',
                    'created_on',
                    'updated_on'
                ],
                'safe'
            ]
        ];
    }

    /**
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
        $query = AppointmentPlansModel::find()->alias('a')->joinWith('doctor as d');
        
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
            'a.id' => $this->id,
            
            'a.state_id' => $this->state_id,
            'a.type_id' => $this->type_id,
            'a.updated_on' => $this->updated_on,
            'a.created_by_id' => $this->created_by_id
        ]);
        
        $query->andFilterWhere([
            'like',
            'a.amount',
            $this->amount
        ])
            ->andFilterWhere([
            'like',
            'a.description',
            $this->description
        ])
            ->andFilterWhere([
            'like',
            'a.created_on',
            $this->created_on
        ])
            ->andFilterWhere([
            'like',
            'd.full_name',
            $this->doctor_id
        ]);
        
        return $dataProvider;
    }
}
