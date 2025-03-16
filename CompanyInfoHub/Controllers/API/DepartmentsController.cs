using CompanyInfoHub.Models.API;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CompanyInfoHub.Controllers.API
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
    }
}
