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
                <a href="#" class="search-toggle" role="button"><i class="icon-magnifier"></i></a>
                <form action="#" method="get">
                    <div class="header-search-wrapper">
                        <input type="search" class="form-control" name="quarry" id="q" placeholder="I'm searching for..." required>
                        <div class="select-custom">
                            <select id="cat" name="category">
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
                            <a href="javascript:void(0)">{{ __('My Wishes') }}</a>
                        </div><!-- End .dropdown-cart-header -->
                        <div class="dropdown-cart-products myWishesList">

                        </div><!-- End .cart-product -->

                        <div class="dropdown-cart-action">
                            <a href="{{ route('my-wishes') }}" class="btn btn-block">{{ __('My Wish List') }}</a>
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
                            <span>2 Items</span>

                            <a href="javascript:void(0)">View Cart</a>
                        </div><!-- End .dropdown-cart-header -->
                        <div class="dropdown-cart-products">
                            <div class="product">
                                <div class="product-details">
                                    <h4 class="product-title">
                                        <a href="javascript:void(0)">Woman Ring</a>
                                    </h4>

                                    <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    x $99.00
                                                </span>
                                </div><!-- End .product-details -->

                                <figure class="product-image-container">
                                    <a href="javascript:void(0)" class="product-image">
                                        <img src="{{ asset('forntend/assets/images/products/cart/product-1.jpg') }}" alt="product">
                                    </a>
                                    <a href="#" class="btn-remove" title="Remove Product"><i class="icon-retweet"></i></a>
                                </figure>
                            </div><!-- End .product -->

                            <div class="product">
                                <div class="product-details">
                                    <h4 class="product-title">
                                        <a href="javascript:void(0)">Woman Necklace</a>
                                    </h4>

                                    <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    x $35.00
                                                </span>
                                </div><!-- End .product-details -->

                                <figure class="product-image-container">
                                    <a href="javascript:void(0)" class="product-image">
                                        <img src="{{ asset('forntend/assets/images/products/cart/product-2.jpg') }}" alt="product">
                                    </a>
                                    <a href="#" class="btn-remove" title="Remove Product"><i class="icon-retweet"></i></a>
                                </figure>
                            </div><!-- End .product -->
                        </div><!-- End .cart-product -->

                        <div class="dropdown-cart-total">
                            <span>Total</span>

                            <span class="cart-total-price">$134.00</span>
                        </div><!-- End .dropdown-cart-total -->

                        <div class="dropdown-cart-action">
                            <a href="javascript:void(0)" class="btn btn-block">Checkout</a>
                        </div><!-- End .dropdown-cart-total -->
                    </div><!-- End .dropdownmenu-wrapper -->
                </div><!-- End .dropdown-menu -->
            </div><!-- End .dropdown cart -->
        </div><!-- End .header-right -->
    </div><!-- End .container -->
</div><!-- End .header-middle -->
