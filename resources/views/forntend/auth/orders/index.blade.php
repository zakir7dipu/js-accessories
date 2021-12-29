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
                    <div class="mb-4"></div><!-- margin -->
                    @if(count($orders) > 0)
                        <table class="table table-responsive table-striped table-hover dac_table" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>{{ __('Sl No.') }}</th>
                                <th>{{ __('Invoice No') }}</th>
                                <th>{{ __('Products') }}</th>
                                <th>{{ __('Payment') }}</th>
                                <th>{{ __('Receipt') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($orders as $key => $order)
                                <tr>
                                    <th>{{ $key+1 }}</th>
                                    <th>{{ $order->invoice }}</th>
                                    <th>
                                        <table class="w-100 table-hover">
                                            @foreach($order->product as $key => $product)
                                                <tr class="border border-light">
                                                    @if($product->product)
                                                        <td>{!! $product->product->name.'</br> -> '.(strlen(trim($product->specification)) > 0?$product->specification.'</br> -> ':'').$product->qty.' '.$product->product->unit_name.'</br> -> '.$product->product->currency->symbol.' '.$product->price_qty !!}</td>
                                                    @else
                                                        <td>
                                                            {{ __('Product was deleted by admin...') }}
                                                        </td>
                                                    @endif
                                                </tr>

                                            @endforeach
                                        </table>
                                    </th>
                                    <td class="text-center">
                                        {!! $order->payment_status?'<p class="badge badge-success">Payed</p>':($order->payment != 'Cash on delivery'?'<p class="badge badge-danger">Not paid yet</p>':'<p class="badge badge-warning">Cash on delivery</p>') !!}
                                    </td>
                                    <td>
                                        @if($order->order_status === 0)
                                            <p class="badge badge-danger">{{ __('Canceled') }}</p>
                                        @elseif($order->order_status === 1)
                                            <p class="badge badge-warning">{{ __('Pending') }}</p>
                                        @elseif($order->order_status === 2)
                                            <p class="badge badge-primary">{{ __('Approved') }}</p>
                                        @elseif($order->order_status === 3)
                                            <p class="badge badge-info">{{ __('Process to delivery') }}</p>
                                        @elseif($order->order_status === 4)
                                            <p class="badge badge-success">{{ __('Delivered') }}</p>
                                        @endif

                                        <a href="{{ route('invoice',$order->id) }}" target="_blank">
                                            <button type="button" class="btn btn-success btn-sm rounded">{{ __('View')  }}</button>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    @else
                        <h4 class="text-center">{{ __('No order placed yet.') }}</h4>
                    @endif
                </div><!-- End .col-lg-9 -->

                @include('forntend.auth.menu')
            </div><!-- End .row -->
        </div>
    </main><!-- End .main -->
@endsection

@section('page-script')
    <!-- DATA TABLES -->
    <script src="{{ asset('backend/assets/plugin/DataTables/1.10.16/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('backend/assets/plugin/DataTables/1.10.16/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{asset('backend/assets/js/tables-datatable.js')}}"></script>
@endsection
