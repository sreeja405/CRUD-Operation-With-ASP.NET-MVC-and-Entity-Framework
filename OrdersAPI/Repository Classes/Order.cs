using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrdersAPI.Repository_Classes
{
    
    public class Order
    {
       // public int SNo { get; set; }
         public string OrderID { get; set; }
        public string OrderCode { get; set; } 
        public string CustomerName { get; set; }
        public string Mobile { get; set; } 
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public int? Quantity { get; set; }
        public string Status { get; set; }
    }
    public class Inventory
    {
       // public int SNo { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public int Quantity { get; set; }
    }
    public class Branch
    {
       //public int SNo { get; set; }
        public string BrandName { get; set; }
        public string BranchName { get; set; }
        public string BranchCode { get; set; } 
        public string Location { get; set; }
    }
}