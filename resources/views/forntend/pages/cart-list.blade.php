@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

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
            <div class="row">
                <div class="col-lg-8">
                    <div class="cart-table-container">
                        <table class="table table-cart">
                            <thead>
                            <tr>
                                <th class="product-col">{{ __('Product') }}</th>
                                <th class="price-col">{{ __('Price') }}</th>
                                <th class="qty-col">{{ __('Qty') }}</th>
                                <th>{{ __('Subtotal') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($carts as $cart)
                                <tr class="product-row">
                                    <td class="product-col">
                                        <figure class="product-image-container">
                                            <a href="{{ route('single-product',$cart->options['slug']) }}" class="product-image">
                                                <img src="{{ $cart->options['image'] }}" alt="product">
                                            </a>
                                        </figure>
                                        <h2 class="product-title">
                                            @php
                                                $color = \App\Models\AttributeItem::find($cart->options['color']);
                                                $size = \App\Models\AttributeItem::find($cart->options['size'])
                                            @endphp
                                            <a href="{{ route('single-product',$cart->options['slug']) }}">{!!  $cart->name. ($color?' <span class="badge m-1 rounded"  style="background-color: '.$color->details.';">'.$color->name.'</span>':'').( $size?'<span class="badge m-1 btn-primary rounded">'.$size->name.'</span>':'')  !!}
                                            </a>
                                        </h2>
                                    </td>
                                    <td>{{ $cart->options['currence'].$cart->price }}</td>
                                    <td>
                                        <form action="{{ route('cart.update',$cart->rowId) }}" method="post" class="cartUpdateForm">
                                            @csrf
                                            @method('put')
                                            <input class="vertical-quantity form-control" type="text" name="qty" value="{{ $cart->qty }}">
                                        </form>
                                    </td>
                                    <td>{{ $cart->subtotal() }}</td>
                                </tr>
                                <tr class="product-action-row">
                                    <td colspan="4" class="clearfix">
                                        <div class="float-right" data-role="{{ $cart->rowId }}">
                                            <a href="javascript:void(0)" title="Edit product" class="btn-edit cartUpdateBtn"><span class="sr-only">Edit</span><i class="icon-pencil"></i></a>
                                            <a href="javascript:void(0)" title="Remove product" class="btn-remove cartRemoveBtn"><span class="sr-only">Remove</span></a>
                                        </div><!-- End .float-right -->
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>

                            <tfoot>
                            <tr>
                                <td colspan="4" class="clearfix">
                                    <div class="float-left">
                                        <a href="{{ route('home') }}" class="btn btn-outline-secondary">{{ __('Continue Shopping') }}</a>
                                    </div><!-- End .float-left -->

                                    <div class="float-right">
                                        <form action="{{ route('cart.destroy') }}" method="post" class="form-inline">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-outline-secondary btn-clear-cart">{{ __('Clear Shopping Cart') }}</button>
                                        </form>
                                    </div><!-- End .float-right -->
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div><!-- End .cart-table-container -->

{{--                    <div class="cart-discount">--}}
{{--                        <h4>Apply Discount Code</h4>--}}
{{--                        <form action="#">--}}
{{--                            <div class="input-group">--}}
{{--                                <input type="text" class="form-control form-control-sm" placeholder="Enter discount code"  required>--}}
{{--                                <div class="input-group-append">--}}
{{--                                    <button class="btn btn-sm btn-primary" type="submit">Apply Discount</button>--}}
{{--                                </div>--}}
{{--                            </div><!-- End .input-group -->--}}
{{--                        </form>--}}
{{--                    </div><!-- End .cart-discount -->--}}
                </div><!-- End .col-lg-8 -->

                <div class="col-lg-4">
                    <div class="cart-summary">
                        <h3>Summary</h3>

                        <h4>
                            <a data-toggle="collapse" href="#total-estimate-section" class="collapsed" role="button" aria-expanded="false" aria-controls="total-estimate-section">Estimate Shipping and Tax</a>
                        </h4>

                        <div class="collapse" id="total-estimate-section">
                            <form action="#">
                                <div class="form-group form-group-sm">
                                    <label>Country</label>
                                    <div class="select-custom">
                                        <select class="form-control form-control-sm">
                                            <option value="USA">United States</option>
                                            <option value="Turkey">Turkey</option>
                                            <option value="China">China</option>
                                            <option value="Germany">Germany</option>
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group -->

                                <div class="form-group form-group-sm">
                                    <label>State/Province</label>
                                    <div class="select-custom">
                                        <select class="form-control form-control-sm">
                                            <option value="CA">California</option>
                                            <option value="TX">Texas</option>
                                        </select>
                                    </div><!-- End .select-custom -->
                                </div><!-- End .form-group -->

                                <div class="form-group form-group-sm">
                                    <label>Zip/Postal Code</label>
                                    <input type="text" class="form-control form-control-sm">
                                </div><!-- End .form-group -->

                                <div class="form-group form-group-custom-control">
                                    <label>Flat Way</label>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="flat-rate">
                                        <label class="custom-control-label" for="flat-rate">Fixed $5.00</label>
                                    </div><!-- End .custom-checkbox -->
                                </div><!-- End .form-group -->

                                <div class="form-group form-group-custom-control">
                                    <label>Best Rate</label>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="best-rate">
                                        <label class="custom-control-label" for="best-rate">Table Rate $15.00</label>
                                    </div><!-- End .custom-checkbox -->
                                </div><!-- End .form-group -->
                            </form>
                        </div><!-- End #total-estimate-section -->

                        <table class="table table-totals">
                            <tbody>
                            <tr>
                                <td>{{ __('Subtotal') }}</td>
                                <td>{{ $cartTotal }}</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td>{{ __('Order Total') }}</td>
                                <td>{{ $cartTotal }}</td>
                            </tr>
                            </tfoot>
                        </table>

                        <div class="checkout-methods">
                            <a href="javascript:void(0)" class="btn btn-block btn-sm btn-primary">{{ __('Go to Checkout') }}</a>
{{--                            <a href="#" class="btn btn-link btn-block">Check Out with Multiple Addresses</a>--}}
                        </div><!-- End .checkout-methods -->
                    </div><!-- End .cart-summary -->
                </div><!-- End .col-lg-4 -->
            </div><!-- End .row -->
        </div>
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
