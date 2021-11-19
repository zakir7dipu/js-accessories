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
                    <li class="breadcrumb-item active" aria-current="page">{{ $page->name }}</li>
                </ol>
            </div><!-- End .container -->

            @if($map)
        </nav><div class="page-header">
            <div class="container">
                <h1>{{ ucwords($map->title) }}</h1>
            </div><!-- End .container -->
        </div><!-- End .page-header -->
        @endif

        <div class="container">
            @if($map)
            <iframe src="{{ $map->content }}" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            @endif

            <div class="row mt-5">
                <div class="col-md-8">
                    <h2 class="light-title">{{ __('Write') }} <strong>{{ __('Us') }}</strong></h2>

                    <form action="{{ route('contact-store') }}" method="post">
                        @csrf
                        @method('post')
                        <div class="form-group required-field">
                            <label for="contact-name">{{ __('Name') }}</label>
                            <input type="text" class="form-control" id="contact-name" name="contact-name" required value="{{ old('contact-name') }}">
                            @if ($errors->has('contact-name'))
                                <span class="text-danger">{{ $errors->first('contact-name') }}</span>
                            @endif
                        </div><!-- End .form-group -->

                        <div class="form-group required-field">
                            <label for="contact-email">{{ __('Email') }}</label>
                            <input type="email" class="form-control" id="contact-email" name="contact-email">
                        </div><!-- End .form-group -->

                        <div class="form-group">
                            <label for="contact-phone">{{ __('Phone Number') }}</label>
                            <input type="tel" class="form-control" id="contact-phone" name="contact-phone">
                        </div><!-- End .form-group -->

                        <div class="form-group required-field">
                            <label for="contact-message">{{ __('What’s on your mind?') }}</label>
                            <textarea cols="30" rows="1" id="contact-message" class="form-control" name="contact-message" required>{!! old('contact-message') !!}</textarea>
                            @if ($errors->has('contact-message'))
                                <span class="text-danger">{{ $errors->first('contact-message') }}</span>
                            @endif
                        </div><!-- End .form-group -->

                        <div class="form-footer">
                            <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
                        </div><!-- End .form-footer -->
                    </form>
                </div><!-- End .col-md-8 -->

                <div class="col-md-4">
                    <h2 class="light-title">{{ __('Contact') }} <strong>{{ __('Details') }}</strong></h2>

                    <div class="contact-info">
                        <div>
                            <i class="icon-phone"></i>
                            <h4 class="ml-5 pl-5 mb-0">{{ __('Phone') }}</h4>
                            <p><a href="tel:">{{ $contact->phone }}</a></p>
                        </div>
                        <div>
                            <i class="icon-mail-alt"></i>
                            <h4 class="ml-5 pl-5 mb-0">{{ __('Mail') }}</h4>
                            <p><a href="tel:">{{ $contact->email }}</a></p>
                        </div>
                        <div>
                            <i class="icon-home"></i>
                            <h4 class="ml-5 pl-5 mb-0">{{ __('Address') }}</h4>
                            <p><a href="tel:">{{ $contact->address }}</a></p>
                        </div>
                    </div><!-- End .contact-info -->
                </div><!-- End .col-md-4 -->
            </div><!-- End .row -->
        </div><!-- End .container -->

        <div class="mb-8"></div><!-- margin -->
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
