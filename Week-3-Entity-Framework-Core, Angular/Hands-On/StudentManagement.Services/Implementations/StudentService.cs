using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentManagement.Core.DTOs;
using StudentManagement.Core.Entities;
using StudentManagement.Core.Repositories;
using StudentManagement.Services.Interfaces;

namespace StudentManagement.Services.Implementations
{
    public class StudentService : IStudentService
    {
        private readonly IStudentRepository _repo;

        public StudentService(IStudentRepository repo)
        {
            _repo = repo;
        }

        public async Task<StudentDto> GetStudentByIdAsync(int id)
        {
            var s = await _repo.GetByIdAsync(id);
            if (s == null) return null;
            return new StudentDto { Id = s.Id, Name = s.Name, Email = s.Email, Age = s.Age, Course = s.Course };
        }

        public async Task<IEnumerable<StudentDto>> GetAllStudentsAsync()
        {
            var list = await _repo.GetAllAsync();
            return list.Select(s => new StudentDto { Id = s.Id, Name = s.Name, Email = s.Email, Age = s.Age, Course = s.Course });
        }

        public async Task AddStudentAsync(StudentDto s)
        {
            if (string.IsNullOrWhiteSpace(s.Name)) throw new ArgumentException("Name is required");
            if (!s.Email.Contains("@")) throw new ArgumentException("Invalid Email");
            
            await _repo.AddAsync(new Student { Name = s.Name, Email = s.Email, Age = s.Age, Course = s.Course });
        }

        public async Task UpdateStudentAsync(StudentDto s)
        {
            var existing = await _repo.GetByIdAsync(s.Id);
            if (existing == null) throw new KeyNotFoundException("Student not found");
            existing.Name = s.Name;
            existing.Email = s.Email;
            existing.Age = s.Age;
            existing.Course = s.Course;
            await _repo.UpdateAsync(existing);
        }

        public async Task DeleteStudentAsync(int id)
        {
            await _repo.DeleteAsync(id);
        }
    }
}
