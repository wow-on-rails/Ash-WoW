$(document).ready(function()
{

    $('.buy-points-popup').bind('click', function(e)
    {
        e.preventDefault();
        $('#choice-payment-hidden').bPopup();
    });

    $('#allopass-popup').bind('click', function(e)
    {
        e.preventDefault();
        $('#choice-payment-hidden').bPopup().close();
        $('#allopass-frame-hidden').bPopup();
    });

    $('#pw-popup').bind('click', function(e)
    {
        e.preventDefault();
        $('#choice-payment-hidden').bPopup().close();
        $('#pw-frame-hidden').bPopup();
    });

    $('#hide-modal').bind('click', function(e)
    {
        if ($('#modal-error').length > 0)
        {
            $('#modal-error').modal('hide');
        }
        if ($('#modal-success').length > 0)
        {
            $('#modal-success').modal('hide');
        }
        if ($('#modal-warning').length > 0)
        {
            $('#modal-warning').modal('hide');
        }
    });

    if ($('#modal-error').length > 0)
    {
        $('#modal-error').modal('show');
    }
    if ($('#modal-success').length > 0)
    {
        $('#modal-success').modal('show');
    }
    if ($('#modal-warning').length > 0)
    {
        $('#modal-warning').modal('show');
    }

    // disable sorting of delete/active column
    $('#news-table').dataTable(
    {
        "order" : [[2, "desc"]],
        "aoColumnDefs" : [
        {
            'bSortable' : false,
            'aTargets' : [3, 4]
        }]
    });

    $('#category-table').dataTable(
    {
        "aoColumnDefs" : [
        {
            'bSortable' : false,
            'aTargets' : [3]
        }]
    });

    $('#faq-table').dataTable(
    {
        "order" : [[0, "desc"]],
        "aoColumnDefs" : [
        {
            'bSortable' : false,
            'aTargets' : [3]
        }]
    });

    $('#items-table').dataTable(
    {
        "aoColumnDefs" : [
        {
            'bSortable' : false,
            'aTargets' : [3, 4]
        }]
    });

    // $('table tr').click(function() {
    // window.location = $(this).attr('href');
    // return false;
    // });

    // Back office menu active
    var activeurl = window.location.href;
    a = activeurl.split("/");
    end = a[a.length - 1];

    $('a[href$="' + end + '"]').parent('li').addClass('active');

    $('#ES-tab').hide();
    $('#US-tab').hide();
    $('#DE-tab').hide();
    $('#RU-tab').hide();

    $('#news-lang a').click(function()
    {
        console.log("id " + this.id);
        if (this.id == 'fr')
        {
            $('#ES-tab').hide();
            $('#US-tab').hide();
            $('#RU-tab').hide();
            $('#DE-tab').hide();
            $('#FR-tab').show();
        }
        else if (this.id == 'us')
        {
            $('#ES-tab').hide();
            $('#FR-tab').hide();
            $('#RU-tab').hide();
            $('#DE-tab').hide();
            $('#US-tab').show();
        }
        else if (this.id == 'es')
        {
            $('#US-tab').hide();
            $('#FR-tab').hide();
            $('#RU-tab').hide();
            $('#DE-tab').hide();
            $('#ES-tab').show();
        }
        else if (this.id == 'ru')
        {
            $('#US-tab').hide();
            $('#FR-tab').hide();
            $('#RU-tab').show();
            $('#DE-tab').hide();
            $('#ES-tab').hide();
        }
        else if (this.id == 'de')
        {
            $('#US-tab').hide();
            $('#FR-tab').hide();
            $('#RU-tab').hide();
            $('#DE-tab').show();
            $('#ES-tab').hide();
        }

        $("#news-lang li").each(function()
        {
            $(this).removeClass("active");
        });
        $(this).parent('li').addClass("active");
    });

    $(document).ready(function()
    {
        updateTimer();
        setInterval(updateTimer, 1000);
    });

    screenshotPreview();
    faqHideAndShow(null);

    // Faq
    $(".faq-lst .answer").hide();

    $(".faq-lst .question a").click(function()
    {
        if ($(this).next(".answer:visible").length != 0)
        {
            $(this).next("ul.subMenu").slideUp("normal", function()
            {
                $(this).parent().removeClass("open");
            });
        }
        else
        {
            $(".faq-lst .answer").slideUp("normal", function()
            {
                $(this).parent().removeClass("open");
            });

            $(this).next(".faq-lst .answer").slideDown("normal", function()
            {
                $(this).parent().addClass("open");
            });
        }
    });

    if (readCookie("register-check") != false)
    {
        $("#register-popup").hide();
        $("#register2-popup").hide();
    }

    /// Close register pop-up
    $("#register-pop-cross").click(function()
    {
        document.cookie = "register-check=disable; expires=Thu, 18 Dec 2100 12:00:00 UTC";
        $("#register-popup").hide();
    });

     /// Close register pop-up
    $("#register2-pop-cross").click(function()
    {
        document.cookie = "register-check=disable; expires=Thu, 18 Dec 2100 12:00:00 UTC";
        $("#register2-popup").hide();
    });

    /// Download launcher
    var l_CurrentURL = document.location.toString().toLowerCase();
    if (l_CurrentURL.indexOf("/register/launcher") != -1)
    {
        jQuery.get(window.location.origin + '/ajax/launcherAjax/');
        window.location.assign("http://launcher.ashran.com/download/AshranLauncher.exe");
    }
});

function faqHideAndShow(p_Var)
{
    $('#lst-launcher').hide();
    $('#lst-ingame').hide();
    $('#lst-shop').hide();
    $('#lst-login').hide();

    switch (p_Var)
    {
        case 'launcher':
            $('#lst-launcher').show();
            break;
        case 'connexion':
            $('#lst-login').show();
            break;
        case 'shop':
            $('#lst-shop').show();
            break;
        case 'ingame':
            $('#lst-ingame').show();
            break;
    }
}

this.screenshotPreview = function()
{
    /* CONFIG */

    xOffset = 10;
    yOffset = 30;

    // these 2 variable determine popup's distance from the cursor
    // you might want to adjust to get the right result

    /* END CONFIG */
    $("a.screenshot").hover(function(e)
    {
        this.t = this.title;
        this.title = "";
        var c = (this.t != "") ? "<br/>" + this.t : "";
        $("body").append("<p id='screenshot'><img src='" + this.rel + "' alt='url preview' class='screen-img'/>" + c + "</p>");
        $("#screenshot").css("top", (e.pageY - xOffset) + "px").css("left", (e.pageX + yOffset) + "px").fadeIn("fast");
    }, function()
    {
        this.title = this.t;
        $("#screenshot").remove();
    });
    $("a.screenshot").mousemove(function(e)
    {
        $("#screenshot").css("top", (e.pageY - xOffset) + "px").css("left", (e.pageX + yOffset) + "px");
    });
};

var g_TabVote = [];

function updateTimer()
{
    $(".timerVote").each(function(index)
    {

        if (g_TabVote[index] == undefined)
            g_TabVote[index] = $(this).text();

        g_TabVote[index] = g_TabVote[index] - 1;
        var l_StringFinal = convertTimestampToHumanShort(g_TabVote[index]);
        console.log(l_StringFinal);
        $(this).text(l_StringFinal);
        $(this).show();
    });

    var end = new Date('03/23/2015 00:00 AM');

    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;

    var now = new Date();
    var distance = end - now;
    if (distance < 0)
    {
        $("#register-text-2").html("EXPIRED!");
        return;
    }

    var days = Math.floor(distance / _day);
    var hours = Math.floor((distance % _day) / _hour);
    var minutes = Math.floor((distance % _hour) / _minute);
    var seconds = Math.floor((distance % _minute) / _second);

    var l_Timer = days + ":" + hours + ":" + minutes + ":" + seconds;

    /// register-text-2
    $("#register-text-2").html(l_Timer);
}

function vote(text)
{

    if (jQuery.isNumeric(text))
    {
        jQuery.get(window.location.origin + '/ajax/vote/' + text, function(data)
        {
            jQuery('#result_vote').html(data);
            $('#vote_' + text).removeAttr('href');
            $('#vote_' + text).removeAttr('target');
            $('#vote_' + text).removeAttr('onclick');
        }, 'html');
    }
}

function convertTimestampToHumanShort(p_Timestamp)
{
    var l_Hours = Math.floor(p_Timestamp / 3600);
    var l_Minutes = Math.floor((p_Timestamp / 60) % 60);
    var l_Seconds = p_Timestamp % 60;

    var l_Hour = "";
    var l_Min = "";
    var l_Sec = "";

    if (l_Hours > 0)
    {
        if (String(l_Hours).length == 1)
            l_Hour = "0" + l_Hours + " h ";
        else
            l_Hour = l_Hours + " h ";
    }
    if (l_Minutes > 0)
    {
        if (String(l_Minutes).length == 1)
            l_Min = "0" + l_Minutes + " m ";
        else
            l_Min = l_Minutes + " m ";
    }
    if (l_Seconds > 0)
    {
        if (String(l_Seconds).length == 1)
            l_Sec = "0" + l_Seconds + " s ";
        else
            l_Sec = l_Seconds + " s ";
    }

    var l_Retour = l_Hour.concat(l_Min.concat(l_Sec));

    return l_Retour;
}

function updateLevelCost()
{
    var persoID = $('#character').val();
    var level = $('#level').val();

    var cost = 0;
    if (level != -1 && persoID != -1)
    {
        switch (level)
        {
            case '75':
                cost = 40;
                break;
            case '80':
                cost = 60;
                break;
            case '85':
                cost = 75;
                break;
            case '90':
                cost = 85;
                break;
            case '100':
                cost = 120;
                break;
        }
    }
    $('#price-level').html(cost);
}

function link(p_Link)
{
    jQuery.get(window.location.origin + '/ajax/download/' + p_Link);
}

function readCookie(name)
{
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++)
    {
        var c = ca[i];
        while (c.charAt(0) == ' ')
        c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return false;
}

function toggleCheckbox(id)
{
    document.getElementById(id).checked = !document.getElementById(id).checked;
}