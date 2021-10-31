<div id="wrapper-left">
    <!-- SIDEBAR -->
    <div class="sidebar sidebar-dark sidebar-danger bg-dark">
        <!-- SIDEBAR HEADER -->
        <div class="sidebar-header border-fade">
            <!-- SIDEBAR BRAND -->
            <a href="{{ route('admin.dashboard') }}" class="sidebar-brand">
                <!-- SIDEBAR BRAND IMG -->
                {!! $generalSettings?'<img  class="img-fluid sidebar-brand-img w-100" src="'. asset($generalSettings->site_tag_image) .'" />':'<img  class="sidebar-brand-img" src="'.asset('backend/assets/img/logo/red.png').'" />' !!}
                <!-- SIDEBAR BRAND TEXT -->
{{--                <span class="sidebar-brand-text">quantummagazine</span>--}}
            </a>
            <!-- SIDEBAR CLOSE -->
            <a href="javascript:void(0);" class="sidebar-close d-md-none"  data-toggle="class" data-target="#wrapper" toggle-class="toggled">
                <i class="material-icons icon-sm">close</i>
            </a>
        </div>
        <!-- SIDEBAR CONTAINER -->
        <div class="sidebar-container style-scroll-dark">
            <!-- SIDEBAR PROFILE -->
            <div class="sidebar-profile border-fade">
                <!-- SIDEBAR PROFILE IMG -->
                <div class="d-flex align-items-center">
                    @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                        <img src="{{ auth::user()->profile_photo_url }}" alt="{{ auth::user()->name }}" class="img-fluid img-thumbnail sidebar-profile-img" />
                    @else
                        <img src="{{ asset('backend/assets/img/profile/male.jpg') }}"
                             class="img-fluid img-thumbnail sidebar-profile-img" />
                    @endif
                </div>
                <!-- SIDEBAR PROFILE INFO -->
                <div class="sidebar-profile-info">
                    <h6>{{ auth()->user()->name }}</h6>
                    <!-- SIDEBAR ACTIONS -->
                    <div class="sidebar-actions">
                        <a href="{{ route('admin.profile') }}" class="keep"><i class="material-icons">person_outline</i></a>
                        <a href="javascript:void(0)" ><i class="material-icons" class="m-icon">mail_outline</i></a>
                        <a href="javascript:void(0)"><i class="material-icons">notifications_none</i></a>
                        <a href="{{ route('admin.settings.index') }}"><i class="material-icons" class="m-icon">settings</i></a>
                    </div>
                </div>
            </div>
            <!-- SIDEBAR NAV -->
            <ul class="sidebar-nav">
                <!-- NAV ITEM -->
                <li class="nav-item {{ request()->is('admin/dashboard') ?'active':'' }}">
                    <a href="{{ route('admin.dashboard') }}" class="nav-link">
                        <i class="material-icons">{{ __('dashboard') }}</i>
                        <span class="link-text">{{ __('dashboard') }}</span>
                    </a>
                </li>
                <!-- NAV ITEM E-COMMERCE -->
                <li class="nav-item has-dropdown {{ request()->is('admin/e-commerce*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="material-icons">store</i>
                        <span class="link-text">ecomerce</span>
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.e-commerce.category.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">Product {{ __('Categories') }}</span></a></li>
                        <li><a href="{{ route('admin.e-commerce.product.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('product') }}</span></a></li>
                        <li><a href="javascript:void(0)" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Orders') }}</span></a></li>
                    </ul>
                </li>
                <!-- NAV ITEM CUSTOMERS-->
                <li class="nav-item {{ request()->is('admin/customer*') ?'active':'' }}">
                    <a href="{{ route('admin.customer.index') }}" class="nav-link">
                        <i class="material-icons">sentiment_satisfied_alt</i>
                        <span class="link-text">{{ __('Customers') }}</span>
                    </a>
                </li>
                <!-- NAV ITEM SUPPLIERS-->
                <li class="nav-item {{ request()->is('admin/supplier*') ?'active':'' }}">
                    <a href="{{ route('admin.supplier.index') }}" class="nav-link">
                        <i class="material-icons">view_compact</i>
                        <span class="link-text">{{ __('Suppliers') }}</span>
                    </a>
                </li>
                <!-- NAV DIVIDER -->
                <li class="nav-divider"></li>
                <!-- NAV ITEM SETTINGS -->
                <li class="nav-item has-dropdown {{ request()->is('admin/settings*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="material-icons">settings</i>
                        <span class="link-text">{{ __('Settings') }}</span>{{ __('') }}
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.settings.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('General Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.smtp') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('SMTP Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.sms') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('SMS Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.api') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('API Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.social-media-link') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Social Media Link Settings') }}</span></a></li>
                    </ul>
                </li>
                <!-- NAV DIVIDER -->
                <li class="nav-divider"></li>
                <!-- NAV ITEM slider-->
                <li class="nav-item has-dropdown {{ request()->is('admin/slider*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="fas fa-toolbox"></i>
                        <span class="link-text">{{ __('Widget') }}</span>{{ __('') }}
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.slider.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Sliders') }}</span></a></li>
                    </ul>
                </li>
                <!-- NAV ITEM BLOG -->
                <li class="nav-item has-dropdown {{ request()->is('admin/blog*') ?'active':'' }}">
                    <a href="javascript:void(0)" class="nav-link">
                        <i class="fas fa-blog"></i>
                        <span class="link-text">{{ __('Blogs') }}</span>
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.blog.category.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Categories') }}</span></a></li>
                        <li><a href="{{ route('admin.blog.post.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Posts') }}</span></a></li>
                        <li><a href="{{ route('admin.blog.comment-settings') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Comment Settings') }}</span></a></li>
                    </ul>
                </li>

                <!-- NAV ITEM -->
{{--                <li class="nav-item"><a href="card.html" class="nav-link"><i class="material-icons">style</i><span class="link-text">card</span></a></li>--}}
            </ul>
        </div>
    </div>
</div>
