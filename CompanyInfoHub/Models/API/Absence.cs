namespace CompanyInfoHub.Models.API
{
    public partial class Absence
    {
        public long Id { get; set; }

        public int WorkerId { get; set; }

        public DateOnly? StartDate { get; set; }

        public DateOnly? EndDate { get; set; }

        public int? ReplacementWorkerId { get; set; }
        public short TypeId { get; set; }

        public virtual AbsenceType Type { get; set; } = null!;

        public virtual Worker Worker { get; set; } = null!;
    }
}