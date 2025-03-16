using CompanyInfoHub.Models.API;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CompanyInfoHub.Controllers.API
{
    public static class WorkersController
    {
        private static string address = "https://localhost:7268/api/Workers";

        [HttpGet]
        public static List<Worker> GetWorkers()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Worker> answer =
                JsonConvert.DeserializeObject<List<Worker>>(content.Result);
                return answer;
            }
        }

        [HttpGet]
        public static Worker GetWorkerDetailsById(long? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                Worker answer =
                JsonConvert.DeserializeObject<Worker>(content.Result);

                answer.Post = PostsController.GetPostById(answer.PostId);
                answer.Department = DepartmentsController.GetDepartmentById(answer.DepartmentId);
                return answer;
            }
        }

        [HttpGet]
        public static Worker GetWorkerById(long? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                Worker answer =
                JsonConvert.DeserializeObject<Worker>(content.Result);
                return answer;
            }
        }

    }
}
