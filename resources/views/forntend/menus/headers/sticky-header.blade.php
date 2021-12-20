<div class="header-bottom sticky-header">
    <div class="container">
        <nav class="main-nav">
            <ul class="menu sf-arrows">
                <li class="{{ request()->path() === '/'?'active':'' }}"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                <li class="megamenu-container {{ request()->is('category*')?'active':'' }}">
                    <a href="javascript:void(0)" class="sf-with-ul">{{ __('Shop') }}</a>
                    <div class="megamenu">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">
                                    @foreach($parentCategories as $key => $parentCategory)
                                        <div class="col-lg-3">
                                            <div class="menu-title">
                                                <a href="javascript:void(0)">{{ $parentCategory->name }}</a>
                                            </div>
                                            <ul>
                                                @foreach($parentCategory->childCategory as $childCategory)
                                                    <li><a href="{{ route('category-elements',$childCategory->slug) }}">{{ __($childCategory->name) }}</a></li>
                                                @endforeach
                                            </ul>
                                        </div><!-- End .col-lg-4 -->
                                    @endforeach
                                </div><!-- End .row -->
                            </div><!-- End .col-lg-8 -->
                        </div><!-- End .row -->
                    </div><!-- End .megamenu -->
                </li>

                <li class="{{ request()->is('blog*')?'active':'' }}"><a href="{{ route('blog.index') }}"><span>{{ __('Bloges & News') }}</span></a></li>
                <li class="{{ request()->is('about-us*')?'active':'' }}"><a href="{{ route('view-page',$pages->where('name','about')->first()->id) }}"><span>{{ __('About Us') }}</span></a></li>
                <li class="{{ request()->is('contact-us*')?'active':'' }}"><a href="{{ route('view-page',$pages->where('name','contact')->first()->id) }}"><span>{{ __('Contact Us') }}</span></a></li>
                @auth
                    @if(Auth::user()->hasRole('customer'))
                    <li class="float-right special-effect"><a href="{{ route('client.dashboard') }}">{{ __('Dashboard') }}</a></li>
                    @else
                    <li class="float-right special-effect"><a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }}</a></li>
                    @endif
                @else
                    <li class="float-right special-effect"><a href="{{ route('login') }}">{{ __('Login') }}</a></li>
                @endauth
            </ul>
        </nav>
    </div><!-- End .header-bottom -->
</div><!-- End .header-bottom -->
