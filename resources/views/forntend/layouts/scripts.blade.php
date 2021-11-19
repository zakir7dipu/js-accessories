<!-- Plugins JS File -->
<script src="{{ asset('forntend/assets/js/jquery.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/plugins.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/jquery.countdown/jquery.countdown.min.js') }}"></script>
<!-- toastr alert -->
<script src="{{asset('notification_assets/js/toastr.min.js')}}"></script>
<!-- Main JS File -->
<script src="{{ asset('forntend/assets/js/main_init.min.js') }}"></script>
<script src="{{ asset('forntend/assets/js/main.min.js') }}"></script>
@yield('page-script')
<script>
    (function ($) {
        "use script";
        $('[data-toggle="tooltip"]').tooltip()
    })(jQuery)
</script>

