(function ($) {
    "use script";

    const cartButton = document.querySelectorAll('.myCartBtn');
    const cartRemoveBtn = document.querySelectorAll('.cartRemoveBtn');

    const showCartCount = (num) => {
        $('.cartCount').html(num)
    };

    const getWishlist = () => {
        return localStorage.getItem('wishlist');
    };

    const deleteWish = (id) => {
        console.log(id);
        let wishlist = JSON.parse(getWishlist());
        if (wishlist.length < 2){
            localStorage.removeItem('wishlist');
        }
        Array.from(wishlist).map((item, key) => {
            if (item.id === parseInt(id)){
                wishlist.splice(key,1);
                localStorage.setItem('wishlist', JSON.stringify(wishlist))
            }
        });
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
        // console.log(product);
        // return
            $.ajax({
                type: 'get',
                url: `/my-cart/set/${product}`,
                success:function (data) {
                    if (data.status === 'error'){
                        toastr[data.status](data.info)
                    }

                    if (window.location.pathname === '/my-wishes'){
                            let targetedRow = button.parentElement.parentElement.getAttribute('class');
                        $(`.${targetedRow.split(' ')[1]}`).remove();
                        deleteWish(product);
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
