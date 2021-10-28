@extends('backend.layouts.master-layout')

@section('title', $title)

@section('page-css')

@endsection

@section('content')
    <div id="wrapper-content">
        <div class="row">
            <div class="col">
                <nav class="breadcrumb justify-content-sm-start justify-content-center text-center text-light bg-dark ">
                    <a class="breadcrumb-item text-white" href="{{ route('admin.dashboard') }}">{{__('Home')}}</a>
                    <span class="breadcrumb-item active text-capitalize">{{__($title)}}</span>
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
                                <h6 class="card-title">{{__($title)}}</h6>
                            </div>
                            <div class="col-md-6 col-sm-12 text-right">
                                <a href="{{ route('admin.e-commerce.product.create') }}" class="btn btn-danger btn-sm rounded"> <i class="material-icons">add</i></a>
                            </div>
                        </div>

                    </div>
                    <div class="card-body ">
                        <div class="table-responsive style-scroll">

                            <table class="table table-striped table-bordered miw-500 dac_table" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="5%">{{__('SL No.')}}</th>
                                    <th>{{__('Image')}}</th>
                                    <th>{{__('Name')}}</th>
                                    <th>{{__('Price')}}</th>
                                    <th class="text-center">{{__('Status')}}</th>
                                    <th class="text-center">{{__('Featured')}}</th>
                                    <th class="text-center">{{__('New Arrival')}}</th>
                                    <th class="text-center">{{__('Popular')}}</th>
                                    <th class="text-center">{{__('Bestseller')}}</th>
                                    <th class="text-center">{{__('Trending')}}</th>
                                    <th class="text-center">{{__('Option')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($products as $key => $data)
                                    <tr>
                                        <th>{{ $key+1 }}</th>
                                        <td>
                                            <img src="{{ $data->productImages? asset($data->productImages()->first()->image):'' }}" class="img-fluid img-thumbnail rounded w-50" alt="Product\'s Image">
                                        </td>
                                        <td>{{ $data->name }}</td>
                                        <td>{!! ($data->currency?'<span>'.$data->currency->symbol.'</span>':'').'&nbsp;'.'<span>'.number_format($data->price,'2','.',',').'</span>' !!}</td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->status?'checked':'' }} datatype="status" datasrc="{{ $data->id }}" class="ecommerceProductActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->featured?'checked':'' }} datatype="featured" datasrc="{{ $data->id }}" class="ecommerceFeaturedActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->new_arrival?'checked':'' }} datatype="new_arrival" datasrc="{{ $data->id }}" class="ecommerceNewArrivalActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->popular?'checked':'' }} datatype="popular" datasrc="{{ $data->id }}" class="ecommercePopularActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->bestseller?'checked':'' }} datatype="bestseller" datasrc="{{ $data->id }}" class="ecommerceBestsellerActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <label class="switch">
                                                <input type="checkbox" {{ $data->trending?'checked':'' }} datatype="trending" datasrc="{{ $data->id }}" class="ecommerceTrendingActivationBtn">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td class="text-center">
                                            <a href="javascript:void(0)" class="btn btn-success  btn-circle m-1" >
                                                <i class="material-icons">remove_red_eye</i>
                                            </a>
                                            <a href="{{ route('admin.e-commerce.product.edit',$data->id) }}" class="btn btn-info  btn-circle m-1" >
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="javascript:void(0)" title="Delete"  class="btn btn-danger btn-circle deleteProductBtn m-1">
                                                <i class="material-icons">delete</i>
                                                <form action="{{ route('admin.e-commerce.product.destroy',$data->id) }}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                </form>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('page-script')
    <script src="{{asset('backend/assets/js/tables-datatable.js')}}"></script>
    @include('backend.pages.e-commerce.products.internal-assets.product-js')
@endsection
