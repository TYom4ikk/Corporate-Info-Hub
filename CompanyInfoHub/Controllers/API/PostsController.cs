using CompanyInfoHub.Models.API;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CompanyInfoHub.Controllers.API
{
    public static class PostsController
    {
        private static string address = "https://localhost:7268/api/Posts";
        [HttpGet]
        public static Post GetPostById(int id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                Post answer =
                JsonConvert.DeserializeObject<Post>(content.Result);
                return answer;
            }
        }
    }
}
