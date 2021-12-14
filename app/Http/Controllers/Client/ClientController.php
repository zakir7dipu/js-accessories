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
        $cart = Cart::instance('shopping_cart');
        if (count($cart->content()) === 0){
            return $this->backWithError('No item added to cart for checkout...');
        }
        try {
            return view('forntend.pages.checkout',[
                'title' => 'Checkout',
                'carts' => $cart->content(),
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

    public function checkoutMethod(PaymentMethod $payment)
    {
        if ($payment->name === 'cash_on_delivery'){
            return response()->json($this->cashOnDelivery($payment));
        }
        else if ($payment->name === "bKash"){
            return response()->json($this->bKashPayment($payment));
        }
        else {
            return response()->json($this->nagadAndRoketPayment($payment));
        }
    }

    public function cashOnDelivery($payment)
    {
        return 'accept';
    }

    public function bKashPayment($payment)
    {
        return $output = '<form action="'.route('client.order.store').'" method="post">
        <input type="hidden" name="_token" value="'.csrf_token().'">
        <img src="'.($payment->content? asset($payment->content):'').'" alt="" id="modalImageShow" class="img-fluid img-thumbnail w-50" accept="image/png, image/jpeg"/>
        <p class="mb-1 text-uppercase"><label for="methodStatus">'.__('TRX ID').'</label>: </p>
        <div class="input-group input-group-lg mb-3 text-center">
            <input type="text" name="trx_id" id="trxId" class="form-control">
        </div>
    </form>';
    }
}
