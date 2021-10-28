<script>
    (function($)
    {
        "use strict";
        //delete item
        $('.deletePostBtn').on('click', deleteASingleRow)
        function deleteASingleRow(){
            swal({
                title: "{{__('Are you sure?')}}",
                text: "{{__('Once you delete, You can not recover this post and related files.')}}",
                icon: "warning",
                dangerMode: true,
                buttons: {
                    cancel: true,
                    confirm: {
                        text: "Delete",
                        value: true,
                        visible: true,
                        closeModal: true
                    },
                },
            }).then((value) => {
                if(value){
                    // console.log($(this).find('form')[0])
                    $(this).find('form').submit();
                }
            });

        }
        //image uploader
        $('.post_img').imageUploader({
            imagesInputName: 'thumbnail',
            maxFiles: 1,
        });

        //activation
        $('.postActivationBtn').on('click', function () {
            var selected = $(this).attr('datasrc');
            var url = "/admin/blog/post/"+selected;

            $.ajax({
                type:'get',
                url: url,
                success:function (data) {
                    // do nothing;
                    if (data.status){
                        toastr.success(data.message)
                    }else {
                        toastr.warning(data.message)
                    }
                }
            });
        });
    })(jQuery);
</script>
