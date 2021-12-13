<?php

namespace App\Http\Controllers;

use App\Models\PaymentMethod;
use Illuminate\Http\Request;

class PaymentMethodInputController extends Controller
{
    public function __construct()
    {
        Parent::__construct();
    }

    public function getMethodForm(PaymentMethod $payment)
    {
        if ($payment->name === 'cash_on_delivery'){
            return response()->json($this->cashOnDelivery($payment));
        }else{
            return response()->json($payment);
        }

    }

    public function cashOnDelivery($payment)
    {
        return $output = '<form action="'.route('admin.settings.payment.store',$payment->id).'" method="post">
        <input type="hidden" name="_token" value="'.csrf_token().'">
        <p class="mb-1 text-uppercase"><label for="postStatus">'.__('Activation').'</label>: </p>
        <div class="input-group input-group-lg mb-3 text-center">
            <label class="switch">
                <input type="checkbox" name="status" '.($payment->status?'checked':'').' class="methodActivationBtn">
                <span class="slider round"></span>
            </label>
        </div>
    </form>';
    }

    public function storePayment(Request $request, PaymentMethod $payment)
    {
        dd($request->all());
        try {

        }catch (\Throwable $th){
            return response()->json($th->getMessage());
        }
    }
}
