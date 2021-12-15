<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Mail\OrderNotification;
use App\Models\AttributeItem;
use App\Models\ClientOrder;
use App\Models\Company;
use App\Models\CountryList;
use App\Models\DistrictList;
use App\Models\OrderedProduct;
use App\Models\Product;
use App\Models\ThanaList;
use Barryvdh\DomPDF\PDF;
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

    public function store(Request $request)
    {
//        'user_id', 'invoice', 'price', 'discount', 'weight', 'shipping', 'shipping_status', 'order_status', 'accepted_by'

        $cart = Cart::instance('shopping_cart');
        $invoice = $request->invoice;
        $invoice = '10000'.(ClientOrder::count()+1);
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

//            $pdf = app('dompdf.wrapper');
//            $pdf->loadView('invoice.invoice1', compact('order'));
//            $pdf->save(storage_path().'_filename.pdf');
//            // Finally, you can download the file using download function
//            $pdf->download('customers.pdf');

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
        return view('invoice.invoice1', compact('order'));
    }
}
