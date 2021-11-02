@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main home">
        @if($sliders->count() > 0)
            @include('forntend.pages.page-sections.slider')
        @endif

        @if($featureProductSection?$featureProductSection->show:'')
            @include('forntend.pages.page-sections.feature-product')
        @endif
        @include('forntend.pages.page-sections.categories')
        @include('forntend.pages.advertisements.layout1')
        @include('forntend.pages.page-sections.new-arrivals')
        @include('forntend.pages.page-sections.product-filter-gallery')
        @include('forntend.pages.page-sections.top-products')
        @include('forntend.pages.page-sections.top-brands')
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
