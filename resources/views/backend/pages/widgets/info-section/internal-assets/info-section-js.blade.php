<script>
    (function ($) {
        "use script";
        //image uploader
        @foreach($infoSection as $key => $column)
        $("{{ '.column_img'.$key }}").imageUploader({
            imagesInputName: 'icon',
            maxFiles: 1,
        });
        @endforeach

         // section activation
        $('.activeInfoSection').on('change', function () {
            $.ajax({
                type: 'get',
                url: '/admin/widget/info-section/info-section-Activation',
                success:function (data){
                    toastr[data.status](data.message);
                    if(data.status != 'success'){
                        $('#infoSectionFormContainer').addClass('d-none')
                    }else{
                        $('#infoSectionFormContainer').removeClass('d-none')
                    }
                }
            })
        })
    })(jQuery);
</script>
