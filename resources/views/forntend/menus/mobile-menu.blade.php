<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

<div class="mobile-menu-container">
    <div class="mobile-menu-wrapper">
        <span class="mobile-menu-close"><i class="icon-retweet"></i></span>
        <nav class="mobile-nav">
            <ul class="mobile-menu">
                <li class="active"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                <li>
                    <a href="javascript:void(0)">{{ __('Shop') }}</a>
                    <ul>
                        @foreach($parentCategories as $key => $parentCategory)
                            @foreach($parentCategory->childCategory as $childCategory)
                                <li><a href="{{ route('category-elements',$childCategory->slug) }}">{{ __($childCategory->name) }}</a></li>
                            @endforeach
                        @endforeach
                    </ul>
                </li>
                <li><a href="{{ route('blog.index') }}">{{ __('Bloges & News') }}</a></li>
                <li><a href="{{ route('view-page',$pages->where('name','about')->first()->id) }}">{{ __('About Us') }}</a></li>
                <li><a href="{{ route('view-page',$pages->where('name','contact')->first()->id) }}">{{ __('Contact Us') }}</a></li>
                @auth
                    @if(Auth::user()->hasRole('customer'))
                        <li><a href="{{ route('client.dashboard') }}">{{ __('Dashboard') }}</a></li>
                    @else
                        <li><a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }}</a></li>
                    @endif
                @else
                    <li><a href="{{ route('login') }}">{{ __('Login') }}</a></li>
                @endauth
            </ul>
        </nav><!-- End .mobile-nav -->

        <div class="social-icons">
            <a href="#" class="social-icon" target="_blank"><i class="icon-facebook"></i></a>
            <a href="#" class="social-icon" target="_blank"><i class="icon-twitter"></i></a>
            <a href="#" class="social-icon" target="_blank"><i class="icon-instagram"></i></a>
        </div><!-- End .social-icons -->
    </div><!-- End .mobile-menu-wrapper -->
</div><!-- End .mobile-menu-container -->
