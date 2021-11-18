<?php

namespace Database\Seeders;

use App\Models\CompanyInfo;
use DateTime;
use Illuminate\Database\Seeder;

class CompanyInfoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $date = new DateTime;
        CompanyInfo::create([
            'licence' => str_replace(' ','',strtolower(config('app.name'))).'-'.time().'-DAC',
            'date' => $date->format('Y-m-d'),
            'status' => true
        ]);
    }
}
