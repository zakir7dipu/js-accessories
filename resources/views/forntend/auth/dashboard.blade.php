@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ $title }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container my-5">
            <div class="row">
                <div class="col-lg-9 order-lg-last dashboard-content">
                    <h2>{{ $title }}</h2>

                    @if (!empty($success))
                    <div class="alert alert-success text-center" role="alert">
                        <strong>{{ $success }}</strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div><!-- End .alert -->
                    @endif

                    @if($registrationTime > time())
                        <div class="alert alert-success alert-intro" role="alert">
                            {{ __('Thank you for registering with') }} <strong>{{ config('app.name') }}</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div><!-- End .alert -->
                    @endif

                    <div class="mb-4"></div><!-- margin -->
                </div><!-- End .col-lg-9 -->

                @include('forntend.auth.menu')
            </div><!-- End .row -->
        </div>
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
