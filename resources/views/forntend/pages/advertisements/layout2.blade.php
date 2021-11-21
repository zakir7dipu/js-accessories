<section class="home-products-intro mt-3 mb-1">
    <div class="container">
        <div class="row row-sm">
            @foreach($advertiseGroup2 as $key => $adItem)
                <div class="col-xl-6 {{ $key == 0? 'd-lg-block d-sm-none':'' }}">
                    <div class="banner-product bg-grey" style="background-image: url({{ $adItem->image?asset($adItem->image):asset('upload/settings/empty-add.jpg') }}); {{ !$adItem->line1 && !$adItem->line2 && !$adItem->line2 && !$adItem->btn_url && !$adItem->btn_text?'background-position : center; background-size: cover;': 'background-position : 54%; background-size: 45% 50%;'}} height: 200px;">
                        <h2>{{ $adItem->title }}</h2>
                        <div class="mr-5">
                            <h4>{{ $adItem->line1 }}<span class="price">{{ $adItem->line2 }}</span></h4>
                            {!! $adItem->btn_url && $adItem->btn_text ? '<a href="'.$adItem->btn_url.'"><button class="btn btn-primary">'.$adItem->btn_text.'</button></a>':'' !!}

                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
