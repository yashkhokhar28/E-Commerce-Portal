using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;

namespace ECommerce.DAL.Product
{
    public class ProductDALBase : DALHelper
    {
        #region Method : Product SelectAll
        public DataTable ProductSelectAll()
        {
            try
            {
                SqlDatabase sqlDatabase = new SqlDatabase(ConnectionString);
                DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("Product_SelectAll");
                DataTable dataTable = new DataTable();
                using (IDataReader dataReader = dbCommand.ExecuteReader())
                {
                    dataTable.Load(dataReader);
                }
                return dataTable;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region Method : Product Insert & Update
        #endregion

        #region Method : Product By ID
        #endregion

        #region Method : Product Delete
        #endregion
    }
}
