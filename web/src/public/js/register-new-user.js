//https://codepen.io/jdniki/pen/rewxPo
var counter = 1;
$(document).ready(function () {

    var erroEle = $('.error-message'),
        focusInput = $('.questions').find('.active');

    $('.navigation a').click(function () {
        nextMaster('navi');

        var thisInput = $('#' + $(this).attr('data-ref'));
        $('.active').removeClass('active');
        thisInput.focus().addClass('active')
        thisInput.closest('li').animate({
            marginTop: '0px',
            opacity: 1
        }, 200);
        thisInput.closest('li').prevAll('li').animate({
            marginTop: '-150px',
            opacity: 0
        }, 200)
        //                     .AddClass('done');

        thisInput.closest('li').nextAll('li').animate({
            marginTop: '150px',
            opacity: 0
        }, 200)
        //                    .RemoveClass('done');
        errorMessage(erroEle, '', 'hidden', 0);

    });

    if (focusInput.val() != '') {
        $('#next-page').css('opacity', 1);
    }

    $(document).keypress(function (event) {
        if (event.which == 13) {
            nextMaster('keypress');
            event.preventDefault();
        }

        $('#next-page').click(function () {
            var focusInput = $('.questions').find('.active');
            nextMaster('nextpage');

        })

    });

    function nextMaster(type) {
        var focusInput = $('.questions').find('.active');
        if (focusInput.val() != '') {
            if ((focusInput.attr('name') == 'name' || focusInput.attr('name') == 'username') && focusInput.val().length < 2) {
                errorMessage(erroEle, "isn't your " + focusInput.attr('name') + " bit small. ", 'visible', 1);
            } else if (focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) {
                errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
            } else if (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val())) {
                errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
            } else {
                if (type != 'navi') showLi(focusInput);
                $('#next-page').css('opacity', 0);
                errorMessage(erroEle, '', 'hidden', 0);
            }
        } else if (type == 'keypress') {
            errorMessage(erroEle, 'please enter your ' + focusInput.attr('name'), 'visible', 1);
        }

    }

    $("input[type='text']").keyup(function (event) {
        var focusInput = $(this);
        if (focusInput.val().length > 1) {
            if ((focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) ||
                (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val()))) {
                $('#next-page').css('opacity', 0);
            } else {
                $('#next-page').css('opacity', 1);
            }

        } else {
            $('#next-page').css('opacity', 0);
        }
    });

    $("#password").keyup(function (event) {
        var focusInput = $(this);
        $("#viewpswd").val(focusInput.val());
        if (focusInput.val().length > 1) {
            $('#next-page').css('opacity', 1);
        }
    });

    $('#signup').click(function () {
        /*
        $('.navigation').fadeOut(400).css({
            'display': 'none'
        });
        $('#sign-form').fadeOut(400).css({
            'display': 'none'
        });
        $(this).fadeOut(400).css({
            'display': 'none'
        });
        $('#wf').animate({
            opacity: 1,
            marginTop: '1em'
        }, 500).css({
            'display': 'block'
        });
        */
        $.ajax({
            url: `${window.location.origin}/register-new-user`,
            method: "POST",
            dataType: "json",
            async: false,
            data: {
                fname: $('#name').val(),
                email: $('#email').val(),
                password: $('#viewpswd').val(),
                repassword: $('#viewpswd').val(),
                phone: $('#phone').val(),
            },
            success: function (data) {
                $('.navigation').fadeOut(400).css({
                    'display': 'none'
                });
                $('#sign-form').fadeOut(400).css({
                    'display': 'none'
                });
                $(this).fadeOut(400).css({
                    'display': 'none'
                });
                $('#wf').animate({
                    opacity: 1,
                    marginTop: '1em'
                }, 500).css({
                    'display': 'block'
                });
                //window.location.href = "/login";
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
                alert(JSON.parse(xhr.responseText).message);
            }
        });

    });

    $('#show-pwd').mousedown(function () {
        $(this).toggleClass('view').toggleClass('hide');
        $('#password').css('opacity', 0);
        $('#viewpswd').css('opacity', 1);
    }).mouseup(function () {
        $(this).toggleClass('view').toggleClass('hide');
        $('#password').css('opacity', 1);
        $('#viewpswd').css('opacity', 0);
    });

});

