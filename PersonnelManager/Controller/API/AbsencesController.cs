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
    class AbsencesController
    {
        private static string address = "https://localhost:7268/api/Absences";

        [HttpGet]
        public static List<Absence> GetAbsences()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Absence> answer =
                JsonConvert.DeserializeObject<List<Absence>>(content.Result);
                return answer;
            }
        }

        [HttpGet]
        public static List<Absence> GetAbsenceCalendarsByWorkerId(int? workerId)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<Absence> answer =
                JsonConvert.DeserializeObject<List<Absence>>(content.Result);
                return answer.Where(absence => absence.WorkerId == workerId).ToList();
            }
        }
    }
}
