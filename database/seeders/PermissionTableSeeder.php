<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;


class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = ['settings', 'pages', 'suppliers', 'customers', 'widget', 'advertisement', 'blog', 'ecommerce'];
        for ($p = 0; $p < count($permissions); $p++){
            Permission::create([
                'name' => strtolower($permissions[$p])
            ]);
        }

        $supperAdmin = Role::where('name', 'supper_admin')->first();
        $admin = Role::where('name', 'admin')->first();

        $supperAdmin->givePermissionTo(Permission::all());
        $admin->givePermissionTo(['suppliers','customers', 'advertisement', 'ecommerce','blog']);
    }
}
