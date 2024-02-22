namespace ECommerce.Areas.Order.Models
{
    public class OrderModel
    {
        public int OrderID { get; set; }

        public int AddressID { get; set; }

        public int ProductID { get; set; }

        public int UserID { get; set; }

        public bool isCompleted { get; set; }

        public string? OrderStatus { get; set; }

        public DateTime? Created { get; set; }

        public DateTime? Modified { get; set; }
    }

    public class ExportExcelOrderModel
    {
        public int OrderID { get; set; }

        public string? OrderStatus { get; set; }

        public double? Price { get; set; }

        public string? FirstName { get; set; }

        public DateTime? Created { get; set; }

        public DateTime? Modified { get; set; }


    }
}
