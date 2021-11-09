<div class="header-top">
    <div class="container">
        <div class="header-right">
            {{--                    <p class="welcome-msg">Default welcome msg! </p>--}}

            <div class="header-dropdown dropdown-expanded">
                <a href="#">Links</a>
                <div class="header-menu">
                    <ul>
                        @auth
                            <li><a href="{{ route('login') }}">{{ __('Dashboard') }}</a></li>
                        @else
                            <li><a href="{{ route('register') }}">{{ __('Register') }}</a></li>
                            <li><a href="{{ route('login') }}">{{ __('LOG IN') }}</a></li>
                        @endif
                    </ul>
                </div><!-- End .header-menu -->
            </div><!-- End .header-dropown -->
        </div><!-- End .header-right -->
    </div><!-- End .container -->
</div><!-- End .header-top -->
