namespace CompanyInfoHub.Models.API
{
    public partial class Post
    {
        public short Id { get; set; }

        public string Name { get; set; } = null!;

        public virtual ICollection<Worker> Workers { get; set; } = new List<Worker>();
    }
}