<section class="categories-container text-center">
    <div class="container categories-carousel owl-carousel owl-theme" data-toggle="owl" data-owl-options="{
                    'loop' : false,
                    'margin': 30,
                    'nav': false,
                    'dots': true,
                    'autoHeight': true,
                    'responsive': {
                      '0': {
                        'items': 2,
                        'margin': 0
                      },
                      '576': {
                        'items': 3
                      },
                      '768': {
                        'items': 4
                      },
                      '992': {
                        'items': 5
                      },
                      '1200': {
                        'items': 6
                      }
                    }
                }">
        @foreach($sectionCategories as $sectionCategory)
        <div class="category">
            <div class="col-12 mb-1">
                <img src="{{ $sectionCategory->icon }}" alt="" class="img-fluid w-50 mx-auto">
            </div>
            <span>{{ $sectionCategory->name }}</span>
        </div>
        @endforeach
    </div><!-- End .categories-carousel -->
</section><!-- End .categories-container -->
