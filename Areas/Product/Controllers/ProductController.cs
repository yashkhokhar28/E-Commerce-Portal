using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Areas.Product.Controllers
{
    [Area("Product")]
    [Route("Product/[controller]/[action]")]
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
