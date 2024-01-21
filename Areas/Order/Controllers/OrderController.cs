using ECommerce.DAL.Order;
using ECommerce.DAL.Product;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Order.Controllers
{
    [Area("Order")]
    [Route("Order/[controller]/[action]")]
    public class OrderController : Controller
    {
        OrderDAL orderDAL = new OrderDAL();

        #region Order List (Pending)
        public IActionResult PendingOrderList()
        {
            DataTable dataTable = orderDAL.PendingOrderSelectAll();
            return View(dataTable);
        }
        #endregion

        #region Order List (Completed)
        public IActionResult CompletedOrderList()
        {
            DataTable dataTable = orderDAL.CompletedOrderSelectAll();
            return View(dataTable);
        }
        #endregion

        #region Order SelectByPK
        public IActionResult OrderSelectByPK(int OrderID)
        {
            DataTable dataTable = orderDAL.OrderSelectByPK(OrderID);
            return View("SingleOrder", dataTable);
        }
        #endregion

        #region Order Complete
        public IActionResult OrderComplete(int OrderID)
        {
            bool isSuccess = orderDAL.OrderComplete(OrderID);
            if (isSuccess)
            {
                return RedirectToAction("PendingOrderList");
            }
            return RedirectToAction("PendingOrderList");
        }
        #endregion
    }
}
