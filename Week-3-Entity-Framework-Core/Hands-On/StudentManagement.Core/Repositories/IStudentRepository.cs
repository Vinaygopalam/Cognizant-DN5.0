using System.Collections.Generic;
using System.Threading.Tasks;
using StudentManagement.Core.Entities;

namespace StudentManagement.Core.Repositories
{
    public interface IStudentRepository
    {
        Task<Student> GetByIdAsync(int id);
        Task<IEnumerable<Student>> GetAllAsync();
        Task AddAsync(Student student);
        Task UpdateAsync(Student student);
        Task DeleteAsync(int id);
    }
}
