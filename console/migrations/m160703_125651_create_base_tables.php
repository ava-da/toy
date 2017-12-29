<?php

use yii\db\Migration;

/**
 * Handles the creation for table `base_tables`.
 */
class m160703_125651_create_base_tables extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('customer', [
            'id' => $this->primaryKey(),
            'name' => $this->string(100),
            'family' => $this->string(100),
            'email' => $this->string(100),
            'mobile' => $this->string(25),
            'phone' => $this->string(25),
            'address' => $this->text(),
            'city' => $this->string(100),
            'provience' => $this->string(100),
            'postalcod' => $this->string(15)
        ]);
        
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('base_tables');
    }
}
