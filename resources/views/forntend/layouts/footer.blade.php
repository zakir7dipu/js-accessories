<footer class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <a href="{{ route('register') }}" class="widget-newsletter-title">{{ __('Sign Up to Newsletter') }}</a>
                </div>
                <div class="col-lg-4">
                    <p class="widget-newsletter-content">
                        <span class="widget-newsletter-content">{{ __('Get all the latest information on Events, Sales and Offers.') }}</span>
                        <br>
{{--                        <span class="widget-newsletter-content">{{ __('Receive $10 coupon for first shopping.') }}</span>--}}
                    </p>
                </div>
                <div class="col-lg-5">
                    <form action="javascript:void (0)" id="subscriptionForm" data-role="{{ route('subscription') }}">
                        <div class="footer-submit-wrapper">
                            <input type="email" class="form-control" placeholder="Enter your Email address" required>
                            <button type="submit" class="btn">{{ __('Subscribe') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="footer-middle   ">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <a href="{{ route('home') }}">
                        {!! $generalSettings?'<img src="'.asset($generalSettings->logo).'" alt="Porto Logo" class="mt-2">':'<img src="'.asset('forntend/assets/images/logo.png').'" data-src="'.asset('forntend/assets/images/logo-black.png').'" alt="Porto Logo" class="mt-2">' !!}
                    </a>
                    <div class="row">
                        <div class="col-sm-6 col-xl-4">
                            <div class="contact-widget phone">
                                <div style="display: inline-block;">
                                    <h4 class="widget-title">{{ __('call us now') }}</h4>
                                    <a href="tel:{{ $contact->phone }}">{{ $contact->phone }}</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-4">
                            <div class="contact-widget email">
                                <h4 class="widget-title" style="margin-bottom : .5rem;">{{ __('e-mail address') }}</h4>
                                <a href="mailto:{{ $contact->email }}">{{ $contact->email }}</a>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="contact-widget follow">
                                <h4 class="widget-title">{{ __('follow us') }}</h4>
                                <div class="social-icons">
                                    @foreach($socialMediaLinks as $socialMediaLink)
                                        @if($socialMediaLink->url)
                                            <a href="{{ $socialMediaLink->url }}" class="social-icon" target="_blank"><i class="fab fa-{{ $socialMediaLink->name == 'facebook'?$socialMediaLink->name.'-f':$socialMediaLink->name }}"></i></a>
                                        @endif
                                    @endforeach
                                </div><!-- End .social-icons -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="widget">
                                <h4 class="widget-title">{{ __('Categories') }}</h4>
                                <ul class="links">
                                    @foreach($parentCategories as $key => $parentCategory)
                                        <li><a href="#">{{ $parentCategory->name }}</a></li>
                                    @endforeach
                                </ul>
                            </div><!-- End .widget -->
                        </div>
                        <div class="col-sm-4">
                            <div class="widget">
                                <h4 class="widget-title">{{ __('Pages') }}</h4>
                                <ul class="links">
                                    @foreach($pages as $key => $page)
                                    <li><a href="{{ route('view-page',$page->id) }}">{{ ucwords(str_replace('_', ' ', $page->name)) }}</a></li>
                                    @endforeach
                                </ul>
                            </div><!-- End .widget -->
                        </div>
                        <div class="col-sm-4">
                            <div class="widget">
                                <h4 class="widget-title">{{ __('Customer Care') }}</h4>
                                <ul class="links">
                                    <li><a href="{{ route('client.dashboard') }}">{{ __('My Account') }}</a></li>
                                    <li><a href="{{ route('my-wishes') }}">{{ __('Wishlist') }}</a></li>
                                    <li><a href="{{ route('cart.items') }}">{{ __('Shopping Cart') }}</a></li>
                                    <!--<li><a href="javascript:void(0)">{{ __('Saved Item') }}</a></li>-->
                                    <li><a href="{{ route('view-contact-page') }}">{{ __('Request Item') }}</a></li>
                                </ul>
                            </div><!-- End .widget -->
                        </div>
                    </div>
                </div>
            </div><!-- End .row -->
        </div><!-- End .footer-middle -->
        <div class="footer-bottom">
            <p class="footer-copyright">{!! config('app.name').'. &copy; '.date('Y', time()). '. All Rights Reserved' !!}</p>
{{--            <img src="{{ asset('forntend/assets/images/payments_long.png') }}" width="180px" style="max-height: 24px">--}}
        </div><!-- End .footer-bottom -->
    </div>
</footer><!-- End .footer -->
