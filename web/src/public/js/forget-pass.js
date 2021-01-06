$(document).ready(function () {
});

$(document).on('click', '#forgetPassBtn', function (e) {
    $.ajax({
        async: false, type: 'POST', url: "forget-pass", timeout: 5000,
        data: {
            email: $('#email').val()
        },
        success: function (data) {
            alert('success : ' + data)
            window.location.href = "/login";
        }, error: function (xhr, textStatus, err) {
            alert('Mail not found');
        }
    });
});