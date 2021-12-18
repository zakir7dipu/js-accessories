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
                    <div class="row">
                        @if (Laravel\Fortify\Features::canUpdateProfileInformation())
                            <div class="col-12">
                                @include('forntend.auth.profile.update-profile-information-form')
                            </div>
                        @endif

                        @if (Laravel\Fortify\Features::enabled(Laravel\Fortify\Features::updatePasswords()))
                            <div class="col-12">
                                @include('forntend.auth.profile.update-password-form')
                            </div>
                        @endif

                        @if (Laravel\Jetstream\Jetstream::hasAccountDeletionFeatures())
                            <div class="col-12">
                                @include('forntend.auth.profile.delete-user-form')
                            </div>
                        @endif
                    </div>
                </div>
                @include('forntend.auth.menu')
            </div>
        </div>
    </main>
@endsection

@section('page-script')
    @include('backend.pages.profile.internal-assets.js.profile-page-scripts')
    <script src="{{ asset('backend/assets/js/form-summerNote.js') }}"></script>
@endsection
