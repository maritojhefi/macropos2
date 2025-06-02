<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('balance_tansfers', function (Blueprint $table) {
            $table->decimal('received_amount', 18, 6)->default(0)->after('amount');
            $table->decimal('exchange_rate',   18, 6)->default(1)->after('received_amount');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('balance_tansfers', function (Blueprint $table) {
            $table->dropColumn('received_amount');
            $table->dropColumn('exchange_rate');
        });
    }
};
