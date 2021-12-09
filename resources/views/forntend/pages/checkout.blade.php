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
{{--                                    <address>--}}
{{--                                        Desmond Mason <br>--}}
{{--                                        123 Street Name, City Name <br>--}}
{{--                                        Los Angeles, California 03100 <br>--}}
{{--                                        United States <br>--}}
{{--                                        (123) 456-7890 <br>--}}
{{--                                    </address>--}}
                                </div><!-- End .shipping-address-box -->

                            </div><!-- End .shipping-step-addresses -->
                            <a href="javascript:void (0)" class="btn btn-sm btn-outline-secondary btn-new-address">{{ __('New Address') }}</a>
                        </li>
                    </ul>
                    <div class="checkout-payment">
                        <h2 class="step-title">{{ __('Payment Method') }}:</h2>

                        <h4>Check / Money order</h4>

                        <div class="form-group-custom-control">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="change-bill-address" value="1">
                                <label class="custom-control-label" for="change-bill-address">My billing and shipping address are the same</label>
                            </div><!-- End .custom-checkbox -->
                        </div><!-- End .form-group -->

                        <div id="checkout-shipping-address">
                            <address>
                                Desmond Mason <br>
                                123 Street Name, City, USA <br>
                                Los Angeles, California 03100 <br>
                                United States <br>
                                (123) 456-7890
                            </address>
                        </div><!-- End #checkout-shipping-address -->

                        <div id="new-checkout-address" class="show">
                            <form action="#">
                                <div class="form-group required-field">
                                    <label>First Name </label>
                                    <input type="text" class="form-control" required>
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label>Last Name </label>
                                    <input type="text" class="form-control" required>
                                </div><!-- End .form-group -->

                                <div class="form-group">
                                    <label>Company </label>
                                    <input type="text" class="form-control">
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label>Street Address </label>
                                    <input type="text" class="form-control" required>
                                    <input type="text" class="form-control" required>
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label>City  </label>
                                    <input type="text" class="form-control" required>
                                </div><!-- End .form-group -->

                                <div class="form-group">
                                    <label>State/Province</label>
                                    <div class="select-custom">
                                        <select class="form-control">
                                            <option value="CA">California</option>
                                            <option value="TX">Texas</option>
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label>Zip/Postal Code </label>
                                    <input type="text" class="form-control" required>
                                </div><!-- End .form-group -->

                                <div class="form-group">
                                    <label>Country</label>
                                    <div class="select-custom">
                                        <select class="form-control">
                                            <option value="USA">United States</option>
                                            <option value="Turkey">Turkey</option>
                                            <option value="China">China</option>
                                            <option value="Germany">Germany</option>
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group -->

                                <div class="form-group required-field">
                                    <label>Phone Number </label>
                                    <div class="form-control-tooltip">
                                        <input type="tel" class="form-control" required>
                                        <span class="input-tooltip" data-toggle="tooltip" title="For delivery questions." data-placement="right"><i class="icon-question-circle"></i></span>
                                    </div><!-- End .form-control-tooltip -->
                                </div><!-- End .form-group -->

                                <div class="form-group-custom-control">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="address-save">
                                        <label class="custom-control-label" for="address-save">Save in Address book</label>
                                    </div><!-- End .custom-checkbox -->
                                </div><!-- End .form-group -->
                            </form>
                        </div><!-- End #new-checkout-address -->

                        <div class="clearfix">
                            <a href="#" class="btn btn-primary float-right">Place Order</a>
                        </div><!-- End .clearfix -->
                    </div><!-- End .checkout-payment -->

                    <div class="checkout-discount">
                        <h4>
                            <a data-toggle="collapse" href="#checkout-discount-section" class="collapsed" role="button" aria-expanded="false" aria-controls="checkout-discount-section">Apply Discount Code</a>
                        </h4>

                        <div class="collapse" id="checkout-discount-section">
                            <form action="#">
                                <input type="text" class="form-control form-control-sm" placeholder="Enter discount code"  required>
                                <button class="btn btn-sm btn-outline-secondary" type="submit">Apply Discount</button>
                            </form>
                        </div><!-- End .collapse -->
                    </div><!-- End .checkout-discount -->
                </div><!-- End .col-lg-8 -->
            </div><!-- End .row -->
        </div>
    </main><!-- End .main -->
@endsection

@section('page-script')
    <script src="{{ asset('backend/assets/plugin/bootstrap-select/bootstrap-select.min.js') }}"></script>
    <script src="{{ asset('forntend/assets/js/ecommerce-checkout.js') }}"></script>
@endsection
