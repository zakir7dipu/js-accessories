<?php

namespace App\Http\Controllers\GuestView;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GuestController extends Controller
{

    public function index()
    {
        return view('welcome');
    }
}
