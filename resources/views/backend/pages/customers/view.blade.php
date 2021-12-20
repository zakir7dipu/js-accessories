@extends('backend.layouts.master-layout')

@section('title', $title)

@section('page-css')

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
                            <div class="col-md-6 col-sm-12">
                                <h6 class="card-title lh-35">{{ __($title) }}</h6>
                            </div>
                            <div class="col-md-6 col-sm-12 text-right">
{{--                                <a href="{{ route('admin.supplier.create') }}" class="btn btn-danger btn-sm rounded"><i class="material-icons">add</i></a>--}}
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="row my-5">
                                    <div class="col-4">
                                        @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())

                                            <img class="rounded-circle" width="150" src="{{ $customer->profile_photo_url }}" alt="{{ $customer->name }}" />
                                        @else
                                            <img src="{{ asset('backend/assets/img/profile/male.jpg')  }}" class="rounded-circle " width="150">
                                        @endif
                                    </div>
                                    <div class="col-8">
                                        {!! $customer->name.'</br> -> '.'Email: '.$customer->email.($customer->profile?'</br> -> Phone'.$customer->profile->phone.'</br> -> Company: '.$customer->profile->company_name.'</br> -> Designation'.$customer->profile->designation:'') !!}
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="table-responsive style-scroll">
                                    <table id="slider" class="table dac_table table-striped table-bordered miw-500" cellspacing="0" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="5%">{{__('SL')}}</th>
                                            <th>{{__('Company')}}</th>
                                            <th>{{__('Name')}}</th>
                                            <th>{{__('Phone')}}</th>
                                            <th>{{__('Email')}}</th>
                                            <th>{{__('Designation')}}</th>
                                            <th width="10%">{{__('Options')}}</th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('page-script')

@endsection
