(function ($) {
    "use script";
    const subscription = document.getElementById('subscriptionForm');
    subscription.addEventListener('submit', (e) => {
        e.preventDefault();
        let url = subscription.getAttribute('data-role');
        console.log(url);
        $.ajax({
            type: 'post',
            url: url,
            data:{
                'email': subscription.querySelector('input[type="email"]').value
            },
            success:function (data) {
                toastr[data.status](data.message);
                subscription.reset()
            }
        })
    });
    const shurjoPay = new ShurjoPay();
    shurjoPay.verification();
    // let params = new URLSearchParams(location.search);
    //
    // if (params.get('order')){
    //     shurjoPay.verification(params.get('order'),sessionStorage.getItem('spay_token'));
    // }

})(jQuery);
