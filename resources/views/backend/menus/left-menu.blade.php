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
{{--            <a href="javascript:void(0);" class="sidebar-close d-md-none"  data-toggle="class" data-target="#wrapper" toggle-class="toggled">--}}
{{--                <i class="material-icons icon-sm">close</i>--}}
{{--            </a>--}}
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
                        <a href="{{ route('admin.contact-message.index') }}" ><i class="material-icons" class="m-icon">mail_outline</i></a>
                        <a href="{{ route('admin.settings.index') }}"><i class="material-icons" class="m-icon">settings</i></a>
                    </div>
                </div>
            </div>
            <!-- SIDEBAR NAV -->
            <ul class="sidebar-nav">
                <!-- NAV dashboard -->
                <li class="nav-item {{ request()->is('admin/dashboard') ?'active':'' }}">
                    <a href="{{ route('admin.dashboard') }}" class="nav-link">
                        <i class="material-icons">{{ __('dashboard') }}</i>
                        <span class="link-text">{{ __('dashboard') }}</span>
                    </a>
                </li>

                <!-- NAV ITEM E-COMMERCE -->
                @can('ecommerce')
                <li class="nav-item has-dropdown {{ request()->is('admin/e-commerce*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="material-icons">store</i>
                        <span class="link-text">ecomerce</span>
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.e-commerce.category.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">Product {{ __('Categories') }}</span></a></li>
                        <li><a href="{{ route('admin.e-commerce.product.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('product') }}</span></a></li>
                        <li><a href="{{ route('admin.e-commerce.order.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Orders') }}</span></a></li>
                    </ul>
                </li>
                @endcan
                <!-- NAV ITEM CUSTOMERS-->
                @can('customers')
                <li class="nav-item {{ request()->is('admin/customer*') ?'active':'' }}">
                    <a href="{{ route('admin.customer.index') }}" class="nav-link">
                        <i class="material-icons">sentiment_satisfied_alt</i>
                        <span class="link-text">{{ __('Customers') }}</span>
                    </a>
                </li>
                @endcan
                <!-- NAV ITEM SUPPLIERS-->
                @can('suppliers')
                <li class="nav-item {{ request()->is('admin/supplier*') ?'active':'' }}">
                    <a href="{{ route('admin.supplier.index') }}" class="nav-link">
                        <i class="material-icons">view_compact</i>
                        <span class="link-text">{{ __('Suppliers') }}</span>
                    </a>
                </li>
                @endcan
                <!-- NAV DIVIDER -->
                <li class="nav-divider"></li>
                <!-- NAV SETTINGS -->
                @can('settings')
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
                        <li><a href="{{ route('admin.settings.order-index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Order Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.payment.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Payment Settings') }}</span></a></li>
                        <li><a href="{{ route('admin.settings.user.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('User') }}</span></a></li>
                    </ul>
                </li>
                @endcan
                <!-- NAV DIVIDER -->
                <li class="nav-divider"></li>
                <!-- NAV ITEM widget-->
                @can('widget')
                <li class="nav-item has-dropdown {{ request()->is('admin/widget.*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="fas fa-toolbox"></i>
                        <span class="link-text">{{ __('Widget') }}</span>{{ __('') }}
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.widget.slider.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Sliders') }}</span></a></li>
                        <li><a href="{{ route('admin.widget.feature-products.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Feature Products Section') }}</span></a></li>
                        <li><a href="{{ route('admin.widget.category-section.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Category Section') }}</span></a></li>
                        <li><a href="{{ route('admin.widget.new-arrival.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('New Arrival Section') }}</span></a></li>
                        <li><a href="{{ route('admin.widget.filter-gallery.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Filter Gallery Section') }}</span></a></li>
                        <li><a href="{{ route('admin.widget.info-section.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Info Section') }}</span></a></li>
                    </ul>
                </li>
                @endcan
                <!-- NAV ITEM advertisement-->
                @can('advertisement')
                <li class="nav-item has-dropdown {{ request()->is('admin/advertisement.*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="fab fa-adversal"></i>
                        <span class="link-text">{{ __('advertisement') }}</span>{{ __('') }}
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        <li><a href="{{ route('admin.advertisement.index') }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ __('Advertising layouts') }}</span></a></li>
                    </ul>
                </li>
                @endcan
                <!-- NAV ITEM pages-->
                @can('pages')
                <li class="nav-item has-dropdown {{ request()->is('admin/advertisement.*') ?'active':'' }}">
                    <a href="javascript:void(0);" class="nav-link">
                        <i class="fas fa-file-alt"></i>
                        <span class="link-text">{{ __('pages') }}</span>{{ __('') }}
                        <span class="badge badge-md"><span class="material-icons h6" >chevron_right</span></span>
                    </a>
                    <ul class="dropdown-list">
                        @foreach($pages as $page)
                            <li><a href="{{ route('admin.page.index', $page->id) }}" class="nav-link"> <i class="material-icons">chevron_right</i> <span class="link-text">{{ $page->name  }}</span></a></li>
                        @endforeach
                    </ul>
                </li>
                @endcan
                <!-- NAV ITEM BLOG -->
                @can('blog')
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
                @endcan
                <!-- NAV ITEM -->
{{--                <li class="nav-item"><a href="card.html" class="nav-link"><i class="material-icons">style</i><span class="link-text">card</span></a></li>--}}
            </ul>
        </div>
    </div>
</div>
