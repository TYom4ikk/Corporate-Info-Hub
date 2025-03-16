using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebAPI.Model;

public partial class CorporateInfoHubContext : DbContext
{
    public CorporateInfoHubContext()
    {
    }

    public CorporateInfoHubContext(DbContextOptions<CorporateInfoHubContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Absence> Absences { get; set; }

    public virtual DbSet<AbsenceType> AbsenceTypes { get; set; }

    public virtual DbSet<Cabinet> Cabinets { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventStatus> EventStatuses { get; set; }

    public virtual DbSet<EventType> EventTypes { get; set; }

    public virtual DbSet<News> News { get; set; }

    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<Training> Trainings { get; set; }

    public virtual DbSet<TrainingType> TrainingTypes { get; set; }

    public virtual DbSet<Worker> Workers { get; set; }

    public virtual DbSet<WorkingCalendar> WorkingCalendars { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=Corporate-Info-Hub");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Absence>(entity =>
        {
            entity.HasOne(d => d.Type).WithMany(p => p.Absences)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Absences_AbsenceTypes");

            entity.HasOne(d => d.Worker).WithMany(p => p.Absences)
                .HasForeignKey(d => d.WorkerId)
                .HasConstraintName("FK_Absences_Workers");
        });

        modelBuilder.Entity<AbsenceType>(entity =>
        {
            entity.HasIndex(e => e.Id, "IX_AbsenceTypes").IsUnique();

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Cabinet>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_asdasdfdegfsvcxz frdbxgtcv ftrdgxbchv");

            entity.Property(e => e.Name).HasMaxLength(10);
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Departmentss");

            entity.Property(e => e.Name).HasMaxLength(200);
        });

        modelBuilder.Entity<Event>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.StartDateTime).HasColumnType("datetime");

            entity.HasOne(d => d.ResponsibleDepartment).WithMany(p => p.Events)
                .HasForeignKey(d => d.ResponsibleDepartmentId)
                .HasConstraintName("FK_Events_Departments");

            entity.HasOne(d => d.ResponsibleWokrer).WithMany(p => p.Events)
                .HasForeignKey(d => d.ResponsibleWokrerId)
                .HasConstraintName("FK_Events_Workers");

            entity.HasOne(d => d.Status).WithMany(p => p.Events)
                .HasForeignKey(d => d.StatusId)
                .HasConstraintName("FK_Events_EventStatuses");

            entity.HasOne(d => d.Type).WithMany(p => p.Events)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Events_EventTypes");
        });

        modelBuilder.Entity<EventStatus>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<EventType>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<News>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Table_1");

            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.Author).WithMany(p => p.News)
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_News_Workers1");
        });

        modelBuilder.Entity<Post>(entity =>
        {
            entity.HasIndex(e => e.Id, "IX_Posts").IsUnique();

            entity.Property(e => e.Name).HasMaxLength(200);
        });

        modelBuilder.Entity<Training>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_TrainingCalendars");

            entity.HasOne(d => d.Type).WithMany(p => p.Training)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("FK_Trainings_TrainingTypes");

            entity.HasOne(d => d.Worker).WithMany(p => p.Training)
                .HasForeignKey(d => d.WorkerId)
                .HasConstraintName("FK_Trainings_Workers");
        });

        modelBuilder.Entity<TrainingType>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Worker>(entity =>
        {
            entity.Property(e => e.CorporateEmail).HasMaxLength(100);
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.MiddleName).HasMaxLength(50);
            entity.Property(e => e.PasswordSalt).HasMaxLength(50);
            entity.Property(e => e.PersonalPhoneNumber).HasMaxLength(20);
            entity.Property(e => e.WorkPhoneNumber).HasMaxLength(20);

            entity.HasOne(d => d.Cabinet).WithMany(p => p.Workers)
                .HasForeignKey(d => d.CabinetId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Workers_Cabinets");

            entity.HasOne(d => d.Department).WithMany(p => p.Workers)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK_Workers_Departments1");

            entity.HasOne(d => d.Post).WithMany(p => p.Workers)
                .HasForeignKey(d => d.PostId)
                .HasConstraintName("FK_Workers_Posts");
        });

        modelBuilder.Entity<WorkingCalendar>(entity =>
        {
            entity.ToTable("WorkingCalendar");

            entity.Property(e => e.Id).HasComment("Идентификатор строки");
            entity.Property(e => e.ExceptionDate).HasComment("День-исключение");
            entity.Property(e => e.IsWorkingDay).HasComment("0 - будний день, но законодательно принят выходным");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
