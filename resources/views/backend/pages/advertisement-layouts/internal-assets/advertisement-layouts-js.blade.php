<script>
    (function ($) {
        "use script";

        //image uploader
        @foreach($advertisements as $key => $advertise)
        $("{{ '.advertise_img'.$key }}").imageUploader({
            imagesInputName: 'image',
            maxFiles: 1,
        });
        @endforeach

        $('.empty-ad').on('click', function () {
            $(this).parent().find('.ad-form').removeClass('d-none');
            $(this).addClass('d-none');
        });

        $('.ad-form-close').on('click', function () {
            $(this).parent().parent().parent().parent().find('.empty-ad').removeClass('d-none');
            $(this).parent().parent().parent().addClass('d-none');
        })


    })(jQuery)
</script>
