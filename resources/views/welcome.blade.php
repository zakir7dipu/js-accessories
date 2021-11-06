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

        @if($advertiseGroup1->count() == 2)
            @include('forntend.pages.advertisements.layout1')
        @endif

        @if($newArrivalSection?$newArrivalSection->show:'')
            @include('forntend.pages.page-sections.new-arrivals')
        @endif

        @if($productFilterGallerySection?$productFilterGallerySection->show:'')
            @include('forntend.pages.page-sections.product-filter-gallery')
        @endif

        @if($advertiseGroup2->count() == 2)
            @include('forntend.pages.advertisements.layout2')
        @endif

        @if($infoSection->count() > 0 && ($generalSettings?($generalSettings->info_section_show?true:false):false))
            @include('forntend.pages.page-sections.infosection')
        @endif

        @if($suppliers->count() > 0)
            @include('forntend.pages.page-sections.top-brands')
        @endif
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
