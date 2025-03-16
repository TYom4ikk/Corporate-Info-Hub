namespace CompanyInfoHub.Models.API
{
    public partial class WorkingCalendar
    {
        public short Id { get; set; }
        public DateOnly ExceptionDate { get; set; }
        public bool IsWorkingDay { get; set; }
    }
}
