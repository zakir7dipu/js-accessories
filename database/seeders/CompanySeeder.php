<?php

namespace Database\Seeders;

use App\Models\Company;
use Illuminate\Database\Seeder;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Company::create([
            'phone'=> '+88 0191 xxx xxxx',
            'email'=> 'exxxxx@xxx.xxx',
            'address'=> 'xample len street, example-xxx'
        ]);
    }
}
