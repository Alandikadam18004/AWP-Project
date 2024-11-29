using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;



namespace web3
{
    
    public class CakeShopDBContext : DbContext
    {
        public CakeShopDBContext() : base("CakeShopDB") // Matches the connection string name
        {
        }

        public DbSet<Cake> Cakes { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
    }

    public class Cake
    {
        public int CakeID { get; set; }
        public string CakeName { get; set; }
        public decimal Price { get; set; }
        public string ImagePath { get; set; }
    }

    public class Order
    {
        public int OrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal Total { get; set; }
        public string UserName { get; set; }
    }

    public class OrderDetail
    {
        public int OrderDetailID { get; set; }
        public int OrderID { get; set; }
        public int CakeID { get; set; }
        public int Quantity { get; set; }
    }

}