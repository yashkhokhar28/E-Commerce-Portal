using ECommerce.Areas.Category.Models;
using ECommerce.DAL.Category;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Category.Controllers
{
    [Area("Category")]
    [Route("Category/[controller]/[action]")]
    public class CategoryController : Controller
    {
        CategoryDAL categoryDAL = new CategoryDAL();
        #region Category List
        public IActionResult CategoryList()
        {
            DataTable dataTable = categoryDAL.CategorySelectAll();
            return View(dataTable);
        }
        #endregion

        #region Category Save
        public IActionResult CategorySave(CategoryModel categoryModel)
        {
            if (ModelState.IsValid)
            {
                if (categoryDAL.CategorySave(categoryModel))

                    return RedirectToAction("CategoryList");

            }
            return View("CategoryAddEdit");
        }
        #endregion

        #region Category By ID
        public IActionResult CategoryAdd(int CategoryID)
        {
            CategoryModel categoryModel = categoryDAL.CategoryByID(CategoryID);
            if (categoryModel != null)
            {
                return View("CategoryAddEdit", categoryModel);
            }
            else
            {
                return View("CategoryAddEdit");
            }
        }
        #endregion

        #region Category Delete
        public IActionResult CategoryDelete(int CategoryID)
        {
            bool isSuccess = categoryDAL.CategoryDelete(CategoryID);
            if (isSuccess)
            {
                return RedirectToAction("CategoryList");
            }
            return RedirectToAction("CategoryList");
        }
        #endregion
    }
}
