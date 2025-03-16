namespace CompanyInfoHub.Models.API
{
    public partial class News
    {
        public long Id { get; set; }

        public string Title { get; set; } = null!;

        public string Description { get; set; } = null!;

        public int? AuthorId { get; set; }

        public DateOnly CreationDate { get; set; }

        public string ImagePath { get; set; } = null!;

        public virtual Worker? Author { get; set; }
    }
}