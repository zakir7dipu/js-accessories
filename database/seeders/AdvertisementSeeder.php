<?php

namespace Database\Seeders;

use App\Models\Advertisement;
use Illuminate\Database\Seeder;

class AdvertisementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $advertisements = ['Advertisement 1', 'Advertisement 2', 'Advertisement 3', 'Advertisement 4'];
        foreach ($advertisements as $advertisement){
            Advertisement::create([
                'title' => $advertisement
            ]);
        }
    }
}
