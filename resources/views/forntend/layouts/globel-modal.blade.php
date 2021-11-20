@include('forntend.menus.mobile-menu')
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
