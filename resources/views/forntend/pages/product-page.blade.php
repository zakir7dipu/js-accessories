@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main home">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                    {!! isset($sProduct->parent) ? '<li class="breadcrumb-item"><a href="javascript:void(0)">'.$sProduct->parent->name.'</a></li>':'' !!}

                    <li class="breadcrumb-item active" aria-current="page">{{ $sProduct->category->name }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container">
            <div class="product-single-container product-single-default">
                <div class="row">
                    <div class="col-lg-7 product-single-gallery">
                        <div class="sticky-slider">
                            <div class="product-slider-container product-item">
                                <div class="product-single-carousel owl-carousel owl-theme">
                                    @foreach($sProduct->productImages as $sProductImage)
                                    <div class="product-item">
                                        <img class="product-single-image" src="{{ asset($sProductImage->image) }}" data-zoom-image="{{ asset($sProductImage->image) }}"/>
                                    </div>
                                    @endforeach
                                </div>
                                <!-- End .product-single-carousel -->
                                <span class="prod-full-screen">
                                        <i class="icon-plus"></i>
                                    </span>
                            </div>

                            <div class="prod-thumbnail row owl-dots transparent-dots" id='carousel-custom-dots'>
                                @foreach($sProduct->productImages as $sProductImage)
                                <div class="owl-dot">
                                    <img src="{{ asset($sProductImage->image) }}"/>
                                </div>
                                 @endforeach
                            </div>
                        </div>
                    </div><!-- End .col-md-6 -->

                    <div class="col-lg-5">
                        <div class="product-single-details">
                            <h1 class="product-title">{{ $sProduct->name }}</h1>

{{--                            <div class="ratings-container">--}}
{{--                                <div class="product-ratings">--}}
{{--                                    <span class="ratings" style="width:60%"></span><!-- End .ratings -->--}}
{{--                                </div><!-- End .product-ratings -->--}}

{{--                                <a href="#" class="rating-link">( 6 Reviews )</a>--}}
{{--                            </div><!-- End .product-container -->--}}

                            <div class="price-box">
                                {!! $sProduct->discount?'<span class="old-price">'.$sProduct->currency->symbol.$sProduct->price.'</span><span class="product-price">'.$sProduct->currency->symbol.($sProduct->price - (($sProduct->price * $sProduct->discount) / 100)).'</span>':'<span class="product-price">'.$sProduct->currency->symbol.$sProduct->price.'</span>' !!}
                            </div><!-- End .price-box -->

                            <div class="product-desc">
                                <p>{{ $sProduct->short_description }}</p>
                            </div><!-- End .product-desc -->

                            <div class="product-filters-container">
                                <div class="product-single-filter">
                                    <label>Colors:</label>
                                    <ul class="config-swatch-list">
                                        @foreach($sProduct->color as $key => $color)
                                        <li class="{{ $key==0?'active':''}}">
                                            <a href="javascript:void(0)" style="background-color: {{ $color->details }};" data-toggle="tooltip" data-placement="top" title="{{ $color->name }}"></a>
                                        </li>
                                        @endforeach
                                    </ul>
                                </div><!-- End .product-single-filter -->
                            </div><!-- End .product-filters-container -->
                            <div class="product-filters-container">
                                <div class="product-single-filter">
                                    <label>Size:</label>
                                    <ul class="d-flex">
                                        @foreach($sProduct->size as $key => $size)
                                            <li class="{{ $key==0?'active':''}} m-1">
                                                <a href="javascript:void(0)" class="btn btn-light btn-sm rounded border-secondary" data-toggle="tooltip" data-placement="top" title="{{ $size->details }}">{{ $size->name }}</a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div><!-- End .product-single-filter -->
                            </div><!-- End .product-filters-container -->

                            <div class="product-action">
                                <div class="product-single-qty">
                                    <input class="horizontal-quantity form-control" type="text">
                                </div><!-- End .product-single-qty -->

                                <a href="cart.html" class="paction add-cart" title="Add to Cart">
                                    <span>Add to Cart</span>
                                </a>
                                <a href="#" class="paction add-wishlist" title="Add to Wishlist">
                                    <span>Add to Wishlist</span>
                                </a>
                                <a href="#" class="paction add-compare" title="Add to Compare">
                                    <span>Add to Compare</span>
                                </a>
                            </div><!-- End .product-action -->

                            <div class="product-single-share mb-4">
                                <label>Share:</label>
                                <!-- www.addthis.com share plugin-->
                                <div class="addthis_inline_share_toolbox"></div>
                            </div><!-- End .product single-share -->
                        </div><!-- End .product-single-details -->

                        <div class="product-single-tabs">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="product-tab-desc" data-toggle="tab" href="#product-desc-content" role="tab" aria-controls="product-desc-content" aria-selected="true">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="product-tab-tags" data-toggle="tab" href="#product-tags-content" role="tab" aria-controls="product-tags-content" aria-selected="false">Tags</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="product-tab-reviews" data-toggle="tab" href="#product-reviews-content" role="tab" aria-controls="product-reviews-content" aria-selected="false">Reviews</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="product-desc-content" role="tabpanel" aria-labelledby="product-tab-desc">
                                    <div class="product-desc-content">
                                        {!! $sProduct->description !!}
                                    </div><!-- End .product-desc-content -->
                                </div><!-- End .tab-pane -->

                                <div class="tab-pane fade" id="product-tags-content" role="tabpanel" aria-labelledby="product-tab-tags">
                                    <div class="product-tags-content">
                                        @php
                                        $tags = explode(',',$sProduct->tags);
                                        @endphp
                                        @foreach($tags as $tag)
                                            <h3> <span class="badge badge-success rounded badge-lg">{!! $tag.'&nbsp; &times;' !!}</span></h3>
                                        @endforeach
                                    </div><!-- End .product-tags-content -->
                                </div><!-- End .tab-pane -->

                                <div class="tab-pane fade" id="product-reviews-content" role="tabpanel" aria-labelledby="product-tab-reviews">
                                    <div class="product-reviews-content">
                                        <div class="collateral-box">
                                            <ul>
                                                <li>{{ __('Be the first to review this product') }}</li>
                                            </ul>
                                        </div><!-- End .collateral-box -->

                                        <div class="add-product-review">
                                            <h3 class="text-uppercase heading-text-color font-weight-semibold">{{ __('WRITE YOUR OWN REVIEW') }}</h3>
                                            <p>{{ __('How do you rate this product? *') }}</p>

                                            <form action="#">
                                                <table class="ratings-table">
                                                    <thead>
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <th>1 star</th>
                                                        <th>2 stars</th>
                                                        <th>3 stars</th>
                                                        <th>4 stars</th>
                                                        <th>5 stars</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>Quality</td>
                                                        <td>
                                                            <input type="radio" name="ratings[1]" id="Quality_1" value="1" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="ratings[1]" id="Quality_2" value="2" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="ratings[1]" id="Quality_3" value="3" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="ratings[1]" id="Quality_4" value="4" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="ratings[1]" id="Quality_5" value="5" class="radio">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Value</td>
                                                        <td>
                                                            <input type="radio" name="value[1]" id="Value_1" value="1" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="value[1]" id="Value_2" value="2" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="value[1]" id="Value_3" value="3" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="value[1]" id="Value_4" value="4" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="value[1]" id="Value_5" value="5" class="radio">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Price</td>
                                                        <td>
                                                            <input type="radio" name="price[1]" id="Price_1" value="1" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="price[1]" id="Price_2" value="2" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="price[1]" id="Price_3" value="3" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="price[1]" id="Price_4" value="4" class="radio">
                                                        </td>
                                                        <td>
                                                            <input type="radio" name="price[1]" id="Price_5" value="5" class="radio">
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                                <div class="form-group">
                                                    <label>Nickname <span class="required">*</span></label>
                                                    <input type="text" class="form-control form-control-sm" required>
                                                </div><!-- End .form-group -->
                                                <div class="form-group">
                                                    <label>Summary of Your Review <span class="required">*</span></label>
                                                    <input type="text" class="form-control form-control-sm" required>
                                                </div><!-- End .form-group -->
                                                <div class="form-group mb-2">
                                                    <label>Review <span class="required">*</span></label>
                                                    <textarea cols="5" rows="6" class="form-control form-control-sm"></textarea>
                                                </div><!-- End .form-group -->

                                                <input type="submit" class="btn btn-primary" value="Submit Review">
                                            </form>
                                        </div><!-- End .add-product-review -->
                                    </div><!-- End .product-reviews-content -->
                                </div><!-- End .tab-pane -->
                            </div><!-- End .tab-content -->
                        </div><!-- End .product-single-tabs -->
                    </div><!-- End .col-md-6 -->
                </div><!-- End .row -->
            </div><!-- End .product-single-container -->
        </div><!-- End .container -->

        @if($featureProductSection?$featureProductSection->show:'')
            @include('forntend.pages.page-sections.feature-product')
        @endif
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
