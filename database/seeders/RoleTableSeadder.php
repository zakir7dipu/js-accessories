<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleTableSeadder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = ['supper_admin', 'admin', 'customer'];
        foreach ($roles as $role){
            Role::create([
                'name' => $role
            ]);
        }
    }
}
