using Microsoft.AspNetCore.Mvc;

namespace FirstWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        [ActionName("GetAllValues")]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[]
            {
                "Value 1",
                "Value 2",
                "Value 3"
            };
        }

        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            return Ok($"Received: {value}");
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            return Ok($"Updated Id = {id}, Value = {value}");
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok($"Deleted Id = {id}");
        }
    }
}