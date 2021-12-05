(function ($) {
    "use script";
    const cartButton = document.querySelectorAll('.myCartBtn');
    const cartRemoveBtn = document.querySelectorAll('.cartRemoveBtn');

    const showCartCount = (num) => {
        $('.cartCount').html(num)
    };

    const getCart = () => {
        $.ajax({
            type: 'get',
            url: '/my-cart/get',
            success:function (data) {
                if (data.status === 'error'){
                    toastr[data.status](data.info)
                }
                showCartCount(data.info.count);
            }
        })
    };

    Array.from(cartButton).map((item, key)=>{
        let btn = item;
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            let button = e.target.parentElement;
            let product = button.getAttribute('data-role');
            $.ajax({
                type: 'get',
                url: `/my-cart/set/${product}`,
                success:function (data) {
                    if (data.status === 'error'){
                        toastr[data.status](data.info)
                    }
                    showCartCount(data.info.count);
                    toastr[data.status]('Cart has been added successfully.');
                    setTimeout(()=>{
                        location.reload();
                    },1000);
                }
            })
        })
    });

    Array.from(cartRemoveBtn).map((item, key)=>{
        let btn = item;
        btn.addEventListener('click', (e)=>{
            e.preventDefault();
            let button = e.target.parentElement;
            let cart = button.getAttribute('data-role');
            $.ajax({
                type: 'get',
                url: `/my-cart/destroy/${cart}`,
                success:function (data) {
                    toastr[data.status](data.info);
                    setTimeout(()=>{
                        location.reload();
                    },1000);
                }
            });
        })
    });
    getCart();
})(jQuery);
