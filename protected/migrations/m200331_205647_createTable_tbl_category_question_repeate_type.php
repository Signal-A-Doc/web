<?php

use yii\db\Migration;

/**
 * Class m200331_205647_createTable_tbl_category_question_repeate_type
 */
class m200331_205647_createTable_tbl_category_question_repeate_type extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{%category_question_repeate_type}}', [
            'id' => $this->primaryKey(),
            'category_question_id' => $this->integer()
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

        $this->addForeignKey('fk_category_question_repeate_type_category_question_id', '{{%category_question_repeate_type}}', 'category_question_id', '{{%category_question}}', 'id');
        
        $this->addForeignKey('fk_category_question_repeate_type_created_by_id', '{{%category_question_repeate_type}}', 'created_by_id', '{{%user}}', 'id');
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk_category_question_repeate_type_category_question_id', '{{%category_question_repeate_type}}', 'category_question_id', '{{%category_question}}', 'id');
       $this->dropForeignKey('fk_category_question_repeate_type_created_by_id', '{{%category_question_repeate_type}}', 'created_by_id', '{{%user}}', 'id');
        $this->dropTable('{{%category_question_repeate_type}}');
    }
}
