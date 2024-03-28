using CarChoice.BAL;
using ClosedXML.Excel;
using ECommerce.Areas.Cart.Models;
using ECommerce.Areas.Order.Models;
using ECommerce.BAL;
using ECommerce.DAL.Cart;
using ECommerce.DAL.Order;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Order.Controllers
{
    [Area("Order")]
    [Route("Order/[controller]/[action]")]
    public class OrderController : Controller
    {
        private readonly IConfiguration Configuration;
        private readonly IEmailSender _emailSender;

        #region constructor
        public OrderController(IConfiguration _Configuration, IEmailSender emailSender)
        {
            Configuration = _Configuration;
            _emailSender = emailSender;
        }
        #endregion

        OrderDAL orderDAL = new OrderDAL();
        CartDAL cartDAL = new CartDAL();

        #region Order List (Pending)
        public IActionResult PendingOrderList()
        {
            DataTable dataTable = orderDAL.PendingOrderSelectAll();
            ViewBag.Complete = TempData["Complete"];
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
        public IActionResult OrderComplete(int OrderID, string Email)
        {
            bool isSuccess = orderDAL.OrderComplete(OrderID);
            if (isSuccess)
            {
                bool isMailSend = SendEmail(Email);
                if (isMailSend)
                {
                    TempData["Complete"] = "Order Completed Successfully, Check Your Mail";
                }
                else
                {
                    TempData["Complete"] = "Order Completed Successfully";
                }
                return RedirectToAction("PendingOrderList");
            }
            return RedirectToAction("PendingOrderList");
        }
        #endregion

        #region Order Insert
        public IActionResult Order_Insert(int UserID, int AddressID, int[] ProductIDs, int[] Quantities, CartModel cartModel)
        {
            if (ModelState.IsValid)
            {
                if (orderDAL.OrderInsert(UserID, ProductIDs, Quantities, AddressID, cartModel))
                {
                    bool isSuccess = cartDAL.Update_Order_Status(Convert.ToInt32(CommenVariable.UserID()));
                    if (isSuccess)
                    {
                        DataTable dataTable = cartDAL.CartCount(Convert.ToInt32(CommenVariable.UserID()));
                        if (dataTable.Rows.Count > 0)
                        {
                            foreach (DataRow dataRow in dataTable.Rows)
                            {
                                HttpContext.Session.SetString("CartCount", dataRow["TotalCartItems"].ToString());
                                break;
                            }
                        }
                        return RedirectToAction("ThankYou", "Home");
                    }
                    else
                    {
                        return RedirectToAction("ThankYou", "Home");
                    }
                }
                else
                {
                    return RedirectToAction("ThankYou", "Home");
                }
            }
            return RedirectToAction("ThankYou", "Home");
        }

        #endregion

        #region GetOrderListForExcel
        public List<ExportExcelOrderModel> GetOrderListForExcel()
        {
            try
            {
                List<ExportExcelOrderModel> exportExcelOrderModels = orderDAL.GetOrderList();
                return exportExcelOrderModels;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region ExportToExcel
        public IActionResult ExportToExcel()
        {
            List<ExportExcelOrderModel> models = GetOrderListForExcel();
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Orders");
                // Add headers
                worksheet.Cell(1, 1).Value = "OrderID";
                worksheet.Cell(1, 2).Value = "FirstName";
                worksheet.Cell(1, 3).Value = "Price";
                worksheet.Cell(1, 4).Value = "OrderStatus";
                worksheet.Cell(1, 5).Value = "Created";
                // Add data
                int row = 2;
                foreach (var model in models)
                {
                    worksheet.Cell(row, 1).Value = model.OrderID;
                    worksheet.Cell(row, 2).Value = model.FirstName;
                    worksheet.Cell(row, 3).Value = model.Price;
                    worksheet.Cell(row, 4).Value = model.OrderStatus;
                    worksheet.Cell(row, 5).Value = model.Created?.ToString("yyyy-MM-dd HH:mm:ss");
                    row++;
                }
                // Set content type and filename
                var contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                var fileName = "OrderList.xlsx";
                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var content = stream.ToArray();
                    return File(content, contentType, fileName);
                }
            }
        }
        #endregion

        #region Send Mail
        [HttpPost]
        public bool SendEmail(string receiver)
        {
            var providerEmail = receiver;

            if (!string.IsNullOrEmpty(providerEmail))
            {
                var subject = "Order Confirmed";
                var body = $"Your Order Confirmed";

                // Send the email
                _emailSender.SendEmailAsync(providerEmail, subject, body);
                return true;
            }
            return false;
        }
        #endregion
    }
}
