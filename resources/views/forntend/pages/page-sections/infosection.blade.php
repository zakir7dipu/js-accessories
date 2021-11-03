<section class="bg-grey">
    <div class="container">
        <div class="row">
            @foreach($infoSection as $column)
                <div class="col-md-4">
                    <div class="info-box">
{{--                        <i class="icon-shipping"></i>--}}
                        <div class="col-12 mb-1">
                            <img src="{{ asset($column->icon) }}" alt="" class="img-fluid mx-auto" style="width: 60px;">
                        </div>
                        <div class="info-box-content">
                            <h4 class="info-title">{{ $column->title }}</h4>
                            <h4 class="info-subtitle">{{ $column->sub_title }}</h4>
                            <p>{{ $column->description }}</p>
                        </div><!-- End .info-box-content -->
                    </div><!-- End .info-box -->
                </div>
            @endforeach
        </div>
    </div><!-- End .container -->
</section><!-- End .info-boxes-container -->
