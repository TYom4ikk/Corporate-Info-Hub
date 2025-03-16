using CompanyInfoHub.Models.API;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CompanyInfoHub.Controllers.API
{
    public class EventsController
    {
        private static string address = "https://localhost:7268/api/Events";
        [HttpGet]
        public static List<Event> GetEvents()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Event> answer =
                JsonConvert.DeserializeObject<List<Event>>(content.Result);
                return answer;
            }
        }
    }
}
