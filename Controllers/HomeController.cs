using ECommerce.BAL;
using ECommerce.DAL.Cart;
using ECommerce.Models;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Mvc;
using MimeKit;
using System.Data;
using System.Diagnostics;

namespace ECommerce.Controllers
{

    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            CartDAL cartDAL = new CartDAL();
            DataTable dataTable = cartDAL.CartCount(Convert.ToInt32(CommenVariable.UserID()));
            if (dataTable.Rows.Count > 0)
            {
                foreach (DataRow dataRow in dataTable.Rows)
                {
                    HttpContext.Session.SetString("CartCount", dataRow["TotalCartItems"].ToString());
                    break;
                }
            }
            return View();
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult ThankYou()
        {
            //var message = new MimeMessage();
            //message.From.Add(new MailboxAddress("Yash Khokhar", "yashkhokhar28@gmail.com"));
            //message.To.Add(new MailboxAddress(CommenVariable.FirstName(), CommenVariable.Email()));
            //message.Subject = "Order Confirmation";
            //message.Body = new TextPart("plain")
            //{
            //    Text = "Hiii"
            //};
            //using (var client = new SmtpClient())
            //{
            //    client.Connect("smtp.gmail.com", 587, false);
            //    client.Authenticate("FromEmail300@gmail.com", "YourPassword");

            //    client.Send(message);
            //    client.Disconnect(true);
            //}
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
