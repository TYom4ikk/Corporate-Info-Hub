using CompanyInfoHub.Models.API;

namespace CompanyInfoHub.Models.ViewModels
{
    public class IndexViewModel
    {
        public List<Worker> workers { get; set; }
        public List<Event> eventCalendars { get; set; }

        public List<News> news { get; set; }
    }
}
