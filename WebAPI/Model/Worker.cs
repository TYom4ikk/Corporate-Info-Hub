﻿using System;
using System.Collections.Generic;

namespace WebAPI.Model;

public partial class Worker
{
    public int Id { get; set; }

    public short DepartmentId { get; set; }

    public string LastName { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string? MiddleName { get; set; }

    public string? WorkPhoneNumber { get; set; }

    public short? CabinetId { get; set; }

    public string? CorporateEmail { get; set; }

    public short PostId { get; set; }

    public DateOnly BirthDate { get; set; }

    public int? LeaderId { get; set; }

    public int? HelperId { get; set; }

    public string? PersonalPhoneNumber { get; set; }

    public string? ExtraInfo { get; set; }

    public string? PasswordHash { get; set; }

    public string? PasswordSalt { get; set; }

    public virtual ICollection<Absence> Absences { get; set; } = new List<Absence>();

    public virtual Cabinet? Cabinet { get; set; }

    public virtual Department Department { get; set; } = null!;

    public virtual ICollection<News> News { get; set; } = new List<News>();

    public virtual Post Post { get; set; } = null!;

    public virtual ICollection<Training> Training { get; set; } = new List<Training>();
}
