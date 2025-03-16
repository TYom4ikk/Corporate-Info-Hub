namespace PersonnelManager.Model
{

    public partial class Absence
    {
        public long Id { get; set; }

        public int WorkerId { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public short TypeId { get; set; }

        public int? ReplacementWorkerId { get; set; }

        public virtual AbsenceType Type { get; set; } = null!;

        public virtual Worker Worker { get; set; } = null!;
    }
}