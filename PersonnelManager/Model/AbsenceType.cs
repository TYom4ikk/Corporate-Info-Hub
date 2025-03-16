namespace PersonnelManager.Model
{
    public partial class AbsenceType
    {
        public short Id { get; set; }

        public string Name { get; set; } = null!;

        public virtual ICollection<Absence> Absences { get; set; } = new List<Absence>();
    }
}