@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')
    <link rel="stylesheet" href="{{ asset('backend/assets/plugin/bootstrap-select/bootstrap-select.min.css') }}">
@endsection

@section('content')
    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ $title }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container my-5">
            <ul class="checkout-progress-bar">
                <li class="progressBar"> <!-- active -->
                    <span>Shipping</span>
                </li>
                <li class="progressBar">
                    <span>Review &amp; Payments</span>
                </li>
            </ul>
            <form action="javascript:void(0)" method="post" id="checkoutForm">
                @csrf
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="checkout-steps">
                            <li>
                                <h2 class="step-title">{{ __('Shipping Address') }}</h2>
                                <div class="form-group required-field">
                                    <label for="cName">{{ __('Name') }} <small class="text-danger"></small></label>
                                    <input type="text" name="name" id="cName" class="form-control" >
                                </div><!-- End .form-group required-->

                                <div class="form-group">
                                    <label for="companyName">{{ __('Company') }}</label>
                                    <input type="text" name="company_name" id="companyName" class="form-control">
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label for="address">{{ __('Street Address') }} <small class="text-danger"></small></label>
                                    <textarea name="address" id="address" rows="1" class="form-control" ></textarea>
                                </div><!-- End .form-group required-->

                                <div class="form-group required-field">
                                    <label for="policeStation">{{ __('Police Station') }}  <small class="text-danger"></small></label>
                                    <div class="select-custom">
                                        <select name="police_station" id="policeStation" class="form-control form-select form-select-lg" data-live-search="true" data-size="5" title="Select your police station.">
                                            @foreach($policeStations as $policeStation)
                                                <option data-tokens="{{ $policeStation->name }}" value="{{ $policeStation->id }}">{{ $policeStation->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div><!-- End .form-group required-->

                                <div class="form-group required-field">
                                    <label for="state">{{ __('State/Province') }} <small class="text-danger"></small></label>
                                    <div class="select-custom">
                                        <select name="state" id="state" class="form-control form-select form-select-lg" data-live-search="true" data-size="5" title="Select your state.">
                                            @foreach($states as $state)
                                                <option data-tokens="{{ $state->name }}" value="{{ $state->id }}">{{ $state->name }}</option>
                                            @endforeach
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group required-->

                                <div class="form-group required-field">
                                    <label for="postCode">{{ __('Zip/Postal Code') }} <small class="text-danger"></small></label>
                                    <input type="text" name="post_code" id="postCode" class="form-control" >
                                </div><!-- End .form-group required-->

                                <div class="form-group required-field">
                                    <label for="country">{{ __('Country') }} <small class="text-danger"></small></label>
                                    <div class="select-custom">
                                        <select name="country" id="country" class="form-control form-select form-select-lg" data-live-search="true" data-size="5" title="Select your country.">
                                            @foreach($countries as $country)
                                                <option data-tokens="{{ $country->name }}" value="{{ $country->id }}">{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group required-->

                                <div class="form-group required-field">
                                    <label for="phone">{{ __('Phone Number') }} <small class="text-danger"></small></label>
                                    <div class="form-control-tooltip">
                                        <input type="tel" class="form-control" name="phone" id="phone" >
                                        <span class="input-tooltip" data-toggle="tooltip" title="For delivery questions." data-placement="right"><i class="icon-question-circle"></i></span>
                                    </div><!-- End .form-control-tooltip -->
                                </div><!-- End .form-group required-->
                            </li>
                        </ul>
                    </div><!-- End .col-lg-8 -->

                    <div class="col-lg-4">
                        <div class="order-summary">
                            <h3>{{ __('Summary') }}</h3>
                            <h4>
                                <a data-toggle="collapse" href="#order-cart-section" class="collapsed" role="button" aria-expanded="false" aria-controls="order-cart-section">{{ count($carts). __(' products in Cart') }}</a>
                            </h4>

                            <div class="collapse" id="order-cart-section">
                                <table class="table table-mini-cart">
                                    <tbody>
                                    @foreach($carts as $cart)
                                        <tr>
                                            <td class="product-col">
                                                <figure class="product-image-container">
                                                    <a href="{{ route('single-product',$cart->options['slug']) }}" class="product-image">
                                                        <img src="{{ $cart->options['image'] }}" alt="product">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <h2 class="product-title">
                                                        <a href="{{ route('single-product',$cart->options['slug']) }}">{{ $cart->name }}</a>
                                                    </h2>

                                                    <span class="product-qty">{{ __('Qty: ').$cart->qty }}</span>
                                                </div>
                                            </td>
                                            <td class="price-col">
                                                {{ $cart->subtotal() }}
                                            </td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td class="product-col">
                                            <div>
                                                <h2 class="product-title">
                                                    {{ __('Total') }}
                                                </h2>
                                            </div>
                                        </td>
                                        <td class="price-col">{{ $cartTotal }}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div><!-- End #order-cart-section -->
                        </div><!-- End .order-summary -->
                    </div><!-- End .col-lg-4 -->
                </div><!-- End .row -->

                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-steps-action">
                            <button type="submit" class="btn btn-primary float-right saveShippingAddress">{{ __('NEXT') }}</button>
                        </div><!-- End .checkout-steps-action -->
                    </div><!-- End .col-lg-8 -->
                </div><!-- End .row -->
            </form>
        </div>
    </main><!-- End .main -->
@endsection

@section('page-script')
    <script src="{{ asset('backend/assets/plugin/bootstrap-select/bootstrap-select.min.js') }}"></script>
    <script src="{{ asset('forntend/assets/js/ecommerce-checkout.js') }}"></script>
@endsection
