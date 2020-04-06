<?php

use yii\db\Migration;

/**
 * Class m200330_141823_createTable_patient_medicine_history
 */
class m200330_141823_createTable_patient_medicine_history extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{%patient_medicine_history}}', [
            'id' => $this->primaryKey(),
            'health_profile' => $this->integer()
                ->notNull(),
            'medicine_name' => $this->string(256),
            'how_long' => $this->string(256),
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

        $this->addForeignKey('fk_patient_medicine_history_health_profile', '{{%patient_medicine_history}}', 'health_profile', '{{%patient_health_profile}}', 'id');
        
        $this->addForeignKey('fk_patient_medicine_history_created_by_id', '{{%patient_medicine_history}}', 'created_by_id', '{{%user}}', 'id');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk_patient_medicine_history_health_profile', '{{%patient_medicine_history}}', 'health_profile', '{{%patient_health_profile}}', 'id');
       $this->dropForeignKey('fk_patient_medicine_history_created_by_id', '{{%patient_medicine_history}}', 'created_by_id', '{{%user}}', 'id');
        $this->dropTable('{{%patient_medicine_history}}');
    }
}
