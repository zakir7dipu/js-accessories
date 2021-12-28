(function ($) {
    "use script";
    const replyBtn = document.querySelectorAll('.contactMessageReplyBtn');
    Array.from(replyBtn).map((item, key) => {
        item.addEventListener('click',() => {
            getMessage(item.getAttribute('data-id'));
        })
    });

    const getMessage = (message) => {
        $.ajax({
            type: 'get',
            url: `/admin/contact-message/${message}`,
            success:function (data) {
                messageWindow(data);
                // $('#replyMailModal').modal('show');
            }
        })
    };

    const messageWindow = (data) => {
        let form = document.getElementById('replyMailModal').querySelector('form');
        let submitBtn = document.getElementById('replyMailModal').querySelector('.submitBtn');
        form.querySelector('input[name="to_email"]').value = data.contact_email;
        form.querySelector('textarea[name="message"]').innerHTML = data.contact_message;
        form.action = data.url;
        $('#replyMailModal').modal('show');
        submitBtn.addEventListener('click', () => {
            form.submit();
        })
    }
})(jQuery);
