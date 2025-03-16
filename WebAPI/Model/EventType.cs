using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class EventType
{
    public short Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();
}
