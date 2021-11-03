<?php

namespace Database\Seeders;

use App\Models\InfoSection;
use Illuminate\Database\Seeder;

class InfoSectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *'title', 'sub_title', 'description', 'icon'
     * @return void
     */
    public function run()
    {
        $columns = [
            [
                'title' => 'FREE SHIPPING & RETURNS',
                'sub_title' => 'All Orders Over $99',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.',
                'icon' => '/upload/settings/free-delivery.png',
            ],
            [
                'title' => 'MONEY BACK GUARANTEE',
                'sub_title' => 'Safe & Fast',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.',
                'icon' => '/upload/settings/cashback.png',
            ],
            [
                'title' => 'ONLINE SUPPORT',
                'sub_title' => 'Need Assistence?',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.',
                'icon' => '/upload/settings/support.png',
            ],
        ];

        foreach ($columns as $column){
            InfoSection::create($column);
        }
    }
}
