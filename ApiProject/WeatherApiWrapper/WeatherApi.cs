using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RestSharp;
using System.Web.Script.Serialization;
using JsonObject = System.Json.JsonObject;

namespace WeatherApiWrapper
{
    public class WeatherApi
    {
        private string ApiKey;
        private const string WeatherUrl = "https://api.forecast.io/forecast/";
        RestClient client;
        RestRequest request = new RestRequest("{key}/{latitude},{longitude}", Method.GET);
        
        /// <summary>
        /// Constructs a new WeatherApi object with Weather API Url and API key
        /// </summary>
        public WeatherApi()
        {
            client = new RestClient(WeatherUrl);
            
            ApiKey = "1b2d3af069ece6855d1074dbad93f9fa";
        }
        /// <summary>
        /// Makes an API get request to WeatherApi with a specific latitude and longitude
        /// </summary>
        /// <param name="latitude"></param>
        /// <param name="longitude"></param>
        /// <returns>WeatherApiResponse object</returns>
        public WeatherApiResponse getWeather(string latitude, string longitude)
        {

            request.AddUrlSegment("key", ApiKey);
            request.AddUrlSegment("latitude", latitude);
            request.AddUrlSegment("longitude", longitude);
            
            var response = client.Execute(request);
            var content = response.Content;
            var serializer = new JavaScriptSerializer();
            var weather =  serializer.Deserialize<WeatherApiResponse>(content);
            return weather;
        }

    }
}
