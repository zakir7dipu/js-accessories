<?php

namespace Database\Seeders;

use App\Models\Pages;
use Illuminate\Database\Seeder;

class PagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pages = ['about', 'contact', 'privacy_policy', 'terms&condition', 'faq'];

        foreach ($pages as $page){
            Pages::create(['name' => $page]);
        }
    }
}
