<div class="header-bottom sticky-header">
    <div class="container">
        <nav class="main-nav">
            <ul class="menu sf-arrows">
                <li class="active"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                <li class="megamenu-container">
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

                <li><a href="{{ route('blog.index') }}"><span>{{ __('Bloges & News') }}</span></a></li>
                <li><a href="javascript:void(0)"><span>{{ __('About Us') }}</span></a></li>
                <li><a href="javascript:void(0)"><span>{{ __('Contact Us') }}</span></a></li>
                @auth
                    <li class="float-right special-effect"><a href="{{ route('login') }}">{{ __('Dashboard') }}</a></li>
                @else
                    <li class="float-right special-effect"><a href="{{ route('login') }}">{{ __('Login') }}</a></li>
                @endauth
            </ul>
        </nav>
    </div><!-- End .header-bottom -->
</div><!-- End .header-bottom -->