function showLi(focusInput) {

    focusInput.closest('li').animate({
        marginTop: '-150px',
        opacity: 0
    }, 200);

    //console.log(focusInput.closest('li'));

    if (focusInput.attr('id') == 'viewpswd') {
        $("[data-ref='" + focusInput.attr('id') + "']")
            .addClass('done').html('password');
        //                    .html(Array(focusInput.val().length+1).join("*"));
    } else {
        $("[data-ref='" + focusInput.attr('id') + "']").addClass('done').html(focusInput.val());
    }

    focusInput.removeClass('active');
    counter++;

    var nextli = focusInput.closest('li').next('li');

    nextli.animate({
        marginTop: '0px',
        opacity: 1
    }, 200);

    nextli.find('input').focus().addClass('active');

}

function errorMessage(textmeg, appendString, visib, opaci) {
    textmeg.css({
        visibility: visib
    }).animate({
        opacity: opaci
    }).html(appendString)
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validatePhone(phone) {
    var re = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
    return re.test(phone);
}



/*
$(document).on('click', '#registerBtn', function (e) {
    $('#response-message').text('');
    e.preventDefault();
    let email = $("#email").val();
    let pass = $("#pass").val();
    let repass = $("#re-pass").val();
    let fname = $("#first-name").val();
    let lname = $("#last-name").val();
    $.ajax({
        url: `${window.location.origin}/register-new-user`,
        method: "POST",
        dataType: "json",
        data: {
            first_name: fname,
            last_name: lname,
            email: email,
            password: pass,
            repassword: repass,
        },
        success: function (data) {
            alert("Create a new account succeeds!");
            window.location.href = "/login";
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            $('#response-message').text(JSON.parse(xhr.responseText).message);
        }
    });
});






//default return false, return true if has errors
function validateInput(email, password, passwordConfirmation) {
    //check email
    const EMAIL_REG = /[a-zA-Z][a-zA-Z0-9_\.]{1,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}/g;
    if (email.match(EMAIL_REG)) {
        $("#email").removeClass("is-invalid");
    } else {//empty email input or invalid email
        $("#email").addClass("is-invalid");
    }

    //check password
    if (password.length > 2) {
        $("#password").removeClass("is-invalid");
    } else {
        $("#password").addClass("is-invalid");
    }

    //check passwordConfirmation
    if (passwordConfirmation === password) {
        $("#passwordConfirmation").removeClass("is-invalid");
    } else {
        $("#passwordConfirmation").addClass("is-invalid");
    }

    if (!email.match(EMAIL_REG) || password.length <= 2 || password !== passwordConfirmation)
        return true; //has errors

    return false;
}

function handleClickRegisterBtn() {
    $("#registerBtn").on("click", function (event) {
        event.preventDefault();

        let email = $("#email").val();
        let pass = $("#pass").val();
        let repass = $("#re-pass").val();
        let fname = $("#first-name").val();
        let lname = $("#last-name").val();

        //validate input
        let check = validateInput(email, password, repass);

        if (!check) {
            //send data to node server with ajax
            //url map to http://localhost/register-new-user
            $.ajax({
                url: `${window.location.origin}/register-new-user`,
                method: "POST",
                data: {
                    first_name: fname,
                    last_name: lname,
                    email: email,
                    password: pass,
                    repass: repass,
                },
                success: function (data) {
                    alert("Create a new account succeeds!");
                    window.location.href = "/login";
                },
                error: function (err) {
                    alert(err.responseText);
                }
            });
        }
    });
}

$(document).ready(function () {
    handleClickRegisterBtn();
});
*/