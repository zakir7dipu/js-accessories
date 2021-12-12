(function ($) {
    "use script";
    // header search
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
    };

    // search by attribute
    const searchByAttributeBox = document.querySelector('#searchByAttributeBox');
    const searchByAttributeItems = document.querySelectorAll('.attributeItem');
    Array.from(searchByAttributeItems).map((item, key) => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            searchByAttributeBox.querySelector('input[name="quarry_string"]').value = item.innerText;
            searchByAttributeBox.submit();
        });
    });

    // search by feature
    const searchByFeatureBox = document.querySelector('#searchByFeatureBox');
    const searchByFeatureBoxItem = searchByFeatureBox.querySelector('select');
    searchByFeatureBoxItem.addEventListener('change', (e) => {
        e.preventDefault();
        searchByFeatureBox.submit();
    })
})(jQuery);
