@extends('backend.layouts.master-layout')

@section('title', $title)

@section('page-css')
    <style>
        .empty-ad{
            background-image: url({{ asset('upload/settings/empty-add.jpg') }});
            background-size: cover;
            background-position: center;
            height: 300px;
            opacity: 0.9;
            cursor: pointer;
            transition: 0.5s;
        }
        .empty-ad:hover{
            transition: 0.5s;
            opacity: 1;
        }
        .empty-ad .card-body{
            justify-content: center;
            align-items: center;
            display: flex;
        }
    </style>
@endsection

@section('content')

    <div id="wrapper-content">
        <div class="row">
            <div class="col">
                <nav class="breadcrumb justify-content-sm-start justify-content-center text-center text-light bg-dark ">
                    <a class="breadcrumb-item text-white" href="{{route('admin.dashboard')}}">{{__('Home')}}</a>
                    <span class="breadcrumb-item active">{{ __($title) }}</span>
                    <span class="breadcrumb-info" id="time"></span>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card card-dark bg-dark">
                    <div class="card-header d-block">
                        <h6 class="card-title lh-35">{{ __($title) }}</h6>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            @foreach($advertisements as $advertise)
                                <div class="col-lg-4 col-md-6">
                                    <div class="card rounded empty-ad">
                                        <div class="card-body" style="">
                                            <h2 class="text-black font-weight-bold">{{ $advertise->title }}</h2>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('page-script')
    @include('backend.pages.advertisement-layouts.internal-assets.advertisement-layouts-js')
@endsection
