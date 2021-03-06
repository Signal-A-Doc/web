<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AvailabilityTime as AvailabilityTimeModel;

/**
 * AvailabilityTime represents the model behind the search form about `app\models\AvailabilityTime`.
 */
class AvailabilityTime extends AvailabilityTimeModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'doctor_availability_id', 'state_id', 'type_id', 'created_by_id'], 'integer'],
            [['time', 'price', 'description', 'created_on', 'updated_on'], 'safe'],
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
    public function beforeValidate(){
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
        $query = AvailabilityTimeModel::find();

		        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
						'defaultOrder' => [
								'id' => SORT_DESC
						]
				]
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'doctor_availability_id' => $this->doctor_availability_id,
            'state_id' => $this->state_id,
            'type_id' => $this->type_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
            'created_by_id' => $this->created_by_id,
        ]);

        $query->andFilterWhere(['like', 'time', $this->time])
            ->andFilterWhere(['like', 'price', $this->price])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
