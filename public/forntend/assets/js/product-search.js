(function ($) {
    "use script";
    const headerSearchBox = document.getElementById('productSearchByCategory');
    const headerSearchBoxCategory = headerSearchBox.querySelector('select');
    const productSearchBoxAutoCompleteList = headerSearchBox.querySelector('#productSearchList');

    headerSearchBoxCategory.addEventListener('change', (e) => {
        e.preventDefault();
        console.log();
        $.ajax({
            type: 'get',
            url: `${headerSearchBoxCategory.getAttribute('datasrc')}/${headerSearchBoxCategory.value}`,
            success:function (data) {
                productSearchAutoCompleteList(data);
            }
        });
    });

    const productSearchAutoCompleteList = (array) => {
        productSearchBoxAutoCompleteList.innerHTML = '';
        Array.from(array).map((item, key) =>{
            let option = document.createElement('option');
            option.innerText = item.name;
            productSearchBoxAutoCompleteList.appendChild(option);
        });
    }
})(jQuery);
