using Microsoft.EntityFrameworkCore;
using StudentManagement.Core.Entities;

namespace StudentManagement.Data.Context
{
    public class StudentDbContext : DbContext
    {
        public StudentDbContext(DbContextOptions<StudentDbContext> options) : base(options) { }

        public DbSet<Student> Students { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student>().HasKey(s => s.Id);
            modelBuilder.Entity<Student>().Property(s => s.Name).IsRequired().HasMaxLength(100);
            modelBuilder.Entity<Student>().Property(s => s.Email).IsRequired();
        }
    }
}
