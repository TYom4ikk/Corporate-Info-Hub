using PersonnelManager.Model;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http;

namespace PersonnelManager.Controller.API
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
        [HttpGet]
        public static List<Post> GetPosts()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Post> answer =
                JsonConvert.DeserializeObject<List<Post>>(content.Result);
                return answer;
            }
        }
    }
}
