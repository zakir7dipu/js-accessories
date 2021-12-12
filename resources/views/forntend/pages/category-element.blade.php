@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main">
        <div class="banner d-lg-block d-sm-none" style="background-image: url({{ asset($advertise->image) }}); background-size: cover; background-position: center;">
            <div class="container">
                <div class="banner-content">
                    <h2 class="banner-subtitle text-left">{{ $advertise->line1 }}</h2>
                    <h1 class="banner-title text-left">
                        {{ $advertise->title }}
                    </h1>
                    <h2 class="banner-foot text-left"><span>{{ $advertise->line2 }}</span></h2>
                </div><!-- End .banner-content -->
            </div>
        </div><!-- End .banner -->

        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                    {!! $category->parentCategory?'<li class="breadcrumb-item"><a href="'.route('category-elements',$category->parentCategory->slug).'">'.$category->parentCategory->name.'</a></li>':'' !!}

                    <li class="breadcrumb-item active" aria-current="page">{{ $category->name }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container mt-4">
            @if($category->parentCategory)
                @if($category->childCategory()->count() > 0)
                    @include('forntend.pages.page-sections.child-category-section')
                @endif

                <nav class="toolbox horizontal-filter filter-sorts">
                    <div class="filter-toggle">
                        <span>Filters:</span>
                        <a href=#>&nbsp;</a>
                    </div>

                    <div class="sidebar-overlay"></div>
                    <aside class="toolbox-left sidebar-shop mobile-sidebar">
                        @if(count($allSizes) > 0)
                            <div class="toolbox-item toolbox-sort select-custom">
                                <a class="sort-menu-trigger" href="#">Size</a>
                                <ul class="sort-list">
                                    @foreach($allSizes as $size)
                                        <li class="attributeItem">{{ $size }}</li>
                                    @endforeach
                                </ul>
                            </div><!-- End .toolbox-item -->
                        @endif

                        @if(count($allColors))
                            <div class="toolbox-item toolbox-sort select-custom">
                                <a class="sort-menu-trigger" href="#">Color</a>
                                <ul class="sort-list">
                                    @foreach($allColors as $color)
                                        <li class="attributeItem">{{ $color }}</li>
                                    @endforeach
                                </ul>
                            </div><!-- End .toolbox-item -->
                        @endif

                        <div class="toolbox-item toolbox-sort price-sort select-custom">
                            <a class="sort-menu-trigger" href="#">Price</a>
                            <form action="{{ route('search.price') }}" method="get" class="filter-price-form">
                                <div>Price: <span>{{ $products->min('price') }}</span> — <span>{{ $products->max('price') }}</span></div>
                                <label>Min price</label>
                                <input type="hidden" name="quarry_element" value="{{ $category->id }}">
                                <input type="number" step="0.01" class="input-price" name="min_price"/>
                                <label>Max price</label>
                                <input type="number" step="0.01" class="input-price" name="max_price"/>
                                <div class="filter-price-action mt-0">
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </div>
                            </form>
                        </div><!-- End .toolbox-item -->
                            <form action="{{ route('search.attribute') }}" method="get" class="d-none" id="searchByAttributeBox">
                                <input type="hidden" name="quarry_string">
                                <input type="hidden" name="quarry_element" value="{{ $category->id }}">
                            </form>

                    </aside><!-- End .toolbox-left -->

                    <div class="toolbox-item toolbox-sort">
                        <div class="select-custom">
                            <form action="{{ route('search.feature') }}" method="get" id="searchByFeatureBox" class="form-inline mb-0">
                                <input type="hidden" name="quarry_element" value="{{ $category->id }}">
                            <select name="orderby" class="form-control">
                                @foreach($productFeatures as $item)
                                    <option {{ request()->orderby === $item?'selected':'' }}>{{ $item }}</option>
                                @endforeach
                            </select>
                            </form>
                        </div><!-- End .select-custom -->
                    </div><!-- End .toolbox-item -->

                    <div class="toolbox-item ml-lg-auto">
                        <div class="toolbox-item toolbox-show show-count">
                            <label>{{ __('Showing ').(count($products) > 12 ? '12':count($products)).__(' of ').count($products).__(' results') }}</label>
                        </div><!-- End .toolbox-item -->
                    </div>
                </nav>

                @include('forntend.pages.page-sections.produt-section')

                <nav class="toolbox toolbox-pagination">

                    <div class="toolbox-item toolbox-show">
                        <label>{{ __('Showing ').(count($products) > 12 ? '12':count($products)).__(' of ').count($products).__(' results') }}</label>
                    </div><!-- End .toolbox-item -->



                    <ul class="pagination">
                        {{ $products->links() }}
                    </ul>
                </nav>
                @else
                @include('forntend.pages.page-sections.child-category-section')
            @endif
        </div><!-- End .container -->

        <div class="mb-5"></div><!-- margin -->
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
