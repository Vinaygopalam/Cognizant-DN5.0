using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using FirstWebAPI.Models;
using FirstWebAPI.Filters;

namespace FirstWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [CustomActionFilter]
    [Authorize]   // All APIs require JWT token
    public class EmployeeController : ControllerBase
    {
        private static List<Employee> employees = new List<Employee>
        {
            new Employee { Id = 1, Name = "Vinay", Department = "IT", Salary = 50000 },
            new Employee { Id = 2, Name = "Rahul", Department = "HR", Salary = 45000 },
            new Employee { Id = 3, Name = "Sneha", Department = "Finance", Salary = 60000 }
        };

        // PUBLIC API (No Token Required)
        [AllowAnonymous]
        [HttpGet("public")]
        public IActionResult PublicApi()
        {
            return Ok("This is a public API. No JWT Token required.");
        }

        // GET ALL EMPLOYEES
        [HttpGet]
        public ActionResult<IEnumerable<Employee>> GetEmployees()
        {
            return Ok(employees);
        }

        // GET EMPLOYEE BY ID
        [HttpGet("{id}")]
        public ActionResult<Employee> GetEmployeeById(int id)
        {
            var employee = employees.FirstOrDefault(e => e.Id == id);

            if (employee == null)
            {
                return NotFound("Employee not found");
            }

            return Ok(employee);
        }

        // ADD EMPLOYEE
        [HttpPost]
        public ActionResult<Employee> AddEmployee([FromBody] Employee employee)
        {
            employees.Add(employee);
            return Ok(employee);
        }

        // UPDATE EMPLOYEE
        [HttpPut("{id}")]
        public ActionResult<Employee> UpdateEmployee(int id, [FromBody] Employee updatedEmployee)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid employee id");
            }

            var employee = employees.FirstOrDefault(e => e.Id == id);

            if (employee == null)
            {
                return BadRequest("Invalid employee id");
            }

            employee.Name = updatedEmployee.Name;
            employee.Department = updatedEmployee.Department;
            employee.Salary = updatedEmployee.Salary;

            return Ok(employee);
        }

        // DELETE EMPLOYEE
        [HttpDelete("{id}")]
        public IActionResult DeleteEmployee(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid employee id");
            }

            var employee = employees.FirstOrDefault(e => e.Id == id);

            if (employee == null)
            {
                return BadRequest("Invalid employee id");
            }

            employees.Remove(employee);

            return Ok($"Employee with Id {id} deleted successfully.");
        }
    }
}