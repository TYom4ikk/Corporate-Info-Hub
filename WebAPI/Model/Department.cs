using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class Department
{
    public short Id { get; set; }

    public string Name { get; set; } = null!;

    public short ParentId { get; set; }

    public int? DirectorId { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<Worker> Workers { get; set; } = new List<Worker>();
}
