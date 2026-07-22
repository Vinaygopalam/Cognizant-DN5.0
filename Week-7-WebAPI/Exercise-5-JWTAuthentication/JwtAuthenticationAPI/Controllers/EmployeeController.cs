using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace JwtAuthenticationAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EmployeeController : ControllerBase
    {
        [Authorize]
        [HttpGet]
        public IActionResult GetEmployees()
        {
            var employees = new[]
            {
                new { Id = 1, Name = "Vinay", Department = "IT" },
                new { Id = 2, Name = "Rahul", Department = "HR" },
                new { Id = 3, Name = "Sneha", Department = "Finance" }
            };

            return Ok(employees);
        }

        [AllowAnonymous]
        [HttpGet("public")]
        public IActionResult PublicApi()
        {
            return Ok("This is a public API. No token required.");
        }
    }
}