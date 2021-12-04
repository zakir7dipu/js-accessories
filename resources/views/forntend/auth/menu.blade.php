<aside class="sidebar col-lg-3">
    <div class="widget widget-dashboard">
        <h3 class="widget-title">{{ Auth::user()->name }}</h3>

        <ul class="list">
            <li class="active"><a href="{{ route('client.dashboard') }}">{{ __('Dashboard') }} </a></li>
            <li><a href="#">Account Information</a></li>
            <li><a href="#">Address Book</a></li>
            <li><a href="#">My Orders</a></li>
            <li><a href="#">Billing Agreements</a></li>
            <li><a href="#">Recurring Profiles</a></li>
            <li><a href="#">My Product Reviews</a></li>
            <li><a href="#">My Tags</a></li>
            <li><a href="#">My Wishlist</a></li>
            <li><a href="#">My Applications</a></li>
            <li><a href="#">Newsletter Subscriptions</a></li>
            <li><a href="#">My Downloadable Products</a></li>
            <li>
                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                document.getElementById('logOutForm').submit();">
                    {{ __('Logout') }}
                    <form action="{{ route('logout') }}" method="post" id="logOutForm">
                        @csrf
                    </form>
                </a>
            </li>
        </ul>
    </div><!-- End .widget -->
</aside><!-- End .col-lg-3 -->
