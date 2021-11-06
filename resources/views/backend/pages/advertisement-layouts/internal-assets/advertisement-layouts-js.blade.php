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

        //
        $('.deleteAdvertiseBtn').on('click', function(){
            swal({
                title: "{{__('Are you sure?')}}",
                text: "{{__('Once you delete, You can not recover this advertise and related files.')}}",
                icon: "warning",
                dangerMode: true,
                buttons: {
                    cancel: true,
                    confirm: {
                        text: "{{__('Delete')}}",
                        value: true,
                        visible: true,
                        closeModal: true
                    },
                },
            }).then((value) => {
                if(value){
                    $(this).find('.deleteForm').submit();
                }
            });
        })


    })(jQuery)
</script>
