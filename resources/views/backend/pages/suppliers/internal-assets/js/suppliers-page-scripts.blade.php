<script !src="">
    (function($)
    {
        "use strict";
        $('.supplier_bg_image').imageUploader({
            imagesInputName: 'logo',
            maxFiles: 1,
        });

        $('.supplierActivationBtn').on('click', function (){
            $.ajax({
                type: 'get',
                url: '/admin/supplier/'+$(this).attr('datasrc'),
                success:function (data){
                    if (data.status){
                        toastr.success(data.message)
                    }else {
                        toastr.warning(data.message)
                    }

                }
            })
        });
    })(jQuery);



</script>
