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
use app\models\PatientAllergies;
use app\models\PatientMedicineHistory;
use app\models\PatientIllness;

use yii\helpers\ArrayHelper;


/**
* This is the model class for table "tbl_patient_health_profile".
*
    * @property integer $id
    * @property integer $step_count
    * @property integer $currently_medicine
    * @property integer $state_id
    * @property integer $type_id
    * @property string $created_on
    * @property string $updated_on
    * @property integer $created_by_id

* === Related data ===
    * @property User $createdBy
    * @property PatientAllergies[] $patientAllergies
    * @property PatientMedicineHistory[] $patientMedicineHistories
    */


class PatientHealthProfile extends \app\components\TActiveRecord
{
	public  function __toString()
	{
		return (string)$this->step_count;
	}
	const STATE_INACTIVE 	= 0;
	const STATE_ACTIVE	 	= 1;
	const STATE_DELETED 	= 2;

	const STEP_HEALTH_PROFILE 	= 1;
	const STEP_MEDICINE_HISTORY	 	= 2;
	const STEP_PATIENT_ALLERGIES 	= 3;

	const CURRENT_MEDICINE = 1;

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
		return '{{%patient_health_profile}}';
	}

	/**
	* @inheritdoc
	*/
	public function rules()
	{
		return [
            [['step_count', 'created_by_id'], 'required'],
            [['step_count', 'currently_medicine', 'state_id', 'type_id', 'created_by_id'], 'integer'],
            [['created_on', 'updated_on'], 'safe'],
            [['created_by_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by_id' => 'id']],
            [['currently_medicine', 'type_id'], 'trim'],
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
				    'step_count' => Yii::t('app', 'Step Count'),
				    'currently_medicine' => Yii::t('app', 'Currently Medicine'),
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
    public function getPatientAllergies()
    {
    	return $this->hasMany(PatientAllergies::className(), ['health_profile' => 'id']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getPatientIllness()
    {
    	return $this->hasMany(PatientIllness::className(), ['health_profile' => 'id']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
    public function getPatientMedicineHistories()
    {
    	return $this->hasMany(PatientMedicineHistory::className(), ['health_profile' => 'id']);
    }
    public static function getHasManyRelations()
    {
    	$relations = [];

		$relations['PatientAllergies'] = ['patientAllergies','PatientAllergies','id','health_profile'];
		$relations['PatientMedicineHistories'] = ['patientMedicineHistories','PatientMedicineHistory','id','health_profile'];
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
		return $relations;
	}

	public function beforeDelete() {
	    if (! parent::beforeDelete()) {
            return false;
        }
        //TODO : start here
		PatientAllergies::deleteRelatedAll(['health_profile'=>$this->id]);
		PatientMedicineHistory::deleteRelatedAll(['health_profile'=>$this->id]);
		PatientIllness::deleteRelatedAll(['health_profile'=>$this->id]);
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
			//$json['step_count'] 	= $this->step_count;
			//$json['currently_medicine'] 	= $this->currently_medicine;
			$json['state_id'] 	= $this->state_id;
			$json['type_id'] 	= $this->type_id;
			$json['created_on'] 	= $this->created_on;
			$json['created_by_id'] 	= $this->created_by_id;
			if ($with_relations)
		    {

				// patientAllergies
				$list = $this->patientAllergies;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['patientAllergies'] 	= $relationData;
				}
				else
				{
					$json['patientAllergies'] 	= $list;
				}
				// patientMedicineHistories
				$list = $this->patientMedicineHistories;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['patientMedicineHistories'] 	= $relationData;
				}
				else
				{
					$json['patientMedicineHistories'] 	= $list;
				}
				$list = $this->patientIllness;

				if ( is_array($list))
				{
					$relationData = [];
					foreach( $list as $item)
					{
						$relationData [] 	= $item->asJson();
					}
					$json['patientIllness'] 	= $relationData;
				}
				else
				{
					$json['patientIllness'] 	= $list;
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
            
						$model->step_count = $faker->text(10);
			$model->currently_medicine = $faker->boolean;
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
            
                    
                    	$model->step_count = isset($item['step_count'])?$item['step_count']:$faker->text(10);
                                       
                    	$model->currently_medicine = isset($item['currently_medicine'])?$item['currently_medicine']:$faker->boolean;
                   			$model->state_id = self::STATE_ACTIVE;
                    
                    	$model->type_id = isset($item['type_id'])?$item['type_id']:$faker->boolean;
                           	$model->save();
        }
	}	
}
