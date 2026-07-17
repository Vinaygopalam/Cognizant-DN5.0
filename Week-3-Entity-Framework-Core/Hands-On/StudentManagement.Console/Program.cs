using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using StudentManagement.Core.DTOs;
using StudentManagement.Core.Repositories;
using StudentManagement.Data.Context;
using StudentManagement.Data.Repositories;
using StudentManagement.Services.Implementations;
using StudentManagement.Services.Interfaces;

namespace StudentManagement.ConsoleApp
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var services = new ServiceCollection();
            
            // Register DbContext with SQLite
            services.AddDbContext<StudentDbContext>(options =>
                options.UseSqlite("Data Source=studentdb.db"));
                
            services.AddScoped<IStudentRepository, StudentRepository>();
            services.AddScoped<IStudentService, StudentService>();
            
            var provider = services.BuildServiceProvider();
            
            // Ensure Database is Created
            using (var scope = provider.CreateScope())
            {
                var db = scope.ServiceProvider.GetRequiredService<StudentDbContext>();
                await db.Database.EnsureCreatedAsync();
            }

            var service = provider.GetRequiredService<IStudentService>();
            
            Console.WriteLine("=== Student Management System CLI ===");
            
            // Insert default data for demo
            try
            {
                await service.AddStudentAsync(new StudentDto { Name = "Gopalam Vinay", Email = "Vinaygopalam@example.com", Age = 22, Course = "Computer Science" });
                Console.WriteLine("Demo Student Added Successfully.");
            }
            catch (Exception) { /* Already exists or demo setup */ }

            var list = await service.GetAllStudentsAsync();
            foreach (var student in list)
            {
                Console.WriteLine($"[ID: {student.Id}] {student.Name} - {student.Email} ({student.Course})");
            }
        }
    }
}
