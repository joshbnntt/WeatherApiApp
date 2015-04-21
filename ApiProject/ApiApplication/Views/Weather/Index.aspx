<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<WeatherApiWrapper.WeatherApiResponse>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Weather | Pensacola, Fl </title>

    <link rel="stylesheet" href="<%= Url.Content("~/Content/bootstrap/css/bootstrap.css") %>" />
    <link rel="stylesheet" href="<%= Url.Content("~/Content/bootstrap/css/bootstrap-theme.min.css") %>" />
    <link rel="stylesheet" href="<%= Url.Content("~/Content/weather-icons-master/css/weather-icons.css") %>" />
    <style>
        .thumbnail {
            height:300px;
            padding:10px;
        }
    </style>
           
</head>
<body>
    <div class="container">
        <div class="row"  style="margin-top:50px;">
            <div class="col-md-3 col-md-offset-1">
                <h1>Pensacola, FL</h1>
            </div>
        </div>
        <% if(Model != null) { %>
            <% if (Model.alerts != null) { %>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <% for(int i = 0; i < Model.alerts.Count; i++) { %>
                      <div class="alert alert-danger" role="alert">
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="row">
                            <p><strong><%: Html.DisplayFor(modelItem => Model.alerts[i].title)%></strong></p>
                            <p class="currenttime"><%: Html.DisplayFor(modelItem => Model.alerts[i].expires)%></p>
                            <p><%: Html.DisplayFor(modelItem => Model.alerts[i].description)%></p>
                        </div>  
                      </div>
                    <% } %>
                </div>
            </div>
            <% } %>

            <%-- begin currently --%>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <div class="thumbnail">
                            <i class="wi <%= Html.DisplayFor(modelItem => Model.currently.icon) %>"></i>
                            <div class="caption">
                            <h3 class="currenttime"><%: Html.DisplayFor(modelItem => Model.currently.time) %></h3>
                            <p><%: Html.DisplayFor(modelItem => Model.currently.summary) %></p>
                                <p><strong>Temperature: </strong><%: Html.DisplayFor(modelItem => Model.currently.temperature) %><i class="wi wi-fahrenheit"></i></p> 
                                <p><strong>Chance of Rain: </strong><%: Html.DisplayFor(modelItem => Model.currently.precipProbability) %></p>                       
                            </div>
                        </div>
                    </div>
                </div>
            </div> <%--end currently--%>
            <div class="row" style="margin-top:25px;">
                <div class="col-md-10 col-md-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <ul class="nav nav-pills nav-justified">
                                      <li role="presentation" id="minutelyPill" class="active"><a href="#">Minutely</a></li>
                                      <li role="presentation" id="hourlyPill"><a href="#">Hourly</a></li>
                                      <li role="presentation" id="dailyPill"><a href="#">Daily</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%-- begin minutely --%>
                        <div class="panel-body" id="minutely">
                            <div class="row">
                                <div class="col-md-2">
                                    <i class="wi <%= Html.DisplayFor(modelItem => Model.minutely.icon) %>"></i>
                                </div>
                                <div class="col-md-6">
                                    <%: Html.DisplayFor(modelItem => Model.minutely.summary) %>
                                </div>
                            </div>
                            <% if (Model.minutely.data.Count > 0) { %>
                                <div class="row" style="margin-top:15px;">
                                <%for (int j = 0; j < Model.minutely.data.Count; j += 1) { %>
                                    <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                      <div class="caption">
                                        <p><i class="glyphicon glyphicon-time" style="font-size:14pt;"></i> <span class="currenttime"><%: Html.DisplayFor(modelItem => Model.minutely.data[j].time) %></span></p>
                                        <p><i class="wi rain" style="font-size:14pt;"></i> <span class="rainIntensity"><%: Html.DisplayFor(modelItem => Model.minutely.data[j].precipIntensity) %></span></p>                        
                                      </div>
                                    </div>
                                    </div>
                                <% } %>
                                </div>
                            <% } else {%>
                                <div class="row">
                                    <h3>There is no information for minutely right now.</h3>
                                </div>
                            <% } %>
                        </div><%--end minutely--%>
             
                        <%-- begin hourly --%>
                        <div class="panel-body" id="hourly" style="display:none;">
                            <div class="row">
                                <div class="col-md-2">
                                    <i class="wi <%= Html.DisplayFor(modelItem => Model.hourly.icon) %>"></i>
                                </div>
                                <div class="col-md-6">
                                    <%: Html.DisplayFor(modelItem => Model.hourly.summary) %>
                                </div>
                            </div>
                            <% if(Model.hourly.data.Count > 0) { %>
                                <div class="row" style="margin-top:15px;">
                                <%for(int j = 0; j < Model.hourly.data.Count; j+=1) { %>
                                  <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                      <i class="wi <%= Html.DisplayFor(modelItem => Model.hourly.data[j].icon) %>"></i>
                                      <div class="caption">
                                        <h3 class="currenttime"><%: Html.DisplayFor(modelItem => Model.hourly.data[j].time) %></h3>
                                          <p><strong>Temperature: </strong><%: Html.DisplayFor(modelItem => Model.hourly.data[j].temperature) %><i class="wi wi-fahrenheit"></i></p>
                                        <p><%: Html.DisplayFor(modelItem => Model.hourly.data[j].summary) %></p>                        
                                      </div>
                                    </div>
                                  </div>
                                <% } %>
                                </div>
                            <% } else {%>
                            <div class="row">
                                <h3>There is no information for hourly right now.</h3>
                            </div>
                        <% } %>
                        </div><%--end hourly--%>
                        <%-- begin daily --%>
                        <div class="panel-body" id="daily" style="display:none;">
                            <div class="row">
                                <div class="col-md-2">
                                    <i class="wi <%= Html.DisplayFor(modelItem => Model.daily.icon) %>"></i>
                                </div>
                                <div class="col-md-6">
                                    <%: Html.DisplayFor(modelItem => Model.daily.summary) %>
                                </div>
                            </div>
                            <% if(Model.daily.data != null) { %>
                                <div class="row" style="margin-top:15px;">
                                <%for(int j = 0; j < Model.daily.data.Count; j+=1) { %>
                                  <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                      <i class="wi <%= Html.DisplayFor(modelItem => Model.daily.data[j].icon) %>"></i>
                                      <div class="caption">

                                        <h3 class="currenttime"><%: Html.DisplayFor(modelItem => Model.daily.data[j].time) %></h3>
                                        <p><strong>Max Temperature: </strong><%: Html.DisplayFor(modelItem => Model.daily.data[j].temperatureMax) %><i class="wi wi-fahrenheit"></i></p>
                                        <p><strong>Min Temperature: </strong><%: Html.DisplayFor(modelItem => Model.daily.data[j].temperatureMin) %><i class="wi wi-fahrenheit"></i></p>
                                        <p><%: Html.DisplayFor(modelItem => Model.daily.data[j].summary) %></p>                        
                                      </div>
                                    </div>
                                  </div>
                                  <% } %>
                                </div>
                            <% } else {%>
                                <div class="row">
                                    <h3>There is no information for daily right now.</h3>
                                </div>
                            <% } %>

                        </div><%--end daily--%>
                    </div>
                </div> 
            </div>
        <% } else { %>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h1>No Forecast To Display At This Time</h1>
                </div>
            </div>
       <% } %>
    </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<%= Url.Content("~/Content/bootstrap/js/bootstrap.min.js") %>"></script>
    <script src="<%= Url.Content("~/Scripts/weather.js") %>"></script>
   
</body>
</html>
