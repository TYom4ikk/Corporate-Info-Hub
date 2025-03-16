namespace PersonnelManager.Model
{
    public partial class TrainingType
    {
        public short Id { get; set; }

        public string Name { get; set; } = null!;

        public virtual ICollection<Training> Training { get; set; } = new List<Training>();
    }
}