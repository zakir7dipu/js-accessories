<section class="container mt-3 mb-7" id="topBrands">
{{--    <div class="section-title mb-5">--}}
{{--        <h4>Top Brands</h4>--}}
{{--    </div>--}}
    <div class="partners-carousel owl-carousel owl-theme text-center" data-toggle="owl" data-owl-options="{
                    'loop' : true,
                    'nav': false,
                    'dots': true,
                    'autoHeight': true,
                    'autoplay': true,
                    'autoplayTimeout': 5000,
                    'responsive': {
                      '0': {
                        'items': 2,
                        'margin': 0
                      },
                      '480': {
                        'items': 3
                      },
                      '768': {
                        'items': 4
                      },
                      '992': {
                        'items': 5
                      }
                    }
                }">
        @foreach($suppliers as $supplier)
            <a href="{{ $supplier->url }}"><img src="{{ asset($supplier->logo) }}" alt="logo"></a>
        @endforeach
    </div>
</section>
