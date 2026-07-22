using JwtAuthenticationAPI.Models;
using JwtAuthenticationAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace JwtAuthenticationAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly JwtService jwtService = new JwtService();

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] User user)
        {
            // Dummy authentication
            if (user.Username == "admin" && user.Password == "admin123")
            {
                var token = jwtService.GenerateToken(user);

                return Ok(new
                {
                    Token = token
                });
            }

            return Unauthorized("Invalid Username or Password");
        }
    }
}