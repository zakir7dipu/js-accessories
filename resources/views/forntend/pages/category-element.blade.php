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
                        <div class="toolbox-item toolbox-sort select-custom">
                            <a class="sort-menu-trigger" href="#">Size</a>
                            <ul class="sort-list">
                                <li>Extra Large</li>
                                <li>Large</li>
                                <li>Medium</li>
                                <li>Small</li>
                            </ul>
                        </div><!-- End .toolbox-item -->

                        <div class="toolbox-item toolbox-sort select-custom">
                            <a class="sort-menu-trigger" href="#">Color</a>
                            <ul class="sort-list">
                                <li>Black</li>
                                <li>Blue</li>
                                <li>Brown</li>
                                <li>Green</li>
                                <li>Indigo</li>
                                <li>Light Blue</li>
                                <li>Red</li>
                                <li>Yellow</li>
                            </ul>
                        </div><!-- End .toolbox-item -->

                        <div class="toolbox-item toolbox-sort price-sort select-custom">
                            <a class="sort-menu-trigger" href="#">Price</a>
                            <form class="filter-price-form">
                                <div>Price: <span>$55.00</span> — <span>$111.00</span></div>
                                <label>Min price</label>
                                <input class="input-price" name="min_price"/>
                                <label>Max price</label>
                                <input class="input-price" name="max_price"/>
                                <div class="filter-price-action mt-0">
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </div>
                            </form>
                        </div><!-- End .toolbox-item -->

                    </aside><!-- End .toolbox-left -->

                    <div class="toolbox-item toolbox-sort">
                        <div class="select-custom">
                            <select name="orderby" class="form-control">
                                <option value="menu_order" selected="selected">Default sorting</option>
                                <option value="popularity">Sort by popularity</option>
                                <option value="rating">Sort by average rating</option>
                                <option value="date">Sort by newness</option>
                                <option value="price">Sort by price: low to high</option>
                                <option value="price-desc">Sort by price: high to low</option>
                            </select>
                        </div><!-- End .select-custom -->
                    </div><!-- End .toolbox-item -->

                    <div class="toolbox-item ml-lg-auto">
                        <div class="toolbox-item toolbox-show show-count">
                            <label>{{ __('Showing ').($products->count() > 12 ? '12':$products->count()).__(' of ').$products->count().__(' results') }}</label>
                        </div><!-- End .toolbox-item -->
                    </div>
                </nav>

                @include('forntend.pages.page-sections.produt-section')

                <nav class="toolbox toolbox-pagination">

                    <div class="toolbox-item toolbox-show">
                        <label>{{ __('Showing ').($products->count() > 12 ? '12':$products->count()).__(' of ').$products->count().__(' results') }}</label>
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
