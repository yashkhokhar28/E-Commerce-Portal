using ECommerce.DAL.Order;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Order.Controllers
{
    [Area("Order")]
    [Route("Order/[controller]/[action]")]
    public class OrderController : Controller
    {
        OrderDAL orderDAL = new OrderDAL();
        #region Order List
        public IActionResult OrderList()
        {
            DataTable dataTable = orderDAL.OrderSelectAll();
            return View(dataTable);
        }
        #endregion
    }
}
