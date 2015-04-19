$(".currenttime").each(function () {
    var date, formatedDate;
    date = new Date(Number($(this).text()) * 1000);
    formatedDate = date;

    $(this).replaceWith("<strong>" + formatedDate.toLocaleString() + "</strong>");
});

$(".rainIntensity").each(function () {
    var rain;
    rain = Number($(this).text()) === 0 ? "No Rain" : Number($(this).text()) <= 0.002 ? "Very Light Rain" : Number($(this).text()) <= 0.017 ? "Light Rain" : Number($(this).text()) <= 0.1 ? "Moderate Rain" : Number($(this).text()) <= 0.4 ? "Heavy Rain" : "Cats and Dogs...";
    $(this).replaceWith(rain);
});

$('.nav').on('click', '#minutelyPill', function (e) {
    e.preventDefault();
    $('#minutely').show();
    $('#hourly').hide();
    $('#daily').hide();
    $('#minutelyPill').attr('class', 'active');
    $('#hourlyPill').attr('class', '');
    $('#dailyPill').attr('class', '');
});
$('.nav').on('click', '#hourlyPill', function (e) {
    e.preventDefault();
    $('#minutely').hide();
    $('#hourly').show();
    $('#daily').hide();
    $('#minutelyPill').attr('class', '');
    $('#hourlyPill').attr('class', 'active');
    $('#dailyPill').attr('class', '');
});
$('.nav').on('click', '#dailyPill', function (e) {
    e.preventDefault();
    $('#minutely').hide();
    $('#hourly').hide();
    $('#daily').show();
    $('#minutelyPill').attr('class', '');
    $('#hourlyPill').attr('class', '');
    $('#dailyPill').attr('class', 'active');
});