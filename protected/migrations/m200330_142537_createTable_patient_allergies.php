<?php

use yii\db\Migration;

/**
 * Class m200330_142537_createTable_patient_allergies
 */
class m200330_142537_createTable_patient_allergies extends Migration
{
     public function safeUp()
    {
        $this->createTable('{{%patient_allergies}}', [
            'id' => $this->primaryKey(),
            'health_profile' => $this->integer()
                ->notNull(),
            'allergy' => $this->string(256)
                ->notNull(),
            'state_id' => $this->integer()
                ->defaultValue(0)
                ->notNull(),
            'type_id' => $this->boolean()
                ->defaultValue(0),
            'created_on' => $this->dateTime(),
            'updated_on' => $this->dateTime(),
            'created_by_id' => $this->integer()
                ->notNull()
        ]);

        $this->addForeignKey('fk_patient_allergies_health_profile', '{{%patient_allergies}}', 'health_profile', '{{%patient_health_profile}}', 'id');
        
        $this->addForeignKey('fk_patient_allergies_created_by_id', '{{%patient_allergies}}', 'created_by_id', '{{%user}}', 'id');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk_patient_allergies_health_profile', '{{%patient_allergies}}', 'health_profile', '{{%patient_health_profile}}', 'id');
       $this->dropForeignKey('fk_patient_allergies_created_by_id', '{{%patient_allergies}}', 'created_by_id', '{{%user}}', 'id');
        $this->dropTable('{{%patient_allergies}}');
    }
}
