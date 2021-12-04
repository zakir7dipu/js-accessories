<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClientController extends Controller
{
    public function __construct()
    {
        Parent::__construct();
    }

    public function index()
    {
        try {
            return view('forntend.auth.dashboard',[
                'title' => 'My Dashboard',
                'registrationTime' => strtotime(Auth::user()->created_at) + (24*60*60),
                'success' => 'Welcome '.Auth::user()->name
            ]);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
