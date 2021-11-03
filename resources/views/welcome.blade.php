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

        @if($categorySection?$categorySection->show:'')
            @include('forntend.pages.page-sections.categories')
        @endif

        @include('forntend.pages.advertisements.layout1')

        @if($newArrivalSection?$newArrivalSection->show:'')
            @include('forntend.pages.page-sections.new-arrivals')
        @endif

        @if($productFilterGallerySection?$productFilterGallerySection->show:'')
            @include('forntend.pages.page-sections.product-filter-gallery')
        @endif

        @include('forntend.pages.advertisements.layout2')

        @if($infoSection->count() > 0)
            @include('forntend.pages.page-sections.infosection')
        @endif
        @include('forntend.pages.page-sections.top-brands')
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
