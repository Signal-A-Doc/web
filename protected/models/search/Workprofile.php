<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Workprofile as WorkprofileModel;

/**
 * Workprofile represents the model behind the search form about `app\models\Workprofile`.
 */
class Workprofile extends WorkprofileModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'professional_status', 'MDCN_folio_number', 'state_id', 'created_by_id'], 'integer'],
            [['professional_indemnity', 'MDCN_certificate', 'type_id', 'created_on', 'updated_on'], 'safe'],
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
        $query = WorkprofileModel::find();

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
            'professional_status' => $this->professional_status,
            'MDCN_folio_number' => $this->MDCN_folio_number,
            'state_id' => $this->state_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
            'created_by_id' => $this->created_by_id,
        ]);

        $query->andFilterWhere(['like', 'professional_indemnity', $this->professional_indemnity])
            ->andFilterWhere(['like', 'MDCN_certificate', $this->MDCN_certificate])
            ->andFilterWhere(['like', 'type_id', $this->type_id]);

        return $dataProvider;
    }
}
