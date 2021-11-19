<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

<div class="mobile-menu-container">
    <div class="mobile-menu-wrapper">
        <span class="mobile-menu-close"><i class="icon-retweet"></i></span>
        <nav class="mobile-nav">
            <ul class="mobile-menu">
                <li class="active"><a href="javascript:void(0)">Home</a></li>
                <li>
                    <a href="javascript:void(0)">Categories</a>
                    <ul>
                        <li><a href="javascript:void(0)">Full Width Banner</a></li>
                        <li><a href="javascript:void(0)">Boxed Slider Banner</a></li>
                        <li><a href="javascript:void(0)">Boxed Image Banner</a></li>
                        <li><a href="javascript:void(0)">Left Sidebar</a></li>
                        <li><a href="javascript:void(0)">Right Sidebar</a></li>
                        <li><a href="javascript:void(0)">Product Flex Grid</a></li>
                        <li><a href="javascript:void(0)">Horizontal Filter 1</a></li>
                        <li><a href="javascript:void(0)">Horizontal Filter 2</a></li>
                        <li><a href="#">Product List Item Types</a></li>
                        <li><a href="javascript:void(0)">Ajax Infinite Scroll<span class="tip tip-new">New</span></a></li>
                        <li><a href="javascript:void(0)">3 Columns Products</a></li>
                        <li><a href="javascript:void(0)">4 Columns Products</a></li>
                        <li><a href="javascript:void(0)">5 Columns Products</a></li>
                        <li><a href="javascript:void(0)">6 Columns Products</a></li>
                        <li><a href="javascript:void(0)">7 Columns Products</a></li>
                        <li><a href="javascript:void(0)">8 Columns Products</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)">Products</a>
                    <ul>
                        <li>
                            <a href="#">Variations</a>
                            <ul>
                                <li><a href="javascript:void(0)">Horizontal Thumbnails</a></li>
                                <li><a href="javascript:void(0)">Vertical Thumbnails<span class="tip tip-hot">Hot!</span></a></li>
                                <li><a href="javascript:void(0)">Inner Zoom</a></li>
                                <li><a href="javascript:void(0)">Addtocart Sticky</a></li>
                                <li><a href="javascript:void(0)">Accordion Tabs</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Variations</a>
                            <ul>
                                <li><a href="javascript:void(0)">Sticky Tabs</a></li>
                                <li><a href="javascript:void(0)">Simple Product</a></li>
                                <li><a href="javascript:void(0)">With Left Sidebar</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Product Layout Types</a>
                            <ul>
                                <li><a href="javascript:void(0)">Default Layout</a></li>
                                <li><a href="javascript:void(0)">Extended Layout</a></li>
                                <li><a href="javascript:void(0)">Full Width Layout</a></li>
                                <li><a href="javascript:void(0)">Grid Images Layout</a></li>
                                <li><a href="javascript:void(0)">Sticky Both Side Info<span class="tip tip-hot">Hot!</span></a></li>
                                <li><a href="javascript:void(0)">Sticky Right Side Info</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Pages<span class="tip tip-hot">Hot!</span></a>
                    <ul>
                        <li><a href="javascript:void(0)">Shopping Cart</a></li>
                        <li>
                            <a href="#">Checkout</a>
                            <ul>
                                <li><a href="javascript:void(0)">Checkout Shipping</a></li>
                                <li><a href="javascript:void(0)">Checkout Shipping 2</a></li>
                                <li><a href="javascript:void(0)">Checkout Review</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:void(0)">About</a></li>
                        <li><a href="#" class="login-link">Login</a></li>
                        <li><a href="javascript:void(0)">Forgot Password</a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0)">Blog</a>
                    <ul>
                        <li><a href="javascript:void(0)">Blog Post</a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0)">Contact Us</a></li>
                <li><a href="#">Special Offer!<span class="tip tip-hot">Hot!</span></a></li>
                <li><a href="https://1.envato.market/DdLk5" target="_blank">Buy Porto!</a></li>
            </ul>
        </nav><!-- End .mobile-nav -->

        <div class="social-icons">
            <a href="#" class="social-icon" target="_blank"><i class="icon-facebook"></i></a>
            <a href="#" class="social-icon" target="_blank"><i class="icon-twitter"></i></a>
            <a href="#" class="social-icon" target="_blank"><i class="icon-instagram"></i></a>
        </div><!-- End .social-icons -->
    </div><!-- End .mobile-menu-wrapper -->
</div><!-- End .mobile-menu-container -->

<!-- newsletter-popup-form -->
<div class="newsletter-popup mfp-hide" id="newsletter-popup-form" style="background-image: url({{ $popupAd? asset($popupAd[0]->image):'' }}); background-size: 50%; background-position: right;">
    <div class="newsletter-popup-content">
        <img src="{{ $generalSettings?asset($generalSettings->logo) : '' }}" alt="Logo" class="logo-newsletter">
        <h2>{{ __('BE THE FIRST TO KNOW') }}</h2>
        <p>{{ __('Subscribe to the Porto eCommerce newsletter to receive timely updates from your favorite products.') }}</p>
        <form action="#">
            <div class="input-group">
                <input type="email" class="form-control" id="newsletter-email" name="newsletter-email" placeholder="{{ __('Email address') }}" required>
                <input type="submit" class="btn" value="{{ __('Go') }}!">
            </div><!-- End .from-group -->
        </form>
        <div class="newsletter-subscribe">
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="1">
                    {{ __('Don\'t show this popup again') }}
                </label>
            </div>
        </div>
    </div><!-- End .newsletter-popup-content -->
</div><!-- End .newsletter-popup -->

<!-- Add Cart Modal -->
<div class="modal fade" id="addCartModal" tabindex="-1" role="dialog" aria-labelledby="addCartModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body add-cart-box text-center">
                <p>{{ __('You\'ve just added this product to the').'<br>'.__('cart') }}</p>
                <h4 id="productTitle"></h4>
                <img src="" id="productImage" width="100" height="100" alt="adding cart image">
                <div class="btn-actions">
                    <a href="javascript:void(0)"><button class="btn-primary">{{ __('Go to cart page') }}</button></a>
                    <a href="#"><button class="btn-primary" data-dismiss="modal">{{ __('Continue') }}</button></a>
                </div>
            </div>
        </div>
    </div>
</div>
