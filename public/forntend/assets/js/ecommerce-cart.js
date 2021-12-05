(function ($) {
    "use script";
    const cartButton = document.querySelectorAll('.myCartBtn');

    const showCartCount = (num) => {
        $('.cartCount').html(num)
    };

    const showCart = () => {
        $.ajax({
            type: 'get',
            url: '/my-cart/get',
            success:function (data) {

            }
        })
    };

    const getCart = (array) => {

    };

    Array.from(cartButton).map((item, key)=>{
        let btn = item;
        btn.addEventListener('click', (e) => {
            // e.preventDefault();
            console.clear();
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
                    console.log(data);
                    // let productInfo =  {
                    //     id: data.id,
                    //     name: data.name,
                    //     image: data.image,
                    //     currence: data.currence,
                    //     discount: data.discount,
                    //     price: data.price,
                    //     wish_date: data.wish_date,
                    //     slug: data.slug,
                    // };
                    // setWishlist(productInfo);
                }
            })
        })
    });
    showCart();
})(jQuery);
