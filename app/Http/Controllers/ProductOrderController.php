<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductOrderController extends Controller
{
    public function __construct()
    {
        Parent::__construct();
    }

    public function store(Request $request)
    {
        dd($request->all());
    }
}
