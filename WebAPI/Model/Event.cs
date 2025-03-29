using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class Event
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public short TypeId { get; set; }

    public short StatusId { get; set; }

    public DateTime? StartDateTime { get; set; }

    public byte? HourlyDuration { get; set; }

    public string Description { get; set; } = null!;

    public short? ResponsibleDepartmentId { get; set; }

    public int? ResponsibleWorkerId { get; set; }

    public virtual Department? ResponsibleDepartment { get; set; }

    public virtual EventStatus Status { get; set; } = null!;

    public virtual EventType Type { get; set; } = null!;
}
