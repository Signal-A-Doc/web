<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Illness as IllnessModel;

/**
 * Illness represents the model behind the search form about `app\models\Illness`.
 */
class Illness extends IllnessModel
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
                    'type_id'
                ],
                'integer'
            ],
            [
                [
                    'title',
                    'image_file',
                    'created_on',
                    'category_id',
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
        $query = IllnessModel::find()->alias('i')
            ->joinWith('createdBy as cr')
            ->joinWith('category as c');
        
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
            'i.id' => $this->id,
            'i.state_id' => $this->state_id,
            'i.type_id' => $this->type_id,
            'i.created_on' => $this->created_on,
            'i.updated_on' => $this->updated_on
        ]);
        
        $query->andFilterWhere([
            'like',
            'i.title',
            $this->title
        ])
            ->andFilterWhere([
            'like',
            'i.image_file',
            $this->image_file
        ])
            ->andFilterWhere([
            'like',
            'cr.full_name',
            $this->created_by_id
        ])
            ->andFilterWhere([
            'like',
            'c.title',
            $this->category_id
        ]);
        
        return $dataProvider;
    }
}
