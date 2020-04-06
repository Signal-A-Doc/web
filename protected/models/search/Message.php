<?php
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Message as MessageModel;

/**
 * Message represents the model behind the search form about `app\models\Message`.
 */
class Message extends MessageModel
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
                    'to_id',
                    'from_id',
                    'group_id',
                    'create_user_id'
                ],
                'integer'
            ],
            [
                [
                    'create_time',
                    'update_time'
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

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = MessageModel::find();
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);
        
        if (! ($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
        
        $query->andFilterWhere([
            'id' => $this->id,
            'session_id' => $this->session_id,
            'state_id' => $this->state_id,
            'type_id' => $this->type_id,
            'to_id' => $this->to_id,
            'from_id' => $this->from_id,
            'group_id' => $this->group_id,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
            'create_user_id' => $this->create_user_id
        ]);
        
        return $dataProvider;
    }
}
