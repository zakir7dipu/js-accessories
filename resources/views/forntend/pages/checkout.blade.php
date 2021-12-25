@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')
    <link rel="stylesheet" href="{{ asset('backend/assets/plugin/bootstrap-select/bootstrap-select.min.css') }}">
    <style>
        /*#orderProcessLoadView .modal-body {*/
        /*    background-color: rgba(0,0,0,0.5) !important;*/
        /*}*/
        .loadOverlay{
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background-color: rgba(00,00,00,.9);
            align-items: center;
            justify-content: center;
            opacity: .8;
            transition: .5s;
            margin: 0 auto;
            display: none;
        }
        .activeLoadOverlay{
            display: flex;
        }
        .loadOverlay img{
            width: 150px;
        }
        .stop-scrolling {
            height: 100%;
            overflow: hidden;
        }
    </style>
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
                    <span>{{ __('Shipping') }}</span>
                </li>
                <li class="progressBar">
                    <span>{{ __('Review & Payments') }}</span>
                </li>
            </ul>
            <form action="javascript:void(0)" class="d-none" method="post" id="checkoutForm">
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
                        @include('forntend.pages.checkout.summary')
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

            <div class="row" id="reviewCheckout">
                <div class="col-lg-4">
                    @include('forntend.pages.checkout.summary')
                </div><!-- End .col-lg-4 -->

                <div class="col-lg-8 order-lg-first">
                    <ul class="checkout-steps">
                        <li>
                            <h2 class="step-title">{{ __('Shipping Address') }}</h2>

                            <div class="shipping-step-addresses">
                                <div class="shipping-address-box active">

                                </div><!-- End .shipping-address-box -->
                            </div><!-- End .shipping-step-addresses -->
                            <a href="javascript:void (0)" class="btn btn-sm btn-outline-secondary btn-new-address">{{ __('New Address') }}</a>
                        </li>
                    </ul>
                    <div class="checkout-payment">
                        @if(count($paymentMethods) === 0)
                            <div class="clearfix">
                                <a href="javascript:void(0)" class="btn btn-primary float-right orderProcessBtn">{{ __('Place Order') }}</a>
                            </div><!-- End .clearfix -->
                        @else
                            <h2 class="step-title">{{ __('Payment Method') }}:</h2>

                            <div class="row p-3">
                                @foreach($paymentMethods as $payment)
                                    <div class="col-lg-2 col-md-m col-sm-4 text-center p-4" data-toggle="tooltip" data-placement="top" title="{{ ucwords(str_replace('_', ' ', $payment->name)) }}">
                                        <img src="{{ asset($payment->icon) }}" alt="{{ $payment->name }}" class="img img-fluid img-thumbnail w-100 cursor-pointer rounded border border-1 border-dark paymentBtn" data-role="{{ route('client.checkout.method',$payment->id) }}">
                                        <h5>{{ ucwords(str_replace('_', ' ', $payment->name)) }}</h5>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div><!-- End .checkout-payment -->
                </div><!-- End .col-lg-8 -->
            </div><!-- End .row -->
        </div>
    </main><!-- End .main -->

    <!-- load view -->
    <div class="loadOverlay">
        <img src="{{ asset('upload/settings/'.$themeColors[config('app.theme_color','1')].'-loader.gif') }}" alt="">
    </div>

@endsection

@section('page-script')
    <script src="{{ asset('backend/assets/plugin/bootstrap-select/bootstrap-select.min.js') }}"></script>
    <script src="{{ asset('forntend/assets/js/ecommerce-checkout.js') }}"></script>
@endsection
