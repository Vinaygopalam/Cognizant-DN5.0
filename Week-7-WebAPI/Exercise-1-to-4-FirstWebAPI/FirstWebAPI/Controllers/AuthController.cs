using FirstWebAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FirstWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly JwtService jwtService = new JwtService();

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginModel login)
        {
            // Dummy Login
            if (login.Username == "admin" && login.Password == "admin123")
            {
                var token = jwtService.GenerateToken(login.Username);

                return Ok(new
                {
                    Token = token
                });
            }

            return Unauthorized("Invalid Username or Password");
        }
    }

    public class LoginModel
    {
        public string Username { get; set; } = "";
        public string Password { get; set; } = "";
    }
}