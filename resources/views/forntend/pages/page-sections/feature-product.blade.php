<section class="product-panel mt-5">
    <div class="container">
        <div class="section-title">
            <h2>{{ $featureProductSection->title }}</h2>
        </div>
        <div class="product-intro divide-line mt-2 mb-8">
            @foreach($featureProducts as $key => $featureProduct)
                <div class="col-6 col-lg-2 col-md-3 col-sm-4 product-default inner-quickview inner-icon">
                    <figure>
                        <a href="{{ route('single-product', $featureProduct->slug) }}">
                            <img src="{{ asset($featureProduct->productImages()->first()->image) }}">
                        </a>
                        <div class="btn-icon-group"> <!--  -->
                            <button class="btn-icon myCartBtn btn-add-cart" data-role="{{ $featureProduct->id }}"><i class="icon-bag"></i></button>
                        </div>
                        <a href="{{ route('product-quick-view',$featureProduct->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
                    </figure>
                    <div class="product-details">
                        <div class="category-wrap">
                            <div class="category-list">
                                <a href="javascript:void(0)" class="product-category">{{ $featureProduct->category->name }}</a>
                            </div>
                            <a href="javascript:void(0)" data-role="{{ $featureProduct->id }}" class="btn-icon-wish myWish"><i class="icon-heart"></i></a>
                        </div>
                        <h2 class="product-title">
                            <a href="javascript:void(0)">{{ substr($featureProduct->name, 0, 16) }}</a>
                        </h2>
                        <div class="price-box">
                            {!! $featureProduct->discount?'<span class="old-price">'.$featureProduct->currency->symbol.$featureProduct->price.'</span><span class="product-price">'.$featureProduct->currency->symbol.($featureProduct->price - (($featureProduct->price * $featureProduct->discount) / 100)).'</span>':'<span class="product-price">'.$featureProduct->currency->symbol.$featureProduct->price.'</span>' !!}
                        </div><!-- End .price-box -->
                    </div><!-- End .product-details -->
                </div>
            @endforeach
        </div>
    </div>
</section>
