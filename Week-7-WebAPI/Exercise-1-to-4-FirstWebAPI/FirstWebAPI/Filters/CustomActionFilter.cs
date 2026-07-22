using Microsoft.AspNetCore.Mvc.Filters;

namespace FirstWebAPI.Filters
{
    public class CustomActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            Console.WriteLine("Request received for: " + context.ActionDescriptor.DisplayName);

            base.OnActionExecuting(context);
        }
    }
}