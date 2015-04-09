$(document).ready(function()
{
    // Email
    $("#email_validation").focusout(function()
    {
        var l_Data =
        {
            csrf_test_name : readCookie('csrf_cookie_name'),
            email : $("#email_validation").val(),
        };

        $.ajax(
        {
            url : window.location.origin + '/validation/email/',
            type : 'POST',
            data : l_Data,
            success : function(msg)
            {
                $('#error_email').text(stripHTML(msg));
            }
        });
    });

    // email2_validation 2
    $("#email2_validation").focusout(function()
    {
        var l_Data =
        {
            csrf_test_name : readCookie('csrf_cookie_name'),
            email : $("#email_validation").val(),
            email2 : $("#email2_validation").val(),
        };

        $.ajax(
        {
            url : window.location.origin + '/validation/email_validation/',
            type : 'POST',
            data : l_Data,
            success : function(msg)
            {
                $('#error_email2').text(stripHTML(msg));
            }
        });
    });

    // paswword
    $("#password_validation").focusout(function()
    {
        var l_Data =
        {
            csrf_test_name : readCookie('csrf_cookie_name'),
            password : $("#password_validation").val()
        };

        $.ajax(
        {
            url : window.location.origin + '/validation/password/',
            type : 'POST',
            data : l_Data,
            success : function(msg)
            {
                $('#error_password').text(stripHTML(msg));
            }
        });
    });

    // paswword validation
    $("#password2_validation").focusout(function()
    {
        var l_Data =
        {
            csrf_test_name : readCookie('csrf_cookie_name'),
            password : $("#password_validation").val(),
            password2 : $("#password2_validation").val()
        };

        $.ajax(
        {
            url : window.location.origin + '/validation/password_validation/',
            type : 'POST',
            data : l_Data,
            success : function(msg)
            {
                $('#error_password2').text(stripHTML(msg));
            }
        });
    });

    // question response
    $("#response_validation").focusout(function()
    {
        var l_Data =
        {
            csrf_test_name : readCookie('csrf_cookie_name'),
            response : $("#response_validation").val()
        };

        $.ajax(
        {
            url : window.location.origin + '/validation/response/',
            type : 'POST',
            data : l_Data,
            success : function(msg)
            {
                $('#error_response').text(stripHTML(msg));
            }
        });
    });

});

function stripHTML(dirtyString)
{
    var container = document.createElement('div');
    container.innerHTML = dirtyString;
    return container.textContent || container.innerText;
}