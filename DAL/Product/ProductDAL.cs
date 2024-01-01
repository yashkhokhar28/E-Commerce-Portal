﻿using ECommerce.Areas.Category.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;

namespace ECommerce.DAL.Product
{
    public class ProductDAL : ProductDALBase
    {
        #region Category DropDown
        public List<CategoryDropDownModel> CategoryDropDown()
        {
            try
            {
                SqlDatabase sqlDatabase = new SqlDatabase(ConnectionString);
                DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("Category_DropDown");
                DataTable dataTable = new DataTable();
                using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
                {
                    dataTable.Load(dataReader);
                }
                List<CategoryDropDownModel> listOfCategories = new List<CategoryDropDownModel>();
                foreach (DataRow dataRow in dataTable.Rows)
                {
                    CategoryDropDownModel categoryDropDownModel = new CategoryDropDownModel();
                    categoryDropDownModel.CategoryID = Convert.ToInt32(dataRow["CategoryID"]);
                    categoryDropDownModel.CategoryName = dataRow["CategoryName"].ToString();
                    listOfCategories.Add(categoryDropDownModel);
                }
                return listOfCategories;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion
    }
}
