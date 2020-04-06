<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author    : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\LanguageList as LanguageListModel;

/**
 * LanguageList represents the model behind the search form about `app\models\LanguageList`.
 */
class LanguageList extends LanguageListModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type_id', 'state_id'], 'integer'],
            [['value', 'code'], 'safe'],
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
        $query = LanguageListModel::find();

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
            'type_id' => $this->type_id,
            'state_id' => $this->state_id,
        ]);

        $query->andFilterWhere(['like', 'id', $this->id])
            ->andFilterWhere(['like', 'value', $this->value])
            ->andFilterWhere(['like', 'code', $this->code]);

        return $dataProvider;
    }
}
