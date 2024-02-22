using ECommerce.Areas.Cart.Models;
using ECommerce.Areas.Category.Models;
using System.Data;

namespace ECommerce.Models
{
    public class ViewModel
    {
        public DataTable CartTable { get; set; }
        public DataTable AddressTable { get; set; }

        public CategoryDropDownModel CategoryList { get; set; }
        public DataTable ProductTable { get; set; }
        public DataTable UserDetails { get; set; }
        public DataTable UserOrderDetails { get; set; }
    }
}
