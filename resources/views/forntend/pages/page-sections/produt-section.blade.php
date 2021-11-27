<div class="row row-sm">
    @foreach($products as $product)
        <div class="col-6 col-lg-2 col-md-3 col-sm-4 product-default inner-quickview inner-icon">
            <figure>
                <a href="{{ route('single-product', $product->slug) }}">
                    <img src="{{ asset($product->productImages()->first()->image) }}">
                </a>
                <div class="btn-icon-group">
                    <button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-bag"></i></button>
                </div>
                <a href="{{ route('product-quick-view',$product->id) }}" class="btn-quickview" title="Quick View">Quick View</a>
            </figure>
            <div class="product-details">
                <div class="category-wrap">
                    <div class="category-list">
                        <a href="javascript:void(0)" class="product-category">{{ $product->category->name }}</a>
                    </div>
                    <a href="javascript:void(0)" data-role="{{ $product->id }}" class="btn-icon-wish myWish"><i class="icon-heart"></i></a>
                </div>
                <h2 class="product-title">
                    <a href="javascript:void(0)">{{ substr($product->name, 0, 27) }}</a>
                </h2>
                <div class="price-box">
                    {!! $product->discount?'<span class="old-price">'.$product->currency->symbol.$product->price.'</span><span class="product-price">'.$product->currency->symbol.($product->price - (($product->price * $product->discount) / 100)).'</span>':'<span class="product-price">'.$product->currency->symbol.$product->price.'</span>' !!}
                </div><!-- End .price-box -->
            </div><!-- End .product-details -->
        </div>
    @endforeach
</div>
