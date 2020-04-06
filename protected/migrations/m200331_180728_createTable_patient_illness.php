<?php

use yii\db\Migration;

/**
 * Class m200331_180728_createTable_patient_illness
 */
class m200331_180728_createTable_patient_illness extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{%patient_illness}}', [
            'id' => $this->primaryKey(),
            'health_profile' => $this->integer()
                ->notNull(),
            'symptom_id' => $this->integer()
                ->notNull(),
            'illness_id' => $this->integer()
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

        $this->addForeignKey('fk_patient_illness_health_profile', '{{%patient_illness}}', 'health_profile', '{{%patient_health_profile}}', 'id');
        $this->addForeignKey('fk_patient_illness_symptom_id', '{{%patient_illness}}', 'symptom_id', '{{%sub_category}}', 'id');
        $this->addForeignKey('fk_patient_illness_illness_id', '{{%patient_illness}}', 'illness_id', '{{%illness}}', 'id');
        $this->addForeignKey('fk_patient_illness_created_by_id', '{{%patient_illness}}', 'created_by_id', '{{%user}}', 'id');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk_patient_illness_health_profile', '{{%patient_illness}}', 'health_profile', '{{%patient_health_profile}}', 'id');
        $this->dropForeignKey('fk_patient_illness_symptom_id', '{{%patient_illness}}', 'symptom_id', '{{%sub_category}}', 'id');
        $this->dropForeignKey('fk_patient_illness_illness_id', '{{%patient_illness}}', 'illness_id', '{{%illness}}', 'id');
       $this->dropForeignKey('fk_patient_illness_created_by_id', '{{%patient_illness}}', 'created_by_id', '{{%user}}', 'id');
        $this->dropTable('{{%patient_illness}}');
    }
}
