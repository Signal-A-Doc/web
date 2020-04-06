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
 

namespace app\models;

use Yii;
use app\models\Feed;
use app\models\User;
use app\models\PatientHealthProfile;
use app\models\Illness;
use app\models\SubCategory;

use yii\helpers\ArrayHelper;


/**
* This is the model class for table "tbl_patient_illness".
*
    * @property integer $id
    * @property integer $health_profile
    * @property integer $symptom_id
    * @property integer $illness_id
    * @property integer $state_id
    * @property integer $type_id
    * @property string $created_on
    * @property string $updated_on
    * @property integer $created_by_id

* === Related data ===
    * @property User $createdBy
    * @property PatientHealthProfile $healthProfile
    * @property Illness $illness
    * @property SubCategory $symptom
    */


class PatientIllness extends \app\components\TActiveRecord
{
	public $illness;
	public  function __toString()
	{
		return (string)$this->health_profile;
	}
public static function getSymptomOptions()
	{
		return ["TYPE1","TYPE2","TYPE3"];
					//return ArrayHelper::Map ( SubCategory::findActive ()->all (), 'id', 'title' );
	}

			public static function getIllnessOptions()
	{
		return ["TYPE1","TYPE2","TYPE3"];
					//return ArrayHelper::Map ( Illness::findActive ()->all (), 'id', 'title' );
	}

				const STATE_INACTIVE 	= 0;
	const STATE_ACTIVE	 	= 1;
	const STATE_DELETED 	= 2;

	public static function getStateOptions()
	{
		return [
				self::STATE_INACTIVE		=> "New",
				self::STATE_ACTIVE 			=> "Active" ,
				self::STATE_DELETED 		=> "Deleted",
		];
	}
	public function getState()
	{
		$list = self::getStateOptions();
		return isset($list [$this->state_id])?$list [$this->state_id]:'Not Defined';

	}
	public function getStateBadge()
	{
		$list = [
				self::STATE_INACTIVE 		=> "secondary",
				self::STATE_ACTIVE 			=> "success" ,
				self::STATE_DELETED 		=> "danger",
		];
		return isset($list[$this->state_id])?\yii\helpers\Html::tag('span', $this->getState(), ['class' => 'badge badge-' . $list[$this->state_id]]):'Not Defined';
	}
    public static function getActionOptions()
    {
        return [
            self::STATE_INACTIVE => "Deactivate",
            self::STATE_ACTIVE => "Activate",
            self::STATE_DELETED => "Delete"
        ];
    }

		public static function getTypeOptions()
	{
		return ["TYPE1","TYPE2","TYPE3"];
				}

	 	public function getType()
	{
		$list = self::getTypeOptions();
		return isset($list [$this->type_id])?$list [$this->type_id]:'Not Defined';

	}
				public function beforeValidate()
	{
		if($this->isNewRecord)
		{
				if ( empty( $this->created_on )){ $this->created_on = date( 'Y-m-d H:i:s');}
				if ( empty( $this->updated_on )){ $this->updated_on = date( 'Y-m-d H:i:s');}
				if ( empty( $this->created_by_id )){ $this->created_by_id = self::getCurrentUser();
            }
			}else{
					$this->updated_on = date( 'Y-m-d H:i:s');
			}
		return parent::beforeValidate();
	}


	/**
	* @inheritdoc
	*/
	public static function tableName()
	{
		return '{{%patient_illness}}';
	}

	/**
	* @inheritdoc
	*/
	public function rules()
	{
		return [
            [['health_profile', 'symptom_id', 'illness_id', 'created_by_id'], 'required'],
            [['health_profile', 'symptom_id', 'illness_id', 'state_id', 'type_id', 'created_by_id'], 'integer'],
            [['created_on', 'updated_on','illness'], 'safe'],
            [['created_by_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by_id' => 'id']],
            [['health_profile'], 'exist', 'skipOnError' => true, 'targetClass' => PatientHealthProfile::className(), 'targetAttribute' => ['health_profile' => 'id']],
            [['illness_id'], 'exist', 'skipOnError' => true, 'targetClass' => Illness::className(), 'targetAttribute' => ['illness_id' => 'id']],
            [['symptom_id'], 'exist', 'skipOnError' => true, 'targetClass' => SubCategory::className(), 'targetAttribute' => ['symptom_id' => 'id']],
            [['type_id'], 'trim'],
            [['health_profile'],'file',
						'skipOnEmpty' => true,
						'extensions' => 'png, jpg,jpeg' ],
            [['state_id'], 'in', 'range' => array_keys(self::getStateOptions())],
            [['type_id'], 'in', 'range' => array_keys (self::getTypeOptions())]
        ];
	}

