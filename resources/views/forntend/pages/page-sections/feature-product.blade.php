<section class="product-panel mt-5">
    <div class="container">
        <div class="section-title">
            <h2>{{ $featureProductSection->title }}</h2>
        </div>
        <div class="product-intro divide-line mt-2 mb-8">
            @foreach($featureProducts as $key => $featureProduct)
                <div class="col-6 col-lg-2 col-md-3 col-sm-4 product-default inner-quickview inner-icon">
                    <figure>
                        <a href="javascript:void(0)">
                            <img src="{{ asset($featureProduct->productImages()->first()->image) }}">
                        </a>
                        <div class="btn-icon-group">
                            <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                        </div>
                        <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View">Quick View</a>
                    </figure>
                    <div class="product-details">
                        <div class="category-wrap">
                            <div class="category-list">
                                <a href="javascript:void(0)" class="product-category">{{ $featureProduct->category->name }}</a>
                            </div>
                            <a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
                        </div>
                        <h2 class="product-title">
                            <a href="javascript:void(0)">{{ substr($featureProduct->name, 0, 27) }}</a>
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
