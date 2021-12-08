(function ($) {
    "use script";
    $('#policeStation').selectpicker();
    $('#state').selectpicker();
    $('#country').selectpicker();

    let myForm = document.getElementById('checkoutForm');

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
            alert('ok')
        }else {
            alert('please input required fields');
            return;
        }

        // console.log(shippingAddress);
    });

})(jQuery);
