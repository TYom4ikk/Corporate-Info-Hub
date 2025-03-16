using CompanyInfoHub.Controllers.API;
using CompanyInfoHub.Models.API;
using CompanyInfoHub.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using QRCoder;
using System.Diagnostics;
using System.Text;

namespace CompanyInfoHub.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

    
        public void GenerateQRCode(string stringData)
        {
            QRCodeGenerator generator = new QRCodeGenerator();
            byte[] data = Encoding.UTF8.GetBytes(stringData);

            var qrcodeData = generator.CreateQrCode(data, QRCodeGenerator.ECCLevel.Q);

            PngByteQRCode png = new PngByteQRCode(qrcodeData);
            byte[] qrCodeAsPng = png.GetGraphic(20);
            System.IO.File.WriteAllBytes(@"wwwroot/img/qrcode.png", qrCodeAsPng);

        }

        public IActionResult Index(string searchString)
        {
            List<Worker> workers = WorkersController.GetWorkers();
            var eventCalendars = EventsController.GetEvents().AsQueryable();

            if (!string.IsNullOrEmpty(searchString))
            {
                workers = workers.Where(w => w.FullName.Contains(searchString)).ToList();
            }

            IndexViewModel model = new IndexViewModel();

            model.workers = workers; //GetWorkers();
            foreach (var worker in model.workers)
            {
                worker.Department = DepartmentsController.GetDepartmentById(worker.DepartmentId);
                worker.Post = PostsController.GetPostById(worker.PostId);
            }

            model.eventCalendars = EventsController.GetEvents();

            foreach (var ec in model.eventCalendars)
            {
                if (ec.ResponsibleDepartmentId != null)
                {
                    ec.ResponsibleDepartment = DepartmentsController.GetDepartmentById(ec.ResponsibleDepartmentId);
                }
                if (ec.ResponsibleWokrerId != null)
                {
                    ec.ResponsibleWokrer = WorkersController.GetWorkerById(ec.ResponsibleWokrerId);
                }
            }


            List<News> news_list = NewsController.GetNews();
            model.news = news_list;
            //=============TEST==============
           /* List<News> news_list = new List<News> { new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" }, };
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            news_list.Add(new News { Title = "Водители на трассе М-12", Description = "Они ехали-ехали чета там", CreationDate = DateOnly.MinValue, Id = 0, ImagePath = "wwwroot\\img\\Logo.png" });
            model.news = news_list;*/
            //===========================

            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult ParseDataAsVCard(long id)
        {

            Worker worker = WorkersController.GetWorkerDetailsById(id);
            string vCardData = "BEGIN:VCARD\n" +
                "VERSION:3.0\n" +
                $"N:{worker.FirstName}\n" +
                $"FN:{worker.LastName}\n" +
                $"ORG:{worker.Department.Name}\n" +
                $"TITLE:{worker.Post.Name}\n" +
                $"TEL;WORK;VOICE:{worker.WorkPhoneNumber}\n" +
                $"TEL;CELL:{worker.PersonalPhoneNumber}\n" +
                $"EMAIL;WORK;INTERNET:{worker.CorporateEmail}" +
                "END:VCARD";
            GenerateQRCode(vCardData);

            VCardViewModel vCardViewModel = new VCardViewModel();
            vCardViewModel.Worker = worker;
            vCardViewModel.FormatString = vCardData;

            return View(vCardViewModel);
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}