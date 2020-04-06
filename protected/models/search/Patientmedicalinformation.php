<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Patientmedicalinformation as PatientmedicalinformationModel;

/**
 * Patientmedicalinformation represents the model behind the search form about `app\models\Patientmedicalinformation`.
 */
class Patientmedicalinformation extends PatientmedicalinformationModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'blood_group', 'state_id', 'created_by_id'], 'integer'],
            [['blood_type', 'type_id', 'created_on', 'updated_on'], 'safe'],
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
        $query = PatientmedicalinformationModel::find();

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
            'blood_group' => $this->blood_group,
            'state_id' => $this->state_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
            'created_by_id' => $this->created_by_id,
        ]);

        $query->andFilterWhere(['like', 'blood_type', $this->blood_type])
            ->andFilterWhere(['like', 'type_id', $this->type_id]);

        return $dataProvider;
    }
}
