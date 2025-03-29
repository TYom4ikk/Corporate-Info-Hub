using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class WorkingCalendar
{
    public short Id { get; set; }

    public DateOnly ExceptionDate { get; set; }

    public bool IsWorkingDay { get; set; }
}
