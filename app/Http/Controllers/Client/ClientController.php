<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\CountryList;
use App\Models\DistrictList;
use App\Models\PaymentMethod;
use App\Models\ThanaList;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClientController extends Controller
{
    public function __construct()
    {
        Parent::__construct();
        $this->middleware(['auth', 'role:customer']);
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

    public function checkoutIndex()
    {
        try {
            return view('forntend.pages.checkout',[
                'title' => 'Checkout',
                'carts' => Cart::instance('shopping_cart')->content(),
                'cartTotal' => Cart::instance('shopping_cart')->subtotal(),
                'countries' => CountryList::where('status', true)->get(),
                'states' => DistrictList::where('status', true)->get(),
                'policeStations' => ThanaList::where('status', true)->get(),
                'paymentMethods' => PaymentMethod::where('status', true)->get(),
            ]);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
