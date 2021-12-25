<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Mail\OrderNotification;
use App\Models\AttributeItem;
use App\Models\ClientOrder;
use App\Models\Company;
use App\Models\CountryList;
use App\Models\DistrictList;
use App\Models\GeneralSettings;
use App\Models\OrderedProduct;
use App\Models\Product;
use App\Models\ThanaList;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class ClientOrderController extends Controller
{
    public function __construct()
    {
        Parent::__construct();
    }

    public function index()
    {
        $user = Auth::user();
        if ($user->hasRole('supper_admin') || $user->hasRole('admin')){
            return $this->adminIndex();
        }else{
            return $this->clientIndex($user);
        }
        dd($user->hasRole('supper_admin'));
    }

    protected function adminIndex()
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Client Orders';
            $orders = ClientOrder::orderBy('id', 'DESC')->get();
            return view('backend.pages.e-commerce.orders.index', compact('title', 'generalSettings', 'orders'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    protected function clientIndex($user)
    {
        try {
            $title = 'My Orders';
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            $orders = $user->orders()->orderBy('id', 'DESC')->get();
            return view('forntend.auth.orders.index', compact('title', 'carts', 'cartTotal', 'orders'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function orderSingle(ClientOrder $order)
    {
        $user = Auth::user();
        if ($user->hasRole('supper_admin') || $user->hasRole('admin')){
            return $this->adminSingleOrder($order);
        }else{
            return $this->backWithSuccess('No Page found.');
        }
    }

    protected function adminSingleOrder($order)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Client Order: #'.$order->invoice;
            return view('backend.pages.e-commerce.orders.single', compact('title', 'generalSettings', 'order'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function store(Request $request)
    {
        $cart = Cart::instance('shopping_cart');
        $invoice = $request->invoice;
        $invoice = 10000+(ClientOrder::count()+1);
        $user = Auth::user();
        $contact = Company::first();
        // shipping address
        $shippingAddress = (array)json_decode($request->shipping_address, true);
        $shippingAddress['country'] = CountryList::find($shippingAddress['country'])->name;
        $shippingAddress['police_station'] = ThanaList::find($shippingAddress['police_station'])->name;
        $shippingAddress['state'] = DistrictList::find($shippingAddress['state'])->name;
        $shippingAddress['street_address'] = $shippingAddress['address'];
        $shippingAddress['postal_code'] = $shippingAddress['post_code'];
        // shipping address
        $couponDiscount = $request->coupon_discount;
        $cartProducts = $cart->content();
        $weight = 0;
        foreach ($cartProducts as $cartProduct){
            $product = Product::find($cartProduct->id);
            $weight = $weight + ($product->gross_weight * $cartProduct->qty);
        }

        try {
            $clientOrder = new ClientOrder();
            $clientOrder->user_id = $user->id;
            $clientOrder->invoice = $invoice;
            $clientOrder->price = $cart->subtotal();
            $clientOrder->discount = $couponDiscount ? $couponDiscount : 0;
            $clientOrder->weight = $weight;
            if ($request->has('payment')){
                $clientOrder->payment = $request->payment;
                $clientOrder->payment_status = true;
            }
            $clientOrder->payment_trx = $request->has('payment_trx')?$request->payment_trx:null;
            $clientOrder->save();
            $clientOrder->address()->create($shippingAddress);

            foreach ($cartProducts as $cartProduct) {
                $size = null;
                $color = null;
                if ($cartProduct->options['size']) {
                    $size = AttributeItem::find($cartProduct->options['size'])->name;
                }
                if ($cartProduct->options['color']) {
                    $color = AttributeItem::find($cartProduct->options['color'])->name;
                }
                $orderedProduct = new OrderedProduct();
                $orderedProduct->order_id = $clientOrder->id;
                $orderedProduct->product_id = $cartProduct->id;
                $orderedProduct->specification = ($size ? "Size: " . $size : '') . ' ' . ($color ? "Color: " . $color : '');
                $orderedProduct->qty = $cartProduct->qty;
                $orderedProduct->price_qty = $cartProduct->subtotal();
                $orderedProduct->discount = ($cartProduct->options['discount'] * $cartProduct->qty);
                $orderedProduct->save();

                Cart::instance('shopping_cart')->remove($cartProduct->rowId);
            }

            $order = $clientOrder;
            Mail::mailer('smtp')
                ->to($user->email)
                ->cc($contact->email)
                ->send(new OrderNotification($order));

            $notification = [
                'status' => 'success',
                'message' => 'Order placed successfully. please wait for order confirmation....',
                'route' => route('invoice',$clientOrder)
            ];
            return response()->json($notification);
        }catch (\Throwable $th){
            $notification = [
                'status' => 'error',
                'message' => $th->getMessage()
            ];
            return response()->json($notification);
        }
    }

    public function invoice(ClientOrder $order)
    {
        try {
            return view('invoice.invoice1', compact('order'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function statusUpdate(Request $request, ClientOrder $order)
    {
        try {
            $status = '';
            foreach ($this->orderPermission() as $item){
                if ($item->permission_code == $request->order_status){
                    $status = $item->name;
                }
            }
            $order->update(['order_status'=>$request->order_status, 'accepted_by' => Auth::user()->id]);
            return $this->backWithSuccess('#'.$order->invoice.' has been '.$status);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function shurjaPayOrderStore(Request $request)
    {
        $cart = Cart::instance('shopping_cart');
        $invoice = $request->invoice;
        $invoice = 10000+(ClientOrder::count()+1);
        $user = Auth::user();
        $contact = Company::first();
        // shipping address
        $shippingAddress = (array)json_decode($request->shipping_address, true);
        $shippingAddress['country'] = CountryList::find($shippingAddress['country'])->name;
        $shippingAddress['police_station'] = ThanaList::find($shippingAddress['police_station'])->name;
        $shippingAddress['state'] = DistrictList::find($shippingAddress['state'])->name;
        $shippingAddress['street_address'] = $shippingAddress['address'];
        $shippingAddress['postal_code'] = $shippingAddress['post_code'];
        // shipping address
        $couponDiscount = $request->coupon_discount;
        $cartProducts = $cart->content();
        $weight = 0;
        foreach ($cartProducts as $cartProduct){
            $product = Product::find($cartProduct->id);
            $weight = $weight + ($product->gross_weight * $cartProduct->qty);
        }

        try {
            $clientOrder = new ClientOrder();
            $clientOrder->user_id = $user->id;
            $clientOrder->invoice = $invoice;
            $clientOrder->price = $cart->subtotal();
            $clientOrder->discount = $couponDiscount ? $couponDiscount : 0;
            $clientOrder->weight = $weight;
            if ($request->has('payment')){
                $clientOrder->payment = $request->payment;
            }
            $clientOrder->payment_trx = $request->has('payment_trx')?$request->payment_trx:null;
            $clientOrder->save();
            $clientOrder->address()->create($shippingAddress);

            foreach ($cartProducts as $cartProduct) {
                $size = null;
                $color = null;
                if ($cartProduct->options['size']) {
                    $size = AttributeItem::find($cartProduct->options['size'])->name;
                }
                if ($cartProduct->options['color']) {
                    $color = AttributeItem::find($cartProduct->options['color'])->name;
                }
                $orderedProduct = new OrderedProduct();
                $orderedProduct->order_id = $clientOrder->id;
                $orderedProduct->product_id = $cartProduct->id;
                $orderedProduct->specification = ($size ? "Size: " . $size : '') . ' ' . ($color ? "Color: " . $color : '');
                $orderedProduct->qty = $cartProduct->qty;
                $orderedProduct->price_qty = $cartProduct->subtotal();
                $orderedProduct->discount = ($cartProduct->options['discount'] * $cartProduct->qty);
                $orderedProduct->save();

                Cart::instance('shopping_cart')->remove($cartProduct->rowId);
            }

            $data = $clientOrder;
            $data->address = $clientOrder->address;
            $data->user = $clientOrder->user;
            return response()->json($data);
        }catch (\Throwable $th){
            $notification = [
                'status' => 'error',
                'message' => $th->getMessage()
            ];
            return response()->json($notification);
        }
    }
}
