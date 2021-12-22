<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\CountryList;
use App\Models\DistrictList;
use App\Models\PaymentMethod;
use App\Models\ThanaList;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

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
    /*
     * profile
     */
    public function profile()
    {
        try {
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            $title = 'My profile';
            return view('forntend.auth.profile.show', compact('title', 'carts', 'cartTotal'));
        }catch (\Throwable $e){
            $notification = array(
                'message' => $e->getMessage(),
                'alert-type' => 'error'
            );
            return back()->with($notification);
        }
    }

    public function profileUpdate(Request $request)
    {
        try {
            $input = $request->all();
            if ($request->hasFile('photo')){
                $input['photo'] = $request->photo[0];
            }
            $user = Auth::user();

            Validator::make($input, [
                'name' => ['required', 'string', 'max:255'],
                'company_name' => ['required', 'string', 'max:255'],
                'designation' => ['required', 'string', 'max:255'],
                'phone' => ['required', 'string', 'max:14', Rule::unique('profiles')->ignore($user->profile->id)],
                'email' => ['required', 'email', 'max:255', Rule::unique('users')->ignore($user->id)],
                'photo' => ['nullable', 'mimes:jpg,jpeg,png', 'max:1024'],
            ])->validateWithBag('updateProfileInformation');

            if (isset($input['photo'])) {
                $user->updateProfilePhoto($input['photo']);
            }

            if ($input['email'] !== $user->email &&
                $user instanceof MustVerifyEmail) {
                $this->updateVerifiedUser($user, $input);
            } else {
                $user->forceFill([
                    'name' => $input['name'],
                    'email' => $input['email'],
                ])->save();
                $user->profile->update([
                    'company_name' => $input['company_name'],
                    'designation' => $input['designation'],
                    'phone' => $input['phone'],
                ]);
            }

            return $this->backWithSuccess($user->name.'\'s personal information has been updated successfully');
        }catch (\Throwable $e){
            return $this->backWithError($e->getMessage());
        }
    }

    public function profileInfoUpdate(Request $request)
    {
        try {
            $user = Auth::user();

            $this->validate($request, [
                'country' => 'required|string|max:255',
                'district' => 'required|string|max:255',
                'thana' => 'required|string|max:255',
                'city' => 'required|string|max:255',
                'post_code' => 'required|string|max:255',
            ]);

            $inputs = $request->all();
            unset($inputs['_token']);
            $user->address->update($inputs);

            return $this->backWithSuccess($user->name.'\'s personal information has been updated successfully');
        }catch (\Throwable $e){
            return $this->backWithError($e->getMessage());
        }
    }

    protected function updateVerifiedUser($user, array $input)
    {
        try {
            $user->forceFill([
                'name' => $input['name'],
                'email' => $input['email'],
                'email_verified_at' => null,
            ])->save();

            $user->profile->update([
                'company_name' => $input['company_name'],
                'designation' => $input['designation'],
                'phone' => $input['phone'],
            ]);

            $user->sendEmailVerificationNotification();
            return $this->backWithSuccess($user->name.'\'s personal information has been updated successfully');
        }catch (\Throwable $e){
            return $this->backWithError($e->getMessage());
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
        else if ($payment->name === "money_transfer"){
            return response()->json($this->moneyTransfer($payment));
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

    public function moneyTransfer($payment)
    {
        $payment->username = env('SHURJO_PAY_USERNAME');
        $payment->password = env('SHURJO_PAY_PASSWORD');
        return $payment;
    }

    public function bKashPayment($payment)
    {
        return $output = '<form action="javascript:void(0)" method="post" id="'.trim($payment->name).'Method'.'">
        <input type="hidden" name="method" value="'.$payment->name.'">
        <h4><code>'.__('Please use this QR Code or bellow number of the image for your payment. After completing your mobile banking please provide your payment TRX bellow TRX input field for verify your payment. Then press on submit button to complete your order process.').'</code></h4>
        <img src="'.($payment->content? asset($payment->content):'').'" alt="" id="modalImageShow" class="img-fluid img-thumbnail w-50 mx-auto" accept="image/png, image/jpeg"/>
        <p class="mb-1 text-uppercase"><label for="methodStatus">'.__('TRX ID').'</label>: </p>
        <div class="input-group input-group-lg mb-3 text-center">
            <input type="text" name="trx_id" id="trxId" class="form-control">
        </div>
    </form>';
    }

    public function nagadAndRoketPayment($payment)
    {
        return $output = '<form action="javascript:void(0)" method="post" id="'.trim($payment->name).'Method'.'">
        <input type="hidden" name="method" value="'.$payment->name.'">
        <h4><code>'.__('Please use this number for your payment. After completing your mobile banking please provide your payment TRX bellow TRX input field for verify your payment. Then press on submit button to complete your order process.').'</code></h4>
        <p class="font-weight-bold">'.$payment->number.'</p>
        <p class="mb-1 text-uppercase"><label for="methodStatus">'.__('TRX ID').'</label>: </p>
        <div class="input-group input-group-lg mb-3 text-center">
            <input type="text" name="trx_id" id="trxId" class="form-control">
        </div>
    </form>';
    }
}
