<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Gloudemans\Shoppingcart\Facades\Cart;
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
                'success' => 'Welcome '.Auth::user()->name,
                'carts' => Cart::instance('shopping_cart')->content(),
                'cartTotal' => Cart::instance('shopping_cart')->subtotal()
            ]);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
