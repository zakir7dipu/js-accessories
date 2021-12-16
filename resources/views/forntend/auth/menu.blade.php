<aside class="sidebar col-lg-3">
    <div class="widget widget-dashboard">
        <h3 class="widget-title">{{ Auth::user()->name }}</h3>

        <ul class="list">
            <li class="active"><a href="{{ route('client.dashboard') }}">{{ __('Dashboard') }} </a></li>
            <li><a href="javascript:void(0)">Account Information</a></li>
            <li><a href="javascript:void(0)">Address Book</a></li>
            <li><a href="{{ route('client.order.index') }}">My Orders</a></li>
            <li><a href="javascript:void(0)">My Downloadable Products</a></li>
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
