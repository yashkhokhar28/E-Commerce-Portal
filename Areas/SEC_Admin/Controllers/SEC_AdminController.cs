﻿using ECommerce.DAL.SEC_Admin;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.SEC_Admin.Controllers
{
    [Area("SEC_Admin")]
    [Route("SEC_Admin/[controller]/[action]")]
    public class SEC_AdminController : Controller
    {
        #region Admin Dashboard
        public IActionResult SEC_AdminDashboard()
        {
            SEC_AdminDAL sEC_AdminDAL = new SEC_AdminDAL();
            DataTable dataTable = sEC_AdminDAL.SEC_Admin_Dashboard();
            return View(dataTable);
        }
        #endregion

        #region Product Dashboard
        public IActionResult SEC_ProductDashboard()
        {
            SEC_AdminDAL sEC_AdminDAL = new SEC_AdminDAL();
            DataTable dataTable = sEC_AdminDAL.SEC_Admin_Dashboard();
            return View(dataTable);
        }
        #endregion




    }
}
