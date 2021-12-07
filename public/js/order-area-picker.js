(function ($) {
    "use script";
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    const form = document.getElementById('orderSettingsForm');
    const container = form.querySelector('.card-body');

    const getValue = () => {
        form.addEventListener('submit', (e)=>{
            e.preventDefault();
            let selected = $('select').selectpicker().val();
            saveValue(selected)
        })
    };

    const setInput = (array, message, type) => {
        let label = document.createElement('p');
        label.className = 'mb-1';
        label.innerText = 'Country: ';
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
        input.name = 'countries[]';
        input.id = 'country';
        Array.from(array).map((item, key)=>{
            let opt = document.createElement('option');
            opt.setAttribute('data-tokens', item.name);
            opt.setAttribute('value', item.id);
            opt.innerText = item.name;
            input.appendChild(opt);
        });
        inputBox.appendChild(input);

        if (type === 'country'){
            container.appendChild(label);
            container.appendChild(inputBox);
            $('select').selectpicker();
            getValue();
        }else if(type === 'state'){
            container.appendChild(label);
            container.appendChild(inputBox);
            $('select').selectpicker();
            getValue();
        }

    };

    const saveValue = (array) => {
        $.ajax({
            type: 'post',
            url: '/district',
            data:{
                countries: array,
            },
            success:function (data) {
                // console.log(data);
                setInput(data, '-Select those stat from where customer can allowed to buy your products', 'state')
            }
        })
    };

    $.ajax({
        type: 'get',
        url: '/country',
        success:function (data) {
            setInput(data, '-Select those countries from where customer can allowed to buy your products', 'country');
        }
    });

})(jQuery);
