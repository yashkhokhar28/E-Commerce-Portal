﻿using ECommerce.BAL;
using ECommerce.DAL.Cart;
using ECommerce.Models;
using Microsoft.AspNetCore.Mvc;
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
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
