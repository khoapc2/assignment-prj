using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class PitchBookingContext : DbContext
    {
        public PitchBookingContext()
        {
        }

        public PitchBookingContext(DbContextOptions<PitchBookingContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Pitch> Pitches { get; set; }
        public virtual DbSet<SubPitch> SubPitches { get; set; }
        public virtual DbSet<UserAccount> UserAccounts { get; set; }

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Server=104.215.186.78,1433;Database=PitchBooking;User Id=sa;Password=Khoa123456789;Trusted_Connection=False;");
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Booking>(entity =>
            {
                entity.ToTable("Booking");

                entity.Property(e => e.CancelReason).HasMaxLength(500);

                entity.Property(e => e.DateBooking).HasColumnType("date");

                entity.Property(e => e.Price)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__Booking__Custome__1DE57479");

                entity.HasOne(d => d.SubPitch)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.SubPitchId)
                    .HasConstraintName("FK__Booking__SubPitc__1ED998B2");
            });

            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.ToTable("Feedback");

                entity.Property(e => e.Content).HasMaxLength(500);

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.BookingId)
                    .HasConstraintName("FK__Feedback__Bookin__2E1BDC42");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__Feedback__Custom__2C3393D0");

                entity.HasOne(d => d.Pitch)
                    .WithMany(p => p.Feedbacks)
                    .HasForeignKey(d => d.PitchId)
                    .HasConstraintName("FK__Feedback__PitchI__2D27B809");
            });

            modelBuilder.Entity<Pitch>(entity =>
            {
                entity.ToTable("Pitch");

                entity.Property(e => e.ImgPath).HasMaxLength(100);

                entity.Property(e => e.Location)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.PitchOwner)
                    .WithMany(p => p.Pitches)
                    .HasForeignKey(d => d.PitchOwnerId)
                    .HasConstraintName("FK__Pitch__PitchOwne__182C9B23");
            });

            modelBuilder.Entity<SubPitch>(entity =>
            {
                entity.ToTable("SubPitch");

                entity.Property(e => e.ImgPath).HasMaxLength(100);

                entity.Property(e => e.TypeOfPitch)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Pitch)
                    .WithMany(p => p.SubPitches)
                    .HasForeignKey(d => d.PitchId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SubPitch__PitchI__1B0907CE");
            });

            modelBuilder.Entity<UserAccount>(entity =>
            {
                entity.ToTable("UserAccount");

                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Role)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
