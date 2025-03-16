using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class WorkingCalendar
{
    /// <summary>
    /// Идентификатор строки
    /// </summary>
    public short Id { get; set; }

    /// <summary>
    /// День-исключение
    /// </summary>
    public DateOnly ExceptionDate { get; set; }

    /// <summary>
    /// 0 - будний день, но законодательно принят выходным
    /// </summary>
    public bool IsWorkingDay { get; set; }
}
