using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WeatherApiWrapper;
using System.Web.Script.Serialization;
using System.Json;

namespace ApiApplication.Controllers
{
    public class WeatherApiController : ApiController
    {
        /// <summary>
        /// Gets WeatherApiResponse object and returns it as a json object
        /// </summary>
        /// <returns>Json object in HttpResponseMessage</returns>
        public HttpResponseMessage Get()
        {
            var weather = new WeatherApi();
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(weather.getWeather("30.4704", "-87.2329"));
            return new HttpResponseMessage()
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };
        }
    }
}