/*
$(document).on('submit', '#login-form', function (e) {
    var failure = false;
    var out;
    $('#msg').empty();
    $.ajax({
        async: false, type: 'POST', url: "/login", timeout: 5000,
        data: {
            email: $('#email').val(),
            password: $('#password').val()
        },
        success: function (data) {
            //window.location.href = "/";
        }, error: function (xhr, textStatus, err) {
            failure = true;
        }
    });
    if (failure) {
        $('#msg').text('Username or Password is not correct!!!');
        return false;
    }
});
*/

function handleLoginBtn() {
    $("#loginBtn").on("click", function (event) {
        event.preventDefault();
        let email = $("#email").val();
        let password = $("#password").val();

        $.ajax({
            url: `${window.location.origin}/login`,
            method: "POST",
            data: { email: email, password: password },
            success: function (data) {
                window.location.href = "/";
            },
            error: function (err) {
                alert("Your email or password entered is incorrect. Please try again!");
                $('#msg').val('Usename or password is wrong.');
            }
        })
    });
}
$(document).ready(function () {
    handleLoginBtn();
});
