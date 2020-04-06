<?php

use yii\db\Migration;

/**
 * Class m200330_140334_createTable_patient_health_profile
 */
class m200330_140334_createTable_patient_health_profile extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{%patient_health_profile}}', [
            'id' => $this->primaryKey(),
            'step_count' => $this->integer()
                ->notNull(),
            'currently_medicine' => $this->boolean()
                ->defaultValue(0),
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

       $this->addForeignKey('fk_patient_health_profile_created_by_id', '{{%patient_health_profile}}', 'created_by_id', '{{%user}}', 'id');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk_patient_health_profile_created_by_id', '{{%patient_health_profile}}', 'created_by_id', '{{%user}}', 'id');
        $this->dropTable('{{%patient_health_profile}}');
    }
}
