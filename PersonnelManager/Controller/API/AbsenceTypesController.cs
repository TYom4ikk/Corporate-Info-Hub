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
    class AbsenceTypesController
    {
        private static string address = "https://localhost:7268/api/AbsenceTypes";

        [HttpGet]
        public static List<AbsenceType> GetAbsenceTypes()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                List<AbsenceType> answer =
                JsonConvert.DeserializeObject<List<AbsenceType>>(content.Result);
                return answer;
            }
        }

        [HttpGet]
        public static AbsenceType GetAbsenceTypeById(short? id)
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = client.GetAsync($"{address}").Result;
                var content = response.Content.ReadAsStringAsync();
                AbsenceType answer =
                JsonConvert.DeserializeObject<AbsenceType>(content.Result);
                return answer;
            }
        }
    }
}
