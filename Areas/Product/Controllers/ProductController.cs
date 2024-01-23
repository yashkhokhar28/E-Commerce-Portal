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

        #region Product List (Active)
        public IActionResult ProductList()
        {
            DataTable dataTable = productDAL.ProductSelectAll();
            return View(dataTable);
        }
        #endregion

        #region Product List (In Active)
        public IActionResult DeletedProductList()
        {
            DataTable dataTable = productDAL.ProductDeletedSelectAll();
            return View(dataTable);
        }
        #endregion

        #region Product List (User Side)
        public IActionResult ShoppingProductList()
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

        #region Product Retrive
        public IActionResult ProductRetrive(int ProductID)
        {
            bool isSuccess = productDAL.ProductRetrive(ProductID);
            if (isSuccess)
            {
                return RedirectToAction("DeletedProductList");
            }
            return RedirectToAction("DeletedProductList");
        }
        #endregion
    }
}
