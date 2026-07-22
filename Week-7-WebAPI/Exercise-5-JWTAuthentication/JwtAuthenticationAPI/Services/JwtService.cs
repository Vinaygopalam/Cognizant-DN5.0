using JwtAuthenticationAPI.Models;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace JwtAuthenticationAPI.Services
{
    public class JwtService
    {
        private readonly string key = "ThisIsMyVeryStrongSecretKeyForJWTAuthentication12345";

        public string GenerateToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            var tokenKey = Encoding.UTF8.GetBytes(key);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name, user.Username),
                    new Claim(ClaimTypes.Role, "Admin")
                }),

                Expires = DateTime.UtcNow.AddHours(1),

                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(tokenKey),
                    SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }

        public string GetKey()
        {
            return key;
        }
    }
}