(function ($) {
    "use script";
    var sizeBtns = document.querySelectorAll('.productSizeBtn');
    Array.from(sizeBtns).map((item, key)=>{
        btn = item;
        if (btn.classList.contains('active')){
            document.querySelector('#productSize').value = btn.getAttribute('data-role');
        }
        btn.addEventListener('click', function () {
            Array.from(sizeBtns).map((item, key)=>{
                item.classList.remove('active')
            });
            this.classList.add('active');
            document.querySelector('#productSize').value = this.getAttribute('data-role');
        })
    });
    var colorBtns = document.querySelectorAll('.productColorBtn');
    Array.from(colorBtns).map((item, key)=>{
        btn = item;
        if (btn.classList.contains('active')){
            document.querySelector('#productColor').value = btn.getAttribute('data-role');
        }
        btn.addEventListener('click', function () {
            Array.from(colorBtns).map((item, key)=>{
                item.classList.remove('active')
            });
            this.classList.add('active');
            document.querySelector('#productColor').value = this.getAttribute('data-role');
        })
    })
})(jQuery);
