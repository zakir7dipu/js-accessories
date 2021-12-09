(function ($) {
    "use script";
    // localStorage.removeItem('sipping_address');
    $('#policeStation').selectpicker();
    $('#state').selectpicker();
    $('#country').selectpicker();

    let myForm = document.getElementById('checkoutForm');
    let progressStatus = document.querySelector('.checkout-progress-bar');
    let paymentAndReview = document.getElementById('reviewCheckout');
    progressStatus.querySelectorAll('.progressBar')[0].classList.remove('active');

    const reviewSippingAddress = () => {
        myForm.classList.add('d-none');
        paymentAndReview.classList.remove('d-none');
        progressStatus.querySelectorAll('.progressBar')[0].classList.add('active');
        let savedAddress = getSippingAddress();
        $.ajax({
            type: 'get',
            url: `/order-area/${savedAddress.country},${savedAddress.state},${savedAddress.police_station}`,
            success: function (data) {
                Object.assign(savedAddress, {country: data.country.name, state: data.state.name, police_station:data.police_station.name});
                let viewShipping = paymentAndReview.querySelector('.shipping-address-box.active');
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

    showPage();
})(jQuery);
