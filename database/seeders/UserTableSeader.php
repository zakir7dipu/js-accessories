<?php

namespace Database\Seeders;


use App\Models\Address;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserTableSeader extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'user_type' => 1,
            'name' => 'Zakir Hossain',
            'email' => 'zakir7dipu@gmail.com',
            'password' => Hash::make('zakir7dipu')
        ]);

        Profile::create([
            'user_id' => $user->id,
            'company_name' => config('app.name'),
            'phone' => '01764470022',
            'designation' => 'Owner'
        ]);

        Address::create([
            'user_id' => $user->id,
            'country' => 'Bangladesh',
            'district' => 'Dhaka',
            'city' => 'Dhaka',
            'thana' => 'Savar',
            'post_code' => '1340',
            'sector' => null,
            'road' => null,
            'house' => null
        ]);

        $user->assignRole('supper_admin');
    }
}
