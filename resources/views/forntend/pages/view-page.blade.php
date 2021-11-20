@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main">
        <div class="banner d-none" style="background-image: url({{ asset($advertise->image) }}); background-size: cover; background-position: center;">
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
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
