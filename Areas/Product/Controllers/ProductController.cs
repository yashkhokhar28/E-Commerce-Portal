using ECommerce.Areas.Product.Models;
using ECommerce.DAL.Product;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Product.Controllers
{
    [Area("Product")]
    [Route("Product/[controller]/[action]")]
    public class ProductController : Controller
    {
        ProductDAL productDAL = new ProductDAL();
        #region Product List
        public IActionResult ProductList()
        {
            DataTable dataTable = productDAL.ProductSelectAll();
            return View(dataTable);
        }
        #endregion

        #region Product Save
        public IActionResult ProductSave(ProductModel productModel)
        {
            if (ModelState.IsValid)
            {
                if (productDAL.ProductSave(productModel))

                    return RedirectToAction("ProductList");
            }
            return View("ProductAddEdit");
        }
        #endregion

        #region Product By ID
        public IActionResult ProductAdd(int ProductID)
        {
            ProductModel productModel = productDAL.ProductByID(ProductID);
            if (productModel != null)
            {
                ViewBag.CategoryList = productDAL.CategoryDropDown();
                return View("ProductAddEdit", productModel);
            }
            else
            {
                ViewBag.CategoryList = productDAL.CategoryDropDown();
                return View("ProductAddEdit");
            }
        }
        #endregion

        #region Product Delete
        public IActionResult ProductDelete(int ProductID)
        {
            bool isSuccess = productDAL.ProductDelete(ProductID);
            if (isSuccess)
            {
                return RedirectToAction("ProductList");
            }
            return RedirectToAction("ProductList");
        }
        #endregion
    }
}
