using PersonnelManager.Model;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http;

namespace PersonnelManager.Controller.API
{
    public static class DepartmentsController
    {
        private static string address = "https://localhost:7268/api/Departments";
        [HttpGet]
        public static Department GetDepartmentById(int? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                Department answer =
                JsonConvert.DeserializeObject<Department>(content.Result);
                return answer;
            }
        }
        [HttpGet]
        public static List<Department> GetDepartments()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Department> answer =
                JsonConvert.DeserializeObject<List<Department>>(content.Result);
                return answer;
            }
        }
    }
}
