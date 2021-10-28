<?php

namespace Database\Seeders;

use App\Models\Currency;
use Illuminate\Database\Seeder;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $currencies = [
            [
                'name' => 'Taka',
                'currency' => 'BDT',
                'digital_code' => '050',
                'symbol' => '৳'
            ],
            [
                'name' => 'Indian Rupee',
                'currency' => 'INR',
                'digital_code' => '356',
                'symbol' => '₹'
            ],
            [
                'name' => 'Pakistan Rupee',
                'currency' => 'PKR',
                'digital_code' => '586',
                'symbol' => '₨'
            ],
            [
                'name' => 'Euro',
                'currency' => 'EUR',
                'digital_code' => '840',
                'symbol' => '€'
            ],
            [
                'name' => 'US Dollar',
                'currency' => 'USD',
                'digital_code' => '978',
                'symbol' => '$'
            ],
            [
                'name' => 'Yuan',
                'currency' => 'CNY',
                'digital_code' => '156',
                'symbol' => '¥'
            ],
        ];

        foreach ($currencies as $currency){
            Currency::create($currency);
        }

    }
}
