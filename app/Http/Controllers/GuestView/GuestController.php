<?php

namespace App\Http\Controllers\GuestView;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GuestController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        try {
            return view('welcome');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
