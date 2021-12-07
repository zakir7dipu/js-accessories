(function ($) {
    "use script";
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    const form = document.getElementById('orderSettingsForm');
    const container = form.querySelector('.card-body');

    const saveValue = (array) => {
        $.ajax({
            type: 'post',
            url: '/district',
            data:{
                countries: array,
            },
            success:function (data) {
                // console.log(data);
                setInput(data, '-Select those state from where customer can allowed to buy your products', 'state')
            }
        })
    };

    const saveStateValue = (array) =>{
        $.ajax({
            type: 'post',
            url: '/police-station',
            data:{
                districts: array,
            },
            success:function (data) {
                form.action = '/order-area';
                form.removeAttribute('id');
                setInput(data, '-Select those police station from where customer can allowed to buy your products', 'thana');
            }
        })
    };

    const getValue = (type) => {
        if (type === 'country'){
            // form.appendChild()
            form.addEventListener('submit', (e)=>{
                // e.preventDefault();
                let selected = $('select').selectpicker().val();
                if (document.getElementsByClassName(type).length === 0){
                    let hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name= `${type}[]`;
                    hiddenInput.classList.add(type);
                    hiddenInput.value = selected;
                    form.appendChild(hiddenInput);
                    saveValue(selected);
                }
            })
        }else if(type === 'state'){
            form.addEventListener('submit', (e)=>{
                // e.preventDefault();
                let selected = $('select').selectpicker().val();
                if (document.getElementsByClassName(type).length === 0){
                    let hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name= `${type}[]`;
                    hiddenInput.classList.add(type);
                    hiddenInput.value = selected;
                    form.appendChild(hiddenInput);
                    saveStateValue(selected);
                }
            })
        }else if(type === 'thana'){
            form.addEventListener('submit', (e)=>{
                // e.preventDefault();
                let selected = $('select').selectpicker().val();
                if (document.getElementsByClassName(type).length === 0){
                    let hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name= `${type}[]`;
                    hiddenInput.classList.add(type);
                    hiddenInput.value = selected;
                    form.appendChild(hiddenInput);
                    container.innerHTML = "";
                }

            })
        }

    };

    const setInput = (array, message, type) => {
        container.innerHTML = '';
        let label = document.createElement('p');
        label.className = 'mb-1 text-capitalize';
        label.innerText = `${type}: `;
        let instruction = document.createElement('code');
        instruction.innerText = message;
        label.appendChild(instruction);

        let inputBox = document.createElement('div');
        inputBox.className = 'input-group input-group-lg mb-3';
        let input = document.createElement('select');
        input.className = 'form-control form-select form-select-lg';
        input.setAttribute('multiple', true);
        input.setAttribute('data-actions-box', true);
        input.setAttribute('data-live-search', true);
        input.required = true;
        input.name = 'items[]';
        input.id = 'country';
        Array.from(array).map((item, key)=>{
            let opt = document.createElement('option');
            opt.setAttribute('data-tokens', item.name);
            opt.setAttribute('value', item.id);
            opt.innerText = item.name;
            input.appendChild(opt);
        });
        inputBox.appendChild(input);

            container.appendChild(label);
            container.appendChild(inputBox);
            $('select').selectpicker();
            getValue(type);
    };

    $.ajax({
        type: 'get',
        url: '/country',
        success:function (data) {
            setInput(data, '-Select those countries from where customer can allowed to buy your products', 'country');
        }
    });

})(jQuery);
