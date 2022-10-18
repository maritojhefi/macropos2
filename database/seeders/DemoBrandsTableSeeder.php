<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DemoBrandsTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('brands')->delete();

        \DB::table('brands')->insert([
            0 => [
                'id' => 1,
                'name' => 'Hewlett-Packard',
                'slug' => 'hewlett-packard',
                'code' => 'HP',
                'image' => '1651321208.png',
                'note' => '',
                'status' => 1,
                'created_at' => '2022-04-30 22:20:08',
                'updated_at' => '2022-04-30 22:20:08',
            ],
            1 => [
                'id' => 2,
                'name' => 'Dell',
                'slug' => 'dell',
                'code' => 'Dell',
                'image' => '1651321265.jpeg',
                'note' => '',
                'status' => 1,
                'created_at' => '2022-04-30 22:21:05',
                'updated_at' => '2022-04-30 22:21:05',
            ],
        ]);
    }
}
