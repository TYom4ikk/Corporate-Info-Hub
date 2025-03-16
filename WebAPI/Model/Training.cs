using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class Training
{
    public long Id { get; set; }

    public int WorkerId { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public string TrainingName { get; set; } = null!;

    public short TypeId { get; set; }

    public virtual TrainingType Type { get; set; } = null!;

    public virtual Worker Worker { get; set; } = null!;
}
