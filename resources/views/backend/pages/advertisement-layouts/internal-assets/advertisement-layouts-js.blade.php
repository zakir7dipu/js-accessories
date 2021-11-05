<script>
    (function ($) {
        "use script";

        $('.empty-ad').on('click', function () {
            $(this).html('');
            $(this).attr('style', 'background-image: url();');
            let container = $(this)[0];
            console.log(container)
        })
    })(jQuery)
</script>
