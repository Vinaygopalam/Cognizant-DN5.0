using System.Collections.Generic;
using System.Threading.Tasks;
using StudentManagement.Core.DTOs;

namespace StudentManagement.Services.Interfaces
{
    public interface IStudentService
    {
        Task<StudentDto> GetStudentByIdAsync(int id);
        Task<IEnumerable<StudentDto>> GetAllStudentsAsync();
        Task AddStudentAsync(StudentDto studentDto);
        Task UpdateStudentAsync(StudentDto studentDto);
        Task DeleteStudentAsync(int id);
    }
}
