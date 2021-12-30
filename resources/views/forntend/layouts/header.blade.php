<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>@yield('title')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="keywords" content="{{ $generalSettings->meta_keyword?$generalSettings->meta_keyword:'' }}" />
    <meta name="description" content="{{ $generalSettings->meta_description?$generalSettings->meta_description:'' }}">
    <meta name="author" content="{{ __('zakir7dipu') }}">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ $generalSettings->favicon? asset($generalSettings->favicon):asset('forntend/assets/images/icons/favicon.ico') }}">


    <script type="text/javascript">
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800','Poppins:300,400,500,600,700', 'Oswald:400,700' ] }
        };
        (function(d) {
            var wf = d.createElement('script'), s = d.scripts[0];
            wf.src = '{{ asset('forntend/assets/js/webfont.js') }}';
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
        })(document);
    </script>
    <!-- IMAGE UPLOADER -->
    <link rel="stylesheet" href="{{asset('backend/assets/css/image-uploader.min.css')}}" />
    <!-- toastr alert -->
    <link rel="stylesheet" href="{{asset('notification_assets/css/toastr.min.css')}}" />
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="{{ asset('forntend/assets/css/bootstrap.min.css') }}">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="{{ asset('backend/assets/css/all.min.css') }}">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="{{ asset('forntend/assets/css/'.$themeColors[config('app.theme_color','1')].'-theme/style.min.css') }}">
    <!-- Whatsapp Chat Bot -->
    @if($whatsAppChatBot)
        <link rel="stylesheet" href="{{ asset('social-share/whatsapp/floating-wpp.min.css') }}">
    @endif
    @yield('page-css')
</head>
