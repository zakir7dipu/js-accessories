<div class="header-middle">
    <div class="container">
        <div class="header-left">
            <button class="mobile-menu-toggler" type="button">
                <i class="icon-menu"></i>
            </button>
            <a href="{{ route('home') }}" class="logo">
                {!! $generalSettings?'<img src="'.asset($generalSettings->site_tag_image).'" data-src="'.asset($generalSettings->logo).'" alt="Porto Logo">':'<img src="'.asset('forntend/assets/images/logo.png').'" data-src="'.asset('forntend/assets/images/logo-black.png').'" alt="Porto Logo">' !!}
{{--                <img src="{{ asset('forntend/assets/images/logo.png') }}" data-src="{{ asset('forntend/assets/images/logo-black.png') }}" alt="Porto Logo">--}}
            </a>
        </div><!-- End .header-left -->

        <div class="header-center">
            <div class="header-search">
                <a href="javascript:void(0)" class="search-toggle" role="button"><i class="icon-magnifier"></i></a>
                <form action="{{ route('search.header') }}" method="get" id="productSearchByCategory">
                    <div class="header-search-wrapper">
                        <input type="search" class="form-control" name="quarry_string" id="q" placeholder="I'm searching for..." list="productSearchList" required>
                        <datalist id="productSearchList"></datalist>
                        <div class="select-custom">
                            <select id="cat" name="quarry_element" id="productSearchCategory" datasrc="{{ route('search.category') }}">
                                <option disabled selected value="{{ null }}">{{ __('Select One') }}</option>
                                @foreach($parentCategories as $key => $parentCategory)
                                    <optgroup label="{{ $parentCategory->name }}">
                                        @foreach($parentCategory->childCategory as $childCategory)
                                            <option value="{{ $childCategory->id }}">{{ $childCategory->name }}</option>
                                        @endforeach
                                    </optgroup>
                                @endforeach
                            </select>
                        </div><!-- End .select-custom -->
                        <button class="btn" type="submit"><i class="icon-magnifier"></i></button>
                    </div><!-- End .header-search-wrapper -->
                </form>
            </div><!-- End .header-search -->
        </div><!-- End .headeer-center -->

        <div class="header-right">
{{--            <a href="#" class="porto-icon"><i class="icon icon-heart"></i></a>--}}

            <div class="dropdown cart-dropdown">
                <a href="#" class="dropdown-toggle porto-icon" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" style="padding-right: 0px;">
                    <i class="icon icon-heart"></i>
                    <span class="cart-count wishCount">2</span>
                </a>

                <div class="dropdown-menu" >
                    <div class="dropdownmenu-wrapper">
                        <div class="dropdown-cart-header">
                            <span><span class="wishCount">3</span> {{ __('Items') }}</span>
                            <a href="{{ route('my-wishes') }}">{{ __('My Wishes') }}</a>
                        </div><!-- End .dropdown-cart-header -->
                        <div class="dropdown-cart-products myWishesList">

                        </div><!-- End .cart-product -->

                        <div class="dropdown-cart-action">
                            <a href="{{ route('my-wishes') }}" class="btn btn-block wishToCartBtn">{{ __('Add To Cart') }}</a>
                        </div><!-- End .dropdown-cart-total -->
                    </div><!-- End .dropdownmenu-wrapper -->
                </div><!-- End .dropdown-menu -->
            </div><!-- End .dropdown heart -->

            <div class="dropdown cart-dropdown">
                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                    <i class="minicart-icon"></i>
                    <span class="cart-count cartCount">2</span>
                </a>

                <div class="dropdown-menu" >
                    <div class="dropdownmenu-wrapper">
                        <div class="dropdown-cart-header">
                            <span><span class="cartCount">2</span> {{ __('Items') }}</span>

                            <a href="{{ route('cart.items') }}">{{ __('View Cart') }}</a>
                        </div><!-- End .dropdown-cart-header -->
                        <div class="dropdown-cart-products myCartList">

                            @foreach($carts as $cart)
                            <div class="product">
                                <div class="product-details">
                                    <h4 class="product-title">
                                        <a href="javascript:void(0)">{{ $cart->name }}</a>
                                    </h4>

                                    <span class="cart-product-info">
                                                    <span class="cart-product-qty">{{ $cart->qty }}</span>
                                                    x {{ $cart->options['currence'].$cart->price }}
                                                </span>
                                </div><!-- End .product-details -->

                                <figure class="product-image-container" data-role="{{ $cart->rowId }}">
                                    <a href="javascript:void(0)" class="product-image">
                                        <img src="{{ asset($cart->options['image']) }}" alt="product">
                                    </a>
{{--                                    <a href="javascript:void(0)" class="btn-remove cartRemoveBtn" title="Remove Product"><i class="icon-retweet"></i></a>--}}
                                </figure>
                            </div><!-- End .product -->
                            @endforeach
                        </div><!-- End .cart-product -->

                        <div class="dropdown-cart-total">
                            <span>{{ __('Total') }}</span>

                            <span class="cart-total-price">{{ $cartTotal }}</span>
                        </div><!-- End .dropdown-cart-total -->

                        {!! count($carts) > 0 ? '<div class="dropdown-cart-action">
                            <a href="'.route('client.checkout.index').'" class="btn btn-block">'.__('Checkout').'</a>
                        </div><!-- End .dropdown-cart-total -->':'' !!}

                    </div><!-- End .dropdownmenu-wrapper -->
                </div><!-- End .dropdown-menu -->
            </div><!-- End .dropdown cart -->
        </div><!-- End .header-right -->
    </div><!-- End .container -->
</div><!-- End .header-middle -->
