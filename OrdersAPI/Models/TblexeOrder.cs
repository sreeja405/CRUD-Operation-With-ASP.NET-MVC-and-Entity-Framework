//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OrdersAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TblexeOrder
    {
        public int OrderUno { get; set; }
        public string OrderID { get; set; }
        public string OrderCode { get; set; }
        public Nullable<int> Quantity { get; set; }
        public int CustomerUno { get; set; }
        public string Mobile { get; set; }
        public int StatusUno { get; set; }
        public System.DateTime EnteredOn { get; set; }
        public bool Active { get; set; }
        public string CustomerName { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
    
        public virtual TblMstCustomer TblMstCustomer { get; set; }
    }
}
