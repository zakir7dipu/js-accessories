<div class="product-single-container product-single-default product-quick-view container">
    <div class="row">
        <div class="col-lg-6 col-md-6 product-single-gallery">
            <div class="product-slider-container product-item">
                <div class="product-single-carousel owl-carousel owl-theme">
                    @foreach($product->productImages as $productImage)
                    <div class="product-item">
                        <img class="product-single-image" src="{{ asset($productImage->image) }}" data-zoom-image="{{ asset($productImage->image) }}"/>
                    </div>
                    @endforeach
                </div>
                <!-- End .product-single-carousel -->
            </div>
            <div class="prod-thumbnail row owl-dots" id='carousel-custom-dots'>
                 @foreach($product->productImages as $productImage)
                <div class="col-3 owl-dot">
                    <img src="{{ asset($productImage->image) }}"/>
                </div>
                @endforeach
            </div>
        </div><!-- End .col-lg-7 -->

        <div class="col-lg-6 col-md-6">
            <div class="product-single-details">
                <h1 class="product-title">{{ $product->name }}</h1>

{{--                <div class="ratings-container">--}}
{{--                    <div class="product-ratings">--}}
{{--                        <span class="ratings" style="width:60%"></span><!-- End .ratings -->--}}
{{--                    </div><!-- End .product-ratings -->--}}

{{--                    <a href="#" class="rating-link">( 6 Reviews )</a>--}}
{{--                </div><!-- End .product-container -->--}}

                <div class="price-box">
                    {!! $product->discount?'<span class="old-price">'.$product->currency->symbol.$product->price.'</span><span class="product-price">'.$product->currency->symbol.($product->price - (($product->price * $product->discount) / 100)).'</span>':'<span class="product-price">'.$product->currency->symbol.$product->price.'</span>' !!}
{{--                    <span class="old-price">$81.00</span>--}}
{{--                    <span class="product-price">$101.00</span>--}}
                </div><!-- End .price-box -->

                <div class="product-desc">
                    <p>{!! $product->short_description !!}</p>
                </div><!-- End .product-desc -->

                @if($product->color->count() > 0)
                <div class="product-filters-container">
                        <div class="product-single-filter">
                            <label>Colors:</label>
                            <ul class="config-swatch-list">
                                @foreach($product->color as $key => $color)
                                <li class="{{ $key==0?'active':''}} productColorBtn" data-role="{{ $color->id }}">
                                    <a href="javascript:void(0)" style="background-color: {{ $color->details }};" data-toggle="tooltip" data-placement="top" title="{{ $color->name }}"></a>
                                </li>
                                @endforeach
                            </ul>
                        </div><!-- End .product-single-filter -->
                </div><!-- End .product-filters-container -->
                @endif
                @if($product->size->count() > 0)
                <div class="product-filters-container">
                        <div class="product-single-filter">
                            <label>Size:</label>
                            <ul class="d-flex">
                                @foreach($product->size as $key => $size)
                                <li class="{{ $key==0?'active':''}} m-1 productSizeBtn" data-role="{{ $size->id }}">
                                    <a href="javascript:void(0)" class="btn btn-light btn-sm rounded border-secondary" data-toggle="tooltip" data-placement="top" title="{{ $size->details }}">{{ $size->name }}</a>
                                </li>
                                @endforeach
                            </ul>
                        </div><!-- End .product-single-filter -->
                </div><!-- End .product-filters-container -->
                @endif

                <div class="product-action">
                    <form action="{{ route('cart.set',$product->id) }}" method="post" class="form-inline">
                        @csrf
                        <div class="product-single-qty">
                            <input class="horizontal-quantity form-control" type="text" id="productQty" name="qty">
                            <input type="hidden" id="productColor" name="color">
                            <input type="hidden" id="productSize" name="size">
                        </div><!-- End .product-single-qty -->

                        <button type="submit" class="paction add-cart cursor-pointer" title="Add to Cart">
                            <span>Add to Cart</span>
                        </button>
                    </form>
                    <a href="javascript:void(0)" data-role="{{ $product->id }}" class="paction add-wishlist myWish" title="Add to Wishlist">
                        <span>Add to Wishlist</span>
                    </a>
                    <a href="#" class="paction add-compare" title="Add to Compare">
                        <span>Add to Compare</span>
                    </a>
                </div><!-- End .product-action -->

                <div class="product-single-share">
                    <label>Share:</label>
                    <!-- www.addthis.com share plugin-->
                    <div class="addthis_inline_share_toolbox"></div>
                </div><!-- End .product single-share -->
            </div><!-- End .product-single-details -->
        </div><!-- End .col-lg-5 -->
    </div><!-- End .row -->
</div><!-- End .product-single-container -->

<!-- Wishlist js -->
<script src="{{ asset('forntend/assets/js/ecommerce-wishlist.js') }}"></script>
<script src="{{ asset('forntend/assets/js/select-product-attributes.js') }}"></script>
