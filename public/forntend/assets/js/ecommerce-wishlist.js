(function ($) {
    "use script";
    // localStorage.clear()
    const wishButton = document.querySelectorAll('.myWish');
    let wishListContainer = document.querySelector('.myWishesList');


    const showWishCount = (num) => {
        $('.wishCount').html(num)
    };

    const showWishList = (array) => {
        wishListContainer.innerHTML = '';
        Array.from(array).map((item, key) => {
            let product = document.createElement('div');
            product.className = 'product';
            product.setAttribute('datasrc', item.id);
            //product details
            let productDetails = document.createElement('div');
            productDetails.className = 'product-details';
            let productTitle = document.createElement('h4');
            productTitle.className = 'product-title';
            productTitle.innerText = item.name;
            let cartProductInfo = document.createElement('span');
            cartProductInfo.className = 'cart-product-info';
            cartProductInfo.innerText = item.currence+(item.price-item.discount);
            productDetails.appendChild(productTitle);
            productDetails.appendChild(cartProductInfo);
            //product image
            let productImageContainer = document.createElement('figure');
            productImageContainer.className = 'product-image-container';
            let productImage = document.createElement('a');
            productImage.href = 'javascript:void(0)';
            productImage.className = 'product-image';
            let img = document.createElement('img');
            img.src = item.image;
            img.alt = 'product';
            productImage.appendChild(img);
            //remove button
            let btnRemove = document.createElement('a');
            btnRemove.className = 'btn-remove wishRemove';
            btnRemove.title = 'Remove Product';
            let icon = document.createElement('i');
            icon.className = 'icon-retweet';
            btnRemove.appendChild(icon);
            productImageContainer.appendChild(productImage);
            productImageContainer.appendChild(btnRemove);
            product.appendChild(productDetails);
            product.appendChild(productImageContainer);
            wishListContainer.appendChild(product);
        });

        $('.wishRemove').on('click', function () {
            deleteWish($(this).parent().parent().attr('datasrc'));
            $(this).parent().parent().remove();
        })
    };

    const setWishlist = (data) => {
        let wishlist = !JSON.parse(getWishlist())?[]:JSON.parse(getWishlist());
        let haveProduct = '';
        Array.from(wishlist).map((item, key) => {
            if (item.id == data.id){
                haveProduct = key;
            }
        });

        if (typeof haveProduct === 'number'){
            wishlist[haveProduct] = data;
            toastr.success('Wishlist has been updated.')
        }else{
            wishlist.push(data);
            toastr.success('A Product has been added with Wishlist.')
        }

        if (wishlist.length === 0){
            wishlist.push(data);
            toastr.success('A Product has been added with Wishlist.')
        }

        showWishCount(wishlist.length);
        showWishList(wishlist);
        localStorage.setItem('wishlist', JSON.stringify(wishlist));
        setTimeout(()=>{
            location.reload();
        },1000);
    };

    const getWishlist = () => {
        return localStorage.getItem('wishlist');
    };

    const deleteWish = (id) => {
        let wishlist = JSON.parse(getWishlist());
        if (wishlist.length < 2){
            localStorage.removeItem('wishlist');
        }
        Array.from(wishlist).map((item, key) => {
            if (item.id === parseInt(id)){
                wishlist.splice(key,1);
                showWishCount(wishlist.length);
                showWishList(wishlist);
                localStorage.setItem('wishlist', JSON.stringify(wishlist))
            }
        });
    };

    Array.from(wishButton).map((item, key)=>{
        let btn = item;
        btn.addEventListener('click', (e) => {
            let button = e.target.parentElement;
            console.log(button);
            if (button.className === 'product-action'){
                button = button.querySelector('.myWish')
            }
            let product = button.getAttribute('data-role');
            $.ajax({
                type: 'get',
                url: `/product-info/${product}`,
                success:function (data) {

                    let productInfo =  {
                        id: data.id,
                        name: data.name,
                        image: data.image,
                        currence: data.currence,
                        discount: data.discount,
                        price: data.price,
                        wish_date: data.price,
                    };
                    setWishlist(productInfo);
                }
            })
        })
    });

    let preWish = !JSON.parse(getWishlist())?[]:JSON.parse(getWishlist());
    showWishCount(preWish.length);
    showWishList(preWish);
})(jQuery);
