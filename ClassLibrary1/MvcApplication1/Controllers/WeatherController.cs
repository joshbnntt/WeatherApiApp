using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using WeatherApiWrapper;

namespace ApiApplication.Controllers
{
    public class WeatherController : Controller
    {
        
        /// <summary>
        /// Gets the WeatherResponse object from the WeatherApi wrapper and returns a view
        /// </summary>
        /// <returns>View to display weather</returns>
        public ActionResult Index()
        {
            var weatherApi = new WeatherApi();
            var weather = weatherApi.getWeather("30.4704", "-87.2329");

            return View(weather);
        }
    }
}
