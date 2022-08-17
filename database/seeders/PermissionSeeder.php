<?php

namespace Sorethea\FilakubeAdmin\Database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionSeeder extends Seeder
{
    public function run()
    {
        //UserResource permission
        DB::table("permissions")->insert(["name"=>"users.viewAny"]);
        DB::table("permissions")->insert(["name"=>"users.view"]);
        DB::table("permissions")->insert(["name"=>"users.create"]);
        DB::table("permissions")->insert(["name"=>"users.update"]);
        DB::table("permissions")->insert(["name"=>"users.delete"]);
        DB::table("permissions")->insert(["name"=>"users.restore"]);
        DB::table("permissions")->insert(["name"=>"users.forceDelete"]);

        //RoleResource permission
        DB::table("permissions")->insert(["name"=>"roles.viewAny"]);
        DB::table("permissions")->insert(["name"=>"roles.view"]);
        DB::table("permissions")->insert(["name"=>"roles.create"]);
        DB::table("permissions")->insert(["name"=>"roles.update"]);
        DB::table("permissions")->insert(["name"=>"roles.delete"]);
        DB::table("permissions")->insert(["name"=>"roles.restore"]);
        DB::table("permissions")->insert(["name"=>"roles.forceDelete"]);

        //PermissionResource permission
        DB::table("permissions")->insert(["name"=>"permissions.viewAny"]);
        DB::table("permissions")->insert(["name"=>"permissions.view"]);
        DB::table("permissions")->insert(["name"=>"permissions.create"]);
        DB::table("permissions")->insert(["name"=>"permissions.update"]);
        DB::table("permissions")->insert(["name"=>"permissions.delete"]);
        DB::table("permissions")->insert(["name"=>"permissions.restore"]);
        DB::table("permissions")->insert(["name"=>"permissions.forceDelete"]);
    }
}
