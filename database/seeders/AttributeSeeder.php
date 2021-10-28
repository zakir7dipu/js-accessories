<?php

namespace Database\Seeders;

use App\Models\Attribute;
use Illuminate\Database\Seeder;

class AttributeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $attributes = ['color', 'size'];

        foreach ($attributes as $attribute){
            Attribute::create([
               'name' =>  $attribute
            ]);
        }
    }
}
