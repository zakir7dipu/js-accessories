class ShurjoPay {
    constructor() {
        this.url = 'https://sandbox.shurjopayment.com/api/'
        this.ip = null;
        this.token = null;
        this.getClientIp();
    }

    check(username, password){
        this.username = username;
        this.password = password;
        return this.username
    }

    getAccess = (username, password)  => {// get_token
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({
            "username": username,
            "password": password
        });

        var requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
            redirect: 'follow'
        };

        return fetch(`${this.url}get_token`, requestOptions);
    };

    getClientIp = () =>{
        var requestOptions = {
            method: 'GET',
            redirect: 'follow'
        };
        fetch("https://jsonip.com?callback=?",requestOptions)
            .then(response => response.text())
            .then(result => {
                let ip = result;
                ip = ip.replaceAll('?', '');
                ip = ip.replaceAll('(', '');
                ip = ip.replaceAll(')', '');
                ip = ip.replaceAll('{', '');
                ip = ip.replaceAll('}', '');
                ip = ip.replaceAll('"', '');
                ip = ip.split(",")[0];
                this.ip = ip.replaceAll('ip:', '');
            })
            .catch(error => console.log('error', error));
    };

    createPayment = (token, store_id, prefix, amount, order_id, discsount_amount, disc_percent, customer_name, customer_phone, customer_email, customer_address, customer_city, customer_state, customer_postcode, customer_country) => { //secret-pay
        this.token = token;
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({
            "token": token,
            "store_id": store_id,
            "prefix": prefix,
            "currency": "BDT",
            "return_url": `${window.location.origin}/shurjaPay/success`,
            "cancel_url": `${window.location.origin}/shurjaPay/cancel`,
            "amount": parseFloat(amount),
            "order_id": order_id,
            "discsount_amount": parseFloat(discsount_amount),
            "disc_percent": parseInt(disc_percent),
            "client_ip": this.ip,
            "customer_name": customer_name,
            "customer_phone": customer_phone,
            "customer_email": customer_email,
            "customer_address": customer_address,
            "customer_city": customer_city,
            "customer_state": customer_state,
            "customer_postcode": customer_postcode,
            "customer_country": customer_country
        });

        var requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
            redirect: 'follow'
        };

        fetch(`${this.url}secret-pay`, requestOptions)
            .then(response => response.json())
            .then(result => {
                this.verification(result);
            })
            .catch(error => console.log('error', error));
    };

    verification = result => {
        // console.log(result);
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({
            "token": this.token,
            "order_id": result.sp_order_id
        });

        var requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
            redirect: 'follow'
        };

        fetch(`${this.url}verification`, requestOptions)
            .then(response => response.text())
            .then(result => console.log(result))
            .catch(error => console.log('error', error));
    }

    paymentStatus = () => {//payment-status

    }
}
