namespace CompanyInfoHub.Models.ViewModels
{
    public class WorkerCardModel
    {
        public long Id { get; set; }
        public int DepartmentId { get; set; }

        public string LastName { get; set; } = null!;

        public string FirstName { get; set; } = null!;

        public string? MiddleName { get; set; }

        public string? WorkPhoneNumber { get; set; }

        public string? Cabinet { get; set; }

        public string? CorporateEmail { get; set; }

        public int PostId { get; set; }

        public DateTime BirthDate { get; set; }

        public long? LeaderId { get; set; }

        public long? HelperId { get; set; }

        public string? PersonalPhoneNumber { get; set; }

        public string? ExtraInfo { get; set; }
    }
}