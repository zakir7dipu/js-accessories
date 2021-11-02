<div class="home-top-container">
    <div class="home-slider owl-carousel owl-theme owl-carousel-lazy">
        @foreach($sliders as $slider)
            <div class="home-slide" style="background-image: url({{ asset($slider->image) }});">
                <img class="owl-lazy" src="{{ asset('forntend/assets/images/lazy.png') }}" alt="slider image">
                <div class="home-slide-content container">
                    <div>
                        <h2 class="home-slide-subtitle">{{ $slider->line1 }}</h2>
                        <h1 class="home-slide-title">
                            {{ $slider->line2 }}
                        </h1>
                        <h2 class="home-slide-foot">{!! $slider->line3 !!}</h2>
                        <a href="{{ $slider->btn_url }}"><button class="btn btn-dark btn-buy">{{ $slider->btn_text }}</button></a>
                    </div>
                </div><!-- End .home-slide-content -->
            </div><!-- End .home-slide -->
        @endforeach
    </div>
    <div class="home-slider-sidebar">
        <ul>
            @foreach($sliders as $key => $slider)
                <li {{ $key == 0 ? 'class="active"':'' }}>{{ $slider->name }}</li>
            @endforeach
        </ul>
    </div>
</div><!-- End .home-slider -->
