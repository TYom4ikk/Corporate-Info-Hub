namespace CompanyInfoHub.Models.API
{
    public partial class EventType
    {
        public short Id { get; set; }

        public string Name { get; set; } = null!;

        public virtual ICollection<Event> Events { get; set; } = new List<Event>();
    }

}