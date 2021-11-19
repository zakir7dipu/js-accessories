<section class="home-products-intro bg-grey" id="specialOffer" style="padding: 4.5rem 0 2rem;">
    <div class="container">
        <div class="row">
            <div class="col-xl-4">
                <div class="section-title">
                    <h2>Special Offer</h2>
                </div>
            </div>
            <div class="col-xl-12">
                <div class="home-product-tabs">
                    <ul class="nav nav-tabs mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="lamps-tab" data-toggle="tab" href="#bestseller" role="tab" aria-controls="lamps" aria-selected="false">{{ __('Best Seller') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="cameras-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="cameras" aria-selected="false">{{ __('Popular') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="computer-tab" data-toggle="tab" href="#trending" role="tab" aria-controls="computer" aria-selected="false">{{ __('Trending') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="mobile-phones-tab" data-toggle="tab" href="#discount" role="tab" aria-controls="mobile-phones" aria-selected="false">{{ __('Sales Product') }}</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="bestseller" role="tabpanel" aria-labelledby="lamps-tab">
                            <div class="row row-sm">
                                @foreach($bestSellers as $itemData)
                                    <div class="col-6 col-lg-2 col-md-3">
                                        <div class="product-default inner-quickview inner-icon">
                                            <figure>
                                                <a href="{{ route('single-product', $itemData->slug) }}">
                                                    <img src="{{ asset($itemData->productImages()->first()->image) }}">
                                                </a>
                                                <div class="btn-icon-group">
                                                    <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                                                </div>
                                                <a href="{{ route('product-quick-view',$itemData->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
                                            </figure>
                                            <div class="product-details">
                                                <div class="category-wrap">
                                                    <div class="category-list">
                                                        <a href="javascript:void(0)" class="product-category">{{ $itemData->category->name }}</a>
                                                    </div>
                                                    <a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
                                                </div>
                                                <h2 class="product-title">
                                                    <a href="javascript:void(0)">{{ substr($itemData->name, 0, 27) }}</a>
                                                </h2>
                                                <div class="price-box">
                                                    {!! $itemData->discount?'<span class="old-price">'.$itemData->currency->symbol.$itemData->price.'</span><span class="product-price">'.$itemData->currency->symbol.($itemData->price - (($itemData->price * $itemData->discount) / 100)).'</span>':'<span class="product-price">'.$itemData->currency->symbol.$itemData->price.'</span>' !!}
                                                </div><!-- End .price-box -->
                                            </div><!-- End .product-details -->
                                        </div>
                                    </div><!-- End .col-md-4 -->
                                @endforeach
                            </div><!-- End .row -->
                        </div><!-- End .tab-pane -->

                        <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="cameras-tab">
                            <div class="row row-sm">
                                @foreach($populars as $itemData)
                                    <div class="col-6 col-lg-2 col-md-3">
                                        <div class="product-default inner-quickview inner-icon">
                                            <figure>
                                                <a href="{{ route('single-product', $itemData->slug) }}">
                                                    <img src="{{ asset($itemData->productImages()->first()->image) }}">
                                                </a>
                                                <div class="btn-icon-group">
                                                    <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                                                </div>
                                                <a href="{{ route('product-quick-view',$itemData->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
                                            </figure>
                                            <div class="product-details">
                                                <div class="category-wrap">
                                                    <div class="category-list">
                                                        <a href="javascript:void(0)" class="product-category">{{ $itemData->category->name }}</a>
                                                    </div>
                                                    <a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
                                                </div>
                                                <h2 class="product-title">
                                                    <a href="javascript:void(0)">{{ substr($itemData->name, 0, 27) }}</a>
                                                </h2>
                                                <div class="price-box">
                                                    {!! $itemData->discount?'<span class="old-price">'.$itemData->currency->symbol.$itemData->price.'</span><span class="product-price">'.$itemData->currency->symbol.($itemData->price - (($itemData->price * $itemData->discount) / 100)).'</span>':'<span class="product-price">'.$itemData->currency->symbol.$itemData->price.'</span>' !!}
                                                </div><!-- End .price-box -->
                                            </div><!-- End .product-details -->
                                        </div>
                                    </div><!-- End .col-md-4 -->
                                @endforeach
                            </div><!-- End .row -->
                        </div><!-- End .tab-pane -->

                        <div class="tab-pane fade" id="trending" role="tabpanel" aria-labelledby="computer-tab">
                            <div class="row row-sm">
                                @foreach($trendings as $itemData)
                                    <div class="col-6 col-lg-2 col-md-3">
                                        <div class="product-default inner-quickview inner-icon">
                                            <figure>
                                                <a href="{{ route('single-product', $itemData->slug) }}">
                                                    <img src="{{ asset($itemData->productImages()->first()->image) }}">
                                                </a>
                                                <div class="btn-icon-group">
                                                    <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                                                </div>
                                                <a href="{{ route('product-quick-view',$itemData->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
                                            </figure>
                                            <div class="product-details">
                                                <div class="category-wrap">
                                                    <div class="category-list">
                                                        <a href="javascript:void(0)" class="product-category">{{ $itemData->category->name }}</a>
                                                    </div>
                                                    <a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
                                                </div>
                                                <h2 class="product-title">
                                                    <a href="javascript:void(0)">{{ substr($itemData->name, 0, 27) }}</a>
                                                </h2>
                                                <div class="price-box">
                                                    {!! $itemData->discount?'<span class="old-price">'.$itemData->currency->symbol.$itemData->price.'</span><span class="product-price">'.$itemData->currency->symbol.($itemData->price - (($itemData->price * $itemData->discount) / 100)).'</span>':'<span class="product-price">'.$itemData->currency->symbol.$itemData->price.'</span>' !!}
                                                </div><!-- End .price-box -->
                                            </div><!-- End .product-details -->
                                        </div>
                                    </div><!-- End .col-md-4 -->
                                @endforeach
                            </div><!-- End .row -->
                        </div><!-- End .tab-pane -->

                        <div class="tab-pane fade" id="discount" role="tabpanel" aria-labelledby="mobile-phones-tab">
                            <div class="row row-sm">
                                @foreach($discounts as $itemData)
                                    <div class="col-6 col-lg-2 col-md-3">
                                        <div class="product-default inner-quickview inner-icon">
                                            <figure>
                                                <a href="{{ route('single-product', $itemData->slug) }}">
                                                    <img src="{{ asset($itemData->productImages()->first()->image) }}">
                                                </a>
                                                <div class="btn-icon-group">
                                                    <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                                                </div>
                                                <a href="{{ route('product-quick-view',$itemData->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
                                            </figure>
                                            <div class="product-details">
                                                <div class="category-wrap">
                                                    <div class="category-list">
                                                        <a href="javascript:void(0)" class="product-category">{{ $itemData->category->name }}</a>
                                                    </div>
                                                    <a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
                                                </div>
                                                <h2 class="product-title">
                                                    <a href="javascript:void(0)">{{ substr($itemData->name, 0, 27) }}</a>
                                                </h2>
                                                <div class="price-box">
                                                    {!! $itemData->discount?'<span class="old-price">'.$itemData->currency->symbol.$itemData->price.'</span><span class="product-price">'.$itemData->currency->symbol.($itemData->price - (($itemData->price * $itemData->discount) / 100)).'</span>':'<span class="product-price">'.$itemData->currency->symbol.$itemData->price.'</span>' !!}
                                                </div><!-- End .price-box -->
                                            </div><!-- End .product-details -->
                                        </div>
                                    </div><!-- End .col-md-4 -->
                                @endforeach
                            </div><!-- End .row -->
                        </div><!-- End .tab-pane -->
                    </div><!-- End .tab-content -->
                </div><!-- End .home-product-tabs -->
            </div>
        </div>
    </div>
</section>
