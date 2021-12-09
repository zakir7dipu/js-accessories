<div class="order-summary">
    <h3>{{ __('Summary') }}</h3>
    <h4>
        <a data-toggle="collapse" href="#order-cart-section" class="collapsed" role="button" aria-expanded="false" aria-controls="order-cart-section">{{ count($carts). __(' products in Cart') }}</a>
    </h4>

    <div class="collapse" id="order-cart-section">
        <table class="table table-mini-cart">
            <tbody>
            @foreach($carts as $cart)
                <tr>
                    <td class="product-col">
                        <figure class="product-image-container">
                            <a href="{{ route('single-product',$cart->options['slug']) }}" class="product-image">
                                <img src="{{ $cart->options['image'] }}" alt="product">
                            </a>
                        </figure>
                        <div>
                            <h2 class="product-title">
                                <a href="{{ route('single-product',$cart->options['slug']) }}">{{ $cart->name }}</a>
                            </h2>

                            <span class="product-qty">{{ __('Qty: ').$cart->qty }}</span>
                        </div>
                    </td>
                    <td class="price-col">
                        {{ $cart->subtotal() }}
                    </td>
                </tr>
            @endforeach
            <tr>
                <td class="product-col">
                    <div>
                        <h2 class="product-title">
                            {{ __('Total') }}
                        </h2>
                    </div>
                </td>
                <td class="price-col">{{ $cartTotal }}</td>
            </tr>
            </tbody>
        </table>
    </div><!-- End #order-cart-section -->
</div><!-- End .order-summary -->
