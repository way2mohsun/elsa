

$(document).ready(function () {
});

$(document).on('click', '#resetPassBtn', function (e) {
    $('#response-message').text('');
    $.ajax({
        async: false, type: 'POST', url: "reset-pass", timeout: 5000,
        data: {
            password: $('#pass').val(),
            repassword: $('#re-pass').val(),
            token: getUrlParameter('token'),
            email: getUrlParameter('email'),
        },
        success: function (data) {
            alert('success : ' + data.message)
            window.location.href = "/login";
        }, error: function (xhr, status, error) {
            console.log(xhr.responseText);
            $('#response-message').text(JSON.parse(xhr.responseText).message);
        }
    });
});
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};