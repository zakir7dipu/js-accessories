(function ($) {
    "use script";
    // localStorage.clear()
    const wishButton = document.querySelectorAll('.myWish');
    let wishListContainer = document.querySelector('.myWishesList');
    let wishListPageContainer = document.querySelector('.wishListViewTable');
    // console.log(window.location.pathname) /my-wishes;


    const showWishListInTable = (array) => {
        // console.log(array)
        let container = wishListPageContainer.querySelector('tbody');
        container.innerHTML = '';
        Array.from(array).map((item, key) => {
            let row1 = document.createElement('tr');
            row1.className = `product-row wishListSet${item.id}`;
            let col1 = document.createElement('td');
            col1.className = 'product-col';

            let figure = document.createElement('figure');
            figure.className = 'product-image-container';
            let figureATag = document.createElement('a');
            figureATag.href = window.location.protocol+'//'+window.location.host+'/single-product/'+item.slug;
            figureATag.className = 'product-image';
            let productImg = document.createElement('img');
            productImg.src = item.image;
            productImg.alt = 'product';
            figureATag.appendChild(productImg);
            figure.appendChild(figureATag);

            let productTitle = document.createElement('h2');
            productTitle.className = 'product-title';
            let productTitleATag = document.createElement('a');
            productTitleATag.href = window.location.protocol+'//'+window.location.host+'/single-product/'+item.slug;
            productTitleATag.innerText = item.name;
            productTitle.appendChild(productTitleATag);
            col1.appendChild(figure);
            col1.appendChild(productTitle);
            let col2 = document.createElement('td');
            col2.innerText = item.currence+item.price;
            row1.appendChild(col1);
            row1.appendChild(col2);

            let row2 = document.createElement('tr');
            row2.className = `product-action-row wishListSet${item.id}`;
            let col_1 = document.createElement('td');
            col_1.className = 'clearfix';
            col_1.colspan="2";

            let divLeft = document.createElement('div');
            divLeft.className = 'float-left';
            let divLeftATag = document.createElement('a');
            divLeftATag.className = 'btn-move';
            divLeftATag.href = 'javascript:void(0)';
            divLeftATag.innerText = 'Move to Cart';
            divLeft.appendChild(divLeftATag);

            let divRight = document.createElement('div');
            divRight.className = 'float-right';
            let divRightATag = document.createElement('a');
            divRightATag.title = 'Remove product';
            divRightATag.className = 'btn-remove listRowDelete';
            divRightATag.href = 'javascript:void(0)';
            let divRightATagSpan = document.createElement('span');
            divRightATagSpan.className = 'sr-only';
            divRightATagSpan.innerText = 'Remove';
            divRightATag.appendChild(divRightATagSpan);
            divRight.appendChild(divRightATag);
            col_1.appendChild(divLeft);
            col_1.appendChild(divRight);
            row2.appendChild(col_1);
            container.appendChild(row1);
            container.appendChild(row2);
        });

        $('.listRowDelete').on('click', function () {
            let targetedRow = $(this).parent().parent().parent().attr('class');
            $(`.${targetedRow.split(' ')[1]}`).remove();
            deleteWish(targetedRow.replace('product-action-row wishListSet', ''))
        })
        // deleteWish()
    };

    const showWishCount = (num) => {
        $('.wishCount').html(num)
    };

    const showWishList = (array) => {
        wishListContainer.innerHTML = '';
        Array.from(array).map((item, key) => {
            let product = document.createElement('div');
            product.className = `product wishListSet${item.id}`;
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
        });

        if (window.location.pathname === '/my-wishes'){
            showWishListInTable(array);
        }
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
            // console.log(button);
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
                        wish_date: data.wish_date,
                        slug: data.slug,
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
