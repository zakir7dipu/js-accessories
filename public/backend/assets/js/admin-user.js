(function ($) {
    "use script";
    const adminUserAddBtn = document.querySelector('.adminUserAddBtn');
    adminUserAddBtn.addEventListener('click', (e) => {
        e.preventDefault();
        $('#userModalCenter').modal('show');
    });
})(jQuery);
