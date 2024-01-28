using ECommerce.DAL.Checkout;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Checkout.Controllers
{
    [Area("Checkout")]
    [Route("Checkout/[controller]/[action]")]
    public class CheckoutController : Controller
    {
        CheckoutDAL checkoutDAL = new CheckoutDAL();
        #region Checkout
        public IActionResult Checkout()
        {
            DataTable dataTable = checkoutDAL.Checkout();
            return View(dataTable);
        }
        #endregion
    }
}
