using ECommerce.Areas.Product.Models;
using ECommerce.BAL;
using ECommerce.DAL.Cart;
using ECommerce.DAL.Order;
using ECommerce.DAL.Product;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
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
            ViewBag.Save = TempData["Save"];
            ViewBag.Delete = TempData["Delete"];
            ViewBag.Update = TempData["Update"];
            return View(dataTable);
        }
        #endregion

        #region Product List (In Active)
        public IActionResult DeletedProductList()
        {
            DataTable dataTable = productDAL.ProductDeletedSelectAll();
            ViewBag.Retrive = TempData["Retrive"];
            return View(dataTable);
        }
        #endregion

        #region Product List (User Side)
        public IActionResult ShoppingProductList()
        {
            DataTable dataTable = productDAL.ProductSelectAll();
            ViewBag.CategoryList = productDAL.CategoryDropDown();
            return View(dataTable);
        }
        #endregion

        #region Product List By ID (User Side)
        public IActionResult ShoppingProductByID(int ProductID)
        {
            DataTable dataTable = productDAL.ShoppingProductByID(ProductID);
            return View(dataTable);
        }
        #endregion

        #region Product Save
        public IActionResult ProductSave(ProductModel productModel)
        {
            if (ModelState.IsValid)
            {
                if (productDAL.ProductSave(productModel))
                {
                    TempData["Save"] = "Product Saved Successfully";
                    return RedirectToAction("ProductList");
                }
                else
                {
                    return RedirectToAction("ProductList");
                }
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
                TempData["Delete"] = "Product Deleted Successfully";
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
                TempData["Retrive"] = "Product Retrived Successfully";
                return RedirectToAction("DeletedProductList");
            }
            return RedirectToAction("DeletedProductList");
        }
        #endregion

        #region Multiple Product Delete 
        public IActionResult DeleteMultipleProducts(int[] ProductIDs)
        {
            Console.WriteLine(ProductIDs[0]);
            bool isSuccess = productDAL.DeleteMultipleProducts(ProductIDs);
            if (isSuccess)
            {
                TempData["Delete"] = "Selected Product Deleted Successfully";
                return RedirectToAction("ProductList");
            }
            else
            {
                return RedirectToAction("ProductList");
            }
        }
        #endregion
    }
}
