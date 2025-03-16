using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PersonnelManager.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace PersonnelManager.Controller.API
{
    class TrainingsController
    {
        private static string address = "https://localhost:7268/api/Trainings";

        [HttpGet]
        public static List<Training> GetTrainings()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Training> answer =
                JsonConvert.DeserializeObject<List<Training>>(content.Result);
                return answer;
            }
        }

        [HttpGet]
        public static Training GetTrainingById(long? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                Training answer =
                JsonConvert.DeserializeObject<Training>(content.Result);
                return answer;
            }
        }
        [HttpGet]
        public static List<Training> GetTrainingCalendarsByWorkerId(int? workerId)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Training> answer =
                JsonConvert.DeserializeObject<List<Training>>(content.Result);
                return answer.Where(training => training.WorkerId == workerId).ToList();
            }
        }
    }
}
