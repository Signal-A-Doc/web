<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CallLog as CallLogModel;

/**
 * CallLog represents the model behind the search form about `app\models\CallLog`.
 */
class CallLog extends CallLogModel
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
                    'user_id',
                    'session_id',
                    'appointment_id',
                    'state_id',
                    'type_id'
                ],
                'integer'
            ],
            [
                [
                    'created_on',
                    'updated_on',
                    'created_by_id'
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
        $query = CallLogModel::find()->alias('cl')->joinWith('createdBy as cr');
        
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
            'cl.id' => $this->id,
            'cl.user_id' => $this->user_id,
            'cl.session_id' => $this->session_id,
            'cl.appointment_id' => $this->appointment_id,
            'cl.state_id' => $this->state_id,
            'cl.type_id' => $this->type_id,
            'cl.updated_on' => $this->updated_on
        
        ]);
        
        $query->andFilterWhere([
            'like',
            'cr.full_name',
            $this->created_by_id
        ])->andFilterWhere([
            'like',
            'cl.created_on',
            $this->created_on
        ]);
        
        return $dataProvider;
    }
}
