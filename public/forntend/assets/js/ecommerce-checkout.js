(function ($) {
    "use script";
    // localStorage.removeItem('sipping_address');
    $('#policeStation').selectpicker();
    $('#state').selectpicker();
    $('#country').selectpicker();

    let myForm = document.getElementById('checkoutForm');
    let progressStatus = document.querySelector('.checkout-progress-bar');
    let paymentAndReview = document.getElementById('reviewCheckout');
    let newAddress = document.querySelector('.btn-new-address');
    let paymentBtns = document.querySelectorAll('.paymentBtn');
    const oderProcessBtn = document.querySelector('.orderProcessBtn');
    const shurjaPay = new ShurjoPay();
    let country = null;
    let state = null;
    let police_station = null;

    const reviewSippingAddress = () => {
        myForm.classList.add('d-none');
        paymentAndReview.classList.remove('d-none');
        progressStatus.querySelectorAll('.progressBar')[0].classList.add('active');
        let savedAddress = getSippingAddress();
        $.ajax({
            type: 'get',
            url: `/order-area/${savedAddress.country},${savedAddress.state},${savedAddress.police_station}`,
            success: function (data) {
                country = data.country.name;
                state =  data.state.name;
                police_station = data.police_station.name;
                Object.assign(savedAddress, {country: data.country.name, state: data.state.name, police_station:data.police_station.name});
                let viewShipping = paymentAndReview.querySelector('.shipping-address-box.active');
                viewShipping.innerHTML = '';
                let address = document.createElement('address');
                address.innerHTML = `${savedAddress.name} <br> ${savedAddress.phone} <br> ${savedAddress.company_name} <br> ${savedAddress.address} <br> ${savedAddress.police_station}, ${savedAddress.state} <br> ${savedAddress.country}`;
                viewShipping.appendChild(address);
            }
        });
    };

    const shippingAddressForm = () => {
        myForm.classList.remove('d-none');
        paymentAndReview.classList.add('d-none');
    };

    const getSippingAddress = () => {
        return JSON.parse(localStorage.getItem('sipping_address'));
    };

    myForm.addEventListener('submit', (eveny)=>{
        let shippingAddress = {
            name: '',
            company_name: '',
            address: '',
            police_station: '',
            state: '',
            post_code: '',
            country: '',
            phone: '',
        };
        eveny.preventDefault();
        let name = myForm.elements['name'];
        let companyName = myForm.elements['company_name'];
        let address = myForm.elements['address'];
        let policeStation = myForm.elements['police_station'];
        let state = myForm.elements['state'];
        let postCode = myForm.elements['post_code'];
        let country = myForm.elements['country'];
        let phone = myForm.elements['phone'];

        if (name.value.trim() === ""){
            name.parentElement.classList.add('border');
            name.parentElement.classList.add('border-danger');
            name.parentElement.querySelector('small').innerText = `${name.getAttribute('name')} field is required.`;
            toastr.error(`${name.getAttribute('name')} field is required.`);
        }else {
            shippingAddress.name = name.value.trim();
        }

        if (companyName.value.trim() != ""){
            shippingAddress.company_name = companyName.value.trim();
        }

        if (address.value.trim() === ""){
            address.parentElement.classList.add('border');
            address.parentElement.classList.add('border-danger');
            address.parentElement.querySelector('small').innerText = `${address.getAttribute('name')} field is required.`;
            toastr.error(`${address.getAttribute('name')} field is required.`);
        }else {
            shippingAddress.address = address.value.trim();
        }

        if (policeStation.value.trim() === ""){
            policeStation.parentElement.classList.add('border');
            policeStation.parentElement.classList.add('border-danger');
            policeStation.parentElement.parentElement.parentElement.querySelector('small').innerText = `Police station field is required.`;
            toastr.error(`Police station field is required.`);
        }else {
            shippingAddress.police_station = policeStation.value.trim();
        }

        if (state.value.trim() === ""){
            state.parentElement.classList.add('border');
            state.parentElement.classList.add('border-danger');
            state.parentElement.parentElement.parentElement.querySelector('small').innerText = `State field is required.`;
            toastr.error(`State field is required.`);
        }else {
            shippingAddress.state = state.value.trim();
        }

        if (postCode.value.trim() === ""){
            postCode.parentElement.classList.add('border');
            postCode.parentElement.classList.add('border-danger');
            postCode.parentElement.querySelector('small').innerText = `Post code field is required.`;
            toastr.error(`Post code field is required.`);
        }else {
            shippingAddress.post_code = postCode.value.trim();
        }

        if (country.value.trim() === ""){
            country.parentElement.classList.add('border');
            country.parentElement.classList.add('border-danger');
            country.parentElement.parentElement.parentElement.querySelector('small').innerText = `Country field is required.`;
            toastr.error(`Country field is required.`);
        }else {
            shippingAddress.country = country.value.trim();
        }

        if (phone.value.trim() === ""){
            phone.parentElement.classList.add('border');
            phone.parentElement.classList.add('border-danger');
            phone.parentElement.querySelector('small').innerText = `${phone.getAttribute('name')} field is required.`;
            toastr.error(`${phone.getAttribute('name')} field is required.`);
        }else {
            shippingAddress.phone = phone.value.trim();
        }

        if (shippingAddress.name != '' && shippingAddress.address != '' && shippingAddress.police_station != '' && shippingAddress.state != '' && shippingAddress.post_code != '' && shippingAddress.country != '' && shippingAddress.phone != ''){
            localStorage.setItem('sipping_address', JSON.stringify(shippingAddress));
            toastr.success(`Step one has been completed`);
            reviewSippingAddress();
        }else {
            return;
        }

    });

    const showPage = () => {
        if (getSippingAddress()){
            reviewSippingAddress();
        }else {
            shippingAddressForm();
        }
    };

    newAddress.addEventListener('click', (event)=>{
        event.preventDefault();
        localStorage.removeItem('sipping_address');
        showPage();
    });

    Array.from(paymentBtns).map((item, key) => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            getMethod(item)
        })
    });


    const getMethod = (item) => {
        let title = `${item.getAttribute('alt').replace('_', ' ')} Method`;
        $.ajax({
            type: 'get',
            url: item.getAttribute('data-role'),
            success:function (data) {
                if (typeof data === 'object'){
                    shurjaPay.getAccess(data.username,data.password)
                        .then(response => response.json())
                        .then(result => shurjaPayCreatePayment(result))
                        .catch(error => console.log('error', error));
                    return;
                }else {
                    // return;
                    if (data === 'accept'){
                        orderProcessedWithoutPayment();
                    }else {
                        createModal(title, data)
                    }
                }
            }
        })
    };

    const createModal = (title, element) => {
        let modal = document.createElement('div');
        modal.className = 'modal fade';
        modal.id = 'cashOnDeliveryModal';
        modal.setAttribute('tabindex', '-1');
        modal.setAttribute('role', 'dialog');
        modal.setAttribute('aria-labelledby', 'exampleModalCenterTitle');
        modal.setAttribute('aria-hidden', 'true');
        document.querySelector('body').appendChild(modal);

        // create modal dialog box
        let modalDialog = document.createElement('div');
        modalDialog.className = 'modal-dialog modal-dialog-centered modal-sm';
        modalDialog.setAttribute('role', 'document');
        modal.appendChild(modalDialog);

        // create modal content
        let modalContent = document.createElement('div');
        modalContent.className = 'modal-content';
        modalDialog.appendChild(modalContent);

        // create modal header and insert all elements
        let modalHeader = document.createElement('div');
        modalHeader.className = 'modal-header';
        modalContent.appendChild(modalHeader);

        let modalTitle = document.createElement('h5');
        modalTitle.className = 'modal-title text-capitalize';
        modalTitle.innerText = title;
        let modalCloseBtn = document.createElement('button');
        modalCloseBtn.type = 'button';
        modalCloseBtn.className = 'close';
        modalCloseBtn.setAttribute('data-dismiss', 'modal');
        modalCloseBtn.setAttribute('aria-label', 'Close');
        let icon = document.createElement('span');
        icon.setAttribute('aria-hidden', true);
        icon.innerHTML = "&times;";
        modalCloseBtn.appendChild(icon);

        modalHeader.appendChild(modalTitle);
        modalHeader.appendChild(modalCloseBtn);


        // modal body
        let modalBody = document.createElement('div');
        modalBody.className = 'modal-body';
        modalBody.innerHTML = element;
        modalContent.appendChild(modalBody);

        // modal footer
        let modalFooter = document.createElement('div');
        modalFooter.className = 'modal-footer';
        modalContent.appendChild(modalFooter);
        // modal footer close btn
        let modalFooterCloseBtn = document.createElement('button');
        modalFooterCloseBtn.type = 'button';
        modalFooterCloseBtn.className = 'btn btn-secondary rounded';
        modalFooterCloseBtn.setAttribute('data-dismiss', 'modal');
        modalFooterCloseBtn.innerText = 'Close';
        modalFooter.appendChild(modalFooterCloseBtn);
        // modal footer save btn
        let modalFooterSaveBtn = document.createElement('button');
        modalFooterSaveBtn.type = 'button';
        modalFooterSaveBtn.className = 'btn btn-danger rounded';
        // modalFooterSaveBtn.setAttribute('data-dismiss', 'modal');
        modalFooterSaveBtn.innerText = 'Submit';
        modalFooter.appendChild(modalFooterSaveBtn);

        modalFooterSaveBtn.addEventListener('click', (e) => {
            e.preventDefault();
            // modalFooterSaveBtn.parentElement.parentElement.querySelector('form').submit();
            orderProcessedWithPayment(title, modal.id)
        });

        $(`#${modal.id}`).modal('show').on('hidden.bs.modal', function (e) {
            $(`#${modal.id}`).remove();
        }).on('shown.bs.modal', function () {
            $('#preloadModal').modal('hide');
        });

    };

    function uuidv4() {
        return ([1e7]+-1e3+-1e11).replace(/[018]/g, c => //1e7]+-1e3+-4e3+-8e3+-1e11
            (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
        );
    }

    const orderProcessedWithoutPayment = () => {
        let order = {
            'invoice': uuidv4(),
            'shipping_address': localStorage.getItem('sipping_address'),
            'coupon_discount': localStorage.getItem('coupon_discount'),
        };

        sendOrder(order)
    };

    const orderProcessedWithPayment = (title, modal) => {
        const modalForm = document.getElementById(title.replaceAll(' ', ''));
        const inputFields = modalForm.querySelectorAll('input');
        const paymentInfo = [];
        Array.from(inputFields).map((item, key) => {
            if (checkInputValidate(item)){
                paymentInfo.push({
                    name: item.getAttribute('name'),
                    value: item.value
                });
            }
            if (paymentInfo.length === inputFields.length){
                makeOrderForAdvancePayment(paymentInfo, modal)
            }
        });

    };

    const makeOrderForAdvancePayment = (paymentInfo, modal) =>{
        let order = {
            'invoice': uuidv4(),
            'shipping_address': localStorage.getItem('sipping_address'),
            'coupon_discount': localStorage.getItem('coupon_discount'),
            'payment': null,
            'payment_trx': null,
        };
        Array.from(paymentInfo).map((item, key) => {
            if (item.name === 'method'){
                order.payment = item.value
            }else if(item.name === 'trx_id'){
                order.payment_trx = item.value
            }
        });
        $(`#${modal}`).modal('hide');
        sendOrder(order);
    };

    const shurjaPayCreatePayment = (result) => {
        // token, store_id, prefix, amount, order_id, discsount_amount, disc_percent, customer_name, customer_phone, customer_email, customer_address, customer_city, customer_state, customer_postcode, customer_country
        let sippingAddress = JSON.parse(localStorage.getItem('sipping_address'));
        let orderId = uuidv4();
        shurjaPay.createPayment(
            result.token,
            result.store_id,
            'eshop',
            document.getElementById('totalPrice').innerText.replaceAll(',',''),
            orderId,
            result.discsount_amount?result.discsount_amount:0,
            result.disc_percent?result.disc_percent:0,
            sippingAddress.name,
            sippingAddress.phone,
            sippingAddress.email?sippingAddress.email:'',
            sippingAddress.address,
            police_station,
            state,
            sippingAddress.post_code,
            country,
        )
    };

    const checkInputValidate = (item) => {
        if (item.value){
            return true
        } else {
            toastr.error(`${item.getAttribute('name').replaceAll('_',' ').toUpperCase()} field is required`);
            item.classList.add('border');
            item.classList.add('border-danger');
            item.focus();
            return false;
        }
    };

    const sendOrder = (object) => {
        // $('#orderProcessLoadView').modal('show');
        orderProcessLoadView();
        $.ajax({
            type: 'post',
            url: '/my-account/order',
            data: object,
            success:function (data) {
                let url = window.location.origin;
                if (data.status != 'error'){
                    localStorage.removeItem('coupon_discount');
                    url = data.route
                }
                toastr[data.status](data.message);

                setTimeout(() => {
                    window.open(url);
                    window.location.href = window.location.origin+'/my-account/dashboard'
                }, 1500)
            }
        })
    };

    const orderProcessLoadView = () =>{
        const body = document.querySelector('body');
        body.setAttribute('style', 'position: relative;');
        body.classList.add('stop-scrolling');
        const loadingContent = document.querySelector('.loadOverlay');
        loadingContent.classList.add('activeLoadOverlay');
    };

    if (paymentBtns.length === 0){
        oderProcessBtn.addEventListener('click', (e) => {
            e.preventDefault();
            orderProcessedWithoutPayment();
        })
    }

    showPage();
})(jQuery);
