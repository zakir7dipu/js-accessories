<!-- Plugins JS File -->
<script src="{{ asset('forntend/assets/js/jquery.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/plugins.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/jquery.countdown/jquery.countdown.min.js') }}"></script>
<!-- toastr alert -->
<script src="{{asset('notification_assets/js/toastr.min.js')}}"></script>
<!-- shurjoPay -->
<script src="{{ asset('js/shurjoPay.js') }}"></script>
<!-- Wishlist js -->
<script type="module" src="{{ asset('forntend/assets/js/ecommerce-wishlist.js') }}"></script>
<!-- Cart js -->
<script type="module" src="{{ asset('forntend/assets/js/ecommerce-cart.js') }}"></script>
<!-- product search js -->
<script type="module" src="{{ asset('forntend/assets/js/product-search.js') }}"></script>
<!-- Subscription -->
<script type="module" src="{{ asset('forntend/assets/js/subscription.js') }}"></script>
<!-- IMAGE UPLOADER -->
<script src="{{asset('backend/assets/js/image-uploader.min.js')}}"></script>
<!-- Whatsapp Chat Bot -->
@if($whatsAppChatBot)
    <script src="{{ asset('social-share/whatsapp/floating-wpp.min.js') }}"></script>
    <script src="{{ asset('social-share/whatsapp/whatsapp-chat-bot.js') }}"></script>
@endif
<!-- Main JS File -->
<script src="{{ asset('forntend/assets/js/main_init.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/main.min.js') }}"></script>
@yield('page-script')

