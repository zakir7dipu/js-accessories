@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main">
        <div class="banner" style="background-image: url({{ asset($advertise->image) }}); background-size: cover; background-position: center;">
            <div class="container">
                <div class="banner-content">
                    <h2 class="banner-subtitle text-left">{{ $advertise->line1 }}</h2>
                    <h1 class="banner-title text-left">
                        {{ $advertise->title }}
                    </h1>
                    <h2 class="banner-foot text-left"><span>{{ $advertise->line2 }}</span></h2>
                </div><!-- End .banner-content -->
            </div>
        </div><!-- End .banner -->

        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ $page->name }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="about-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="subtitle">{{ $overview?$overview->title:'' }}</h2>
                        <p>{!! $overview?$overview->content:'' !!}</p>
                    </div><!-- End .col-lg-12 -->
                </div><!-- End .row -->
            </div><!-- End .container -->
        </div><!-- End .about-section -->

        <div class="company-section">
            <div class="container">
                <div class="row align-items-lg-center">
                    @if($about_img)
                    <div class="col-md-6">
                        <img src="{{ asset($about_img->content) }}" alt="image">
                    </div><!-- End .col-lg-6 -->
                    @endif

                    <div class="col-md-6 padding-left-lg">
                        @if($mission)
                            <h3 class="subtitle">{{ $mission?$mission->title:'' }}</h3>
                            <p>{!! $mission?$mission->content:'' !!}</p>
                        @endif

                        @if($vision)
                            <h3 class="subtitle">{{ $vision?$vision->title:'' }}</h3>
                            <p>{!! $vision?$vision->content:'' !!}</p>
                        @endif
                    </div><!-- End .col-lg-6 -->
                </div><!-- End .row -->
            </div><!-- End .container -->
        </div><!-- End .company-section -->
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
