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
                        <div class="row">
                            <div class="col-7">
                                <h6 class="card-title lh-35">{{ __($title) }}</h6>
                            </div>
                            <div class="col-5 text-right">
                                <button type="button" class="btn btn-success btn-sm rounded"><i class="far fa-plus-square"></i></button>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            @foreach($advertisements as $key => $advertise)
                                <div class="col-md-6">
                                    <div class="card rounded empty-ad">
                                        <div class="card-body">
                                            <h2 class="text-black font-weight-bold">{{ $advertise->title }}</h2>
                                        </div>
                                    </div>
                                    <div class="card rounded ad-form d-none">
                                        <div class="card-header">
                                            <div class="col-6">
                                                <h5 class="text-black">{{ $advertise->title }}</h5>
                                            </div>
                                            <div class="col-6 text-right">
                                                <button type="button" class="btn btn-sm btn-danger rounded-circle ad-form-close"><i class="far fa-times-circle"></i></button>
                                            </div>
                                        </div>
                                        <form action="" method="post" enctype="multipart/form-data">
                                            @csrf

                                            <div class="card-body bg-dark">
                                                <div class="form-group">
                                                    <p class="mb-1 font-weight-bold"><label for="description">{{__('Advertise Image :')}}</label> &nbsp;<sup><i class="text-danger fas fa-star-of-life small"></i></sup> &nbsp; <code>{{ __('Expected Image size will be 64px x 64px') }}</code></p>
                                                    <div class="form-row">
                                                        <div class="col-4" style="display: flex; justify-content: center; align-content: center;">
                                                            @if($advertise->image)
                                                                <div class="input-group p-3" style="display: flex; justify-content: center; align-content: center;">
                                                                    <div class="form-group w-100" style="display: flex; justify-content: center; align-content: center;">
                                                                        <div class="px-2" style="display: flex; justify-content: center; align-content: center;">
                                                                            <img src="{{ asset($advertise->image) }}" class="img-fluid img-thumbnail" alt="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        </div>
                                                        <div class="col-8">
                                                            <div class="input-group p-3">
                                                                <div class="form-group w-100">
                                                                    <div class="px-2">
                                                                        <div class="{{ 'advertise_img'.$key }}" id="{{ 'advertise_img'.$key }}">
                                                                            <div class="{{ 'input-images'.$key }}"></div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <p class="mb-1">{{__('Title')}}: <sup><i class="fas fa-star-of-life text-danger"></i></sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="title" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement Title')}}" value="{{ $advertise?$advertise->title:old('title') }}">
                                                    <br>
                                                    @if ($errors->has('title'))
                                                        <span class="text-danger">{{ $errors->first('title') }}</span>
                                                    @endif
                                                </div>

                                                <p class="mb-1">{{__('Line 1')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="line1" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement Line 1')}}" value="{{ $advertise?$advertise->line1:old('line1') }}">
                                                    <br>
                                                    @if ($errors->has('line1'))
                                                        <span class="text-danger">{{ $errors->first('line1') }}</span>
                                                    @endif
                                                </div>

                                                <p class="mb-1">{{__('Line 2')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="line2" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement Line 2')}}" value="{{ $advertise?$advertise->line2:old('line2') }}">
                                                    <br>
                                                    @if ($errors->has('line2'))
                                                        <span class="text-danger">{{ $errors->first('line2') }}</span>
                                                    @endif
                                                </div>

                                                <p class="mb-1">{{__('Line 3')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="line3" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement Line 3')}}" value="{{ $advertise?$advertise->line3:old('line3') }}">
                                                    <br>
                                                    @if ($errors->has('line3'))
                                                        <span class="text-danger">{{ $errors->first('line3') }}</span>
                                                    @endif
                                                </div>

                                                <p class="mb-1">{{__('Button Text')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="btn_text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement button text')}}" value="{{ $advertise?$advertise->btn_text:old('btn_text') }}">
                                                    <br>
                                                    @if ($errors->has('btn_text'))
                                                        <span class="text-danger">{{ $errors->first('btn_text') }}</span>
                                                    @endif
                                                </div>

                                                <p class="mb-1">{{__('Button URL')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="input-group input-group-lg mb-3">
                                                    <input type="text" name="btn_url" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                                           placeholder="{{__('Advertisement button url')}}" value="{{ $advertise?$advertise->btn_url:old('btn_url') }}">
                                                    <br>
                                                    @if ($errors->has('btn_url'))
                                                        <span class="text-danger">{{ $errors->first('btn_url') }}</span>
                                                    @endif
                                                </div>
                                                <p class="mb-1">{{__('Status')}}: <sup>{{ "( ".__('Optional')." )" }}</sup></p>
                                                <div class="form-group">
                                                    <label class="switch">
                                                        <input type="checkbox" {{ $advertise->status?'checked':'' }}>
                                                        <span class="slider round"></span>
                                                    </label>
                                                </div>
                                                <div class="form-group text-center">
                                                    <button type="submit" class="btn btn-danger btn-lg rounded w-50">{{ __('Save') }}</button>
                                                </div>
                                            </div>
                                        </form>
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
