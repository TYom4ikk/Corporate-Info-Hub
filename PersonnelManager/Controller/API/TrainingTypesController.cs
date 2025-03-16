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
    class TrainingTypesController
    {
        private static string address = "https://localhost:7268/api/TrainingTypes";
        [HttpGet]
        public static TrainingType GetTrainingTypeById(int? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}/{id}").Result;
                var content = response.Content.ReadAsStringAsync();
                TrainingType answer =
                JsonConvert.DeserializeObject<TrainingType>(content.Result);
                return answer;
            }
        }
    }
}
