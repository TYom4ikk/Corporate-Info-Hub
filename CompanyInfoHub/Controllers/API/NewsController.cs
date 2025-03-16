using CompanyInfoHub.Models.API;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CompanyInfoHub.Controllers.API
{
    public class NewsController
    {
        private static string address = "https://localhost:7268/api/News";
        [HttpGet]
        public static List<News> GetNews()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<News> answer =
                JsonConvert.DeserializeObject<List<News>>(content.Result);
                return answer;
            }
        }
    }
}