	/**
	* @inheritdoc
	*/


	public function attributeLabels()
	{
		return [
				    'id' => Yii::t('app', 'ID'),
				    'health_profile' => Yii::t('app', 'Health Profile'),
				    'symptom_id' => Yii::t('app', 'Symptom'),
				    'illness_id' => Yii::t('app', 'Illness'),
				    'state_id' => Yii::t('app', 'State'),
				    'type_id' => Yii::t('app', 'Type'),
				    'created_on' => Yii::t('app', 'Created On'),
				    'updated_on' => Yii::t('app', 'Updated On'),
				    'created_by_id' => Yii::t('app', 'Created By'),
				];
	}

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getCreatedBy()
    {
    	return $this->hasOne(User::className(), ['id' => 'created_by_id']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getHealthProfile()
    {
    	return $this->hasOne(PatientHealthProfile::className(), ['id' => 'health_profile']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getIllness()
    {
    	return $this->hasOne(Illness::className(), ['id' => 'illness_id']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getSymptom()
    {
    	return $this->hasOne(SubCategory::className(), ['id' => 'symptom_id']);
    }
    public static function getHasManyRelations()
    {
    	$relations = [];

    	$relations['feeds'] = [
            'feeds',
            'Feed',
            'model_id'
        ];
		return $relations;
	}
    public static function getHasOneRelations()
    {
    	$relations = [];
		$relations['created_by_id'] = ['createdBy','User','id'];
		$relations['health_profile'] = ['healthProfile','PatientHealthProfile','id'];
		$relations['illness_id'] = ['illness','Illness','id'];
		$relations['symptom_id'] = ['symptom','SubCategory','id'];
		return $relations;
	}

	public function beforeDelete() {
	    if (! parent::beforeDelete()) {
            return false;
        }
        //TODO : start here
		return true;
	}
	
  	public function beforeSave($insert)
    {
        if (! parent::beforeSave($insert)) {
            return false;
        }
        //TODO : start here
        
        return true;
    }
    public function asJson($with_relations=false)
	{
		$json = [];
			$json['id'] 	= $this->id;
		if(isset($this->health_profile))
			$json['health_profile'] 	= $this->health_profile;
			$json['symptom_id'] 	= $this->symptom_id;
			$json['illness_id'] 	= $this->illness_id;
			$json['state_id'] 	= $this->state_id;
			$json['type_id'] 	= $this->type_id;
			$json['created_on'] 	= $this->created_on;
			$json['created_by_id'] 	= $this->created_by_id;
			if ($with_relations)
		    {
				// createdBy
				$list = $this->createdBy;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['createdBy'] 	= $relationData;
				}
				else
				{
					$json['createdBy'] 	= $list;
				}
				// healthProfile
				$list = $this->healthProfile;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['healthProfile'] 	= $relationData;
				}
				else
				{
					$json['healthProfile'] 	= $list;
				}
				// illness
				$list = $this->illness;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['illness'] 	= $relationData;
				}
				else
				{
					$json['illness'] 	= $list;
				}
				// symptom
				$list = $this->symptom;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['symptom'] 	= $relationData;
				}
				else
				{
					$json['symptom'] 	= $list;
				}
			}
		return $json;
	}
	
		
    public static function addTestData($count = 1)
    {
        $faker = \Faker\Factory::create();
        $states = array_keys(self::getStateOptions());
        for ($i = 0; $i < $count; $i ++) {
            $model = new self();
            
						$model->health_profile = $faker->text(10);
			$model->symptom_id = 1;
			$model->illness_id = 1;
			$model->state_id = $states[rand(0,count($states))];
			$model->type_id = $faker->boolean;
        	$model->save();
        }
	}
    public static function addData($data)
    {
    	$faker = \Faker\Factory::create();
    	if (self::find()->count() != 0)
            return;
        foreach( $data as $item) {
            $model = new self();
            
                    
                    	$model->health_profile = isset($item['health_profile'])?$item['health_profile']:$faker->text(10);
                                       
                    	$model->symptom_id = isset($item['symptom_id'])?$item['symptom_id']:1;
                                       
                    	$model->illness_id = isset($item['illness_id'])?$item['illness_id']:1;
                   			$model->state_id = self::STATE_ACTIVE;
                    
                    	$model->type_id = isset($item['type_id'])?$item['type_id']:$faker->boolean;
                           	$model->save();
        }
	}	
}
