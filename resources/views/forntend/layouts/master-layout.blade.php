<!DOCTYPE html>
<html lang="en">
@include('forntend.layouts.header')
<body>
<div class="page-wrapper">
   @include('forntend.menus.header-menu')

    @yield('content')

    @include('forntend.layouts.footer')
</div><!-- End .page-wrapper -->

@include('forntend.layouts.globel-modal')

<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

@include('forntend.layouts.scripts')
@include('backend.layouts.toster-script')
</body>
</html>
