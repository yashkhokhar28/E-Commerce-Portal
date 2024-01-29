using ECommerce.Areas.Cart.Models;
using System.Data;

namespace ECommerce.Models
{
    public class ViewModel
    {
        public DataTable CartTable { get; set; }
        public DataTable AddressTable { get; set; }
    }
}
