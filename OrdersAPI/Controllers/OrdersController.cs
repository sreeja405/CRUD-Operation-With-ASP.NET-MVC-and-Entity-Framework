using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using OrdersAPI.Models;
using OrdersAPI.Repository_Classes;
using System.Data.Entity.Core.Objects;
using OrdersAPI.Basic_Authentication;

namespace OrdersAPI.Controllers
{
    [BasicAuthentication]
    public class OrdersController : ApiController
    {
       private OrdersAPIPOCEntities db = new OrdersAPIPOCEntities();

      
        [ActionName("BranchList")]
        // GET api/<controller>
        public IEnumerable<Branch> GetBranchList()
        {
             List<Branch> branches = new List<Branch>();
            try
            {
               
                //branch = db.TblMstBranches 
                //.Where(item => item.Active == true). ToList();
                   branches = (from a in db.TblMstBranches
                                where a.Active == true
                                select new Branch
                                {
                                  //SNo = a.BranchUno,
                                    BrandName = a.BrandName,
                                    BranchName = a.BranchName,
                                    BranchCode = a.BranchCode,
                                    Location = a.Location
                                }

                              ).ToList();
            }
            catch (Exception ex) {
                throw ex;
            }

            return branches.AsEnumerable();
        }
        [ActionName("InventoryList")]
        // GET api/<controller>
        public IEnumerable<Inventory> GetInventoryList()
        {
            List<Inventory> inventory = new List<Inventory>();
            try
            { 
                inventory = (from a in db.TblMstInventories
                             where a.Active == true
                             select new Inventory
                             {
                                // SNo = a.InventoryUno,
                                 ItemCode = a.InventoryCode,
                                 ItemName = a.InventoryName,
                                 Quantity = a.Quantity
                             }

                              ).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return inventory.AsEnumerable();
        }
        [ActionName("OrderList")]
        // GET api/<controller>
        public IEnumerable<Order> GetOrderList()
        {
            List<Order> orders = new List<Order>();
            try
            {
                var spGetOrder_Results= db.SpGetOrder(null).ToList();  
                orders = (from a in spGetOrder_Results
                           orderby a.EnteredOn
                            select new Order
                            {
                                //SNo = a.OrderUno,
                                OrderID = a.OrderID,
                                OrderCode = a.OrderCode,
                                CustomerName = a.CustomerName,
                                Mobile = a.Mobile,
                                ItemCode=a.ItemCode,
                                ItemName=a.ItemName,
                                Quantity=a.Quantity,
                                Status=a.StatusName
                            }

                           ).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return orders.AsEnumerable();
        }

        [ActionName("CompleteOrderList")]
        [HttpGet]
        // GET api/<controller>/5
        public IEnumerable<Order> GetCompleteOrderList()
        {
            List<Order> orders = new List<Order>();
            try
            {
                orders = (from a in db.TblexeOrders
                          where a.Active == true && (a.StatusUno == 3)
                          orderby a.EnteredOn descending
                          select new Order
                          {
                             // SNo = a.OrderUno,
                              OrderID = a.OrderID,
                              OrderCode = a.OrderCode,
                              CustomerName = a.CustomerName,
                              Mobile = a.Mobile,
                              ItemCode = a.ItemCode,
                              ItemName = a.ItemName,
                              Quantity = a.Quantity,
                              Status = "Completed"
                          }

                          ).ToList();


            }
            catch (Exception ex)
            {
                throw ex;
            }

            return orders.AsEnumerable();
        }
        [ActionName("CancelOrderList")]
        [HttpGet]
        // GET api/<controller>/5
        public IEnumerable<Order> GetCancelOrderList()
        {
            List<Order> orders = new List<Order>();
            try
            {
                orders = (from a in db.TblexeOrders
                          where a.Active == false && (a.StatusUno == 4)
                          orderby a.EnteredOn descending
                          select new Order
                          {
                              // SNo = a.OrderUno,
                              OrderID = a.OrderID,
                              OrderCode = a.OrderCode,
                              CustomerName = a.CustomerName,
                              Mobile = a.Mobile,
                              ItemCode = a.ItemCode,
                              ItemName = a.ItemName,
                              Quantity = a.Quantity,
                              Status = "Cancelled"
                          }

                          ).ToList();


            }
            catch (Exception ex)
            {
                throw ex;
            }

            return orders.AsEnumerable();
        }
        [ActionName("BranchList")]
        [HttpGet]
        // GET api/<controller>/5
        public HttpResponseMessage GetBranch(string id)
        {
            //fetching and filter specific member id record   
            var branchdetail = (from a in db.TblMstBranches where a.BranchCode == id && a.Active == true
                                select new Branch
                                {
                                   // SNo = a.BranchUno,
                                    BrandName = a.BrandName,
                                    BranchName = a.BranchName,
                                    BranchCode = a.BranchCode,
                                    Location = a.Location
                                }).FirstOrDefault(); 
            //checking fetched or not with the help of NULL or NOT.  
            if (branchdetail != null)
            {
                //sending response as status code OK with memberdetail entity.  
                return Request.CreateResponse(HttpStatusCode.OK, branchdetail);
            }
            else
            {
                //sending response as error status code NOT FOUND with meaningful message.  
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invalid Code or Branch Not Found");
            }
        }
        
        [ActionName("InventoryList")]
        [HttpGet]
        // GET api/<controller>/5
        public HttpResponseMessage GetInventory(string id)
        {
            //fetching and filter specific member id record   
            var inventorydetail = (from a in db.TblMstInventories where a.InventoryCode == id && a.Active == true
                                   select new Inventory
                                   {
                                    //   SNo = a.InventoryUno,
                                       ItemCode = a.InventoryCode,
                                       ItemName = a.InventoryName,
                                       Quantity = a.Quantity
                                   }).FirstOrDefault();


            //checking fetched or not with the help of NULL or NOT.  
            if (inventorydetail != null)
            {
                //sending response as status code OK with memberdetail entity.  
                return Request.CreateResponse(HttpStatusCode.OK, inventorydetail);
            }
            else
            {
                //sending response as error status code NOT FOUND with meaningful message.  
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invalid Code or Inventory Not Found");
            }
        }
        [ActionName("OrderList")]
        // GET api/<controller>
        public HttpResponseMessage GetOrder(string id)
        {
            try
            {
                
                var spGetOrder_Results = db.SpGetOrder(id).ToList();
                var inventorydetail = (from a in spGetOrder_Results 
                                       select new Order
                                       {
                                          // SNo = a.OrderUno,
                                           OrderID = a.OrderID,
                                           OrderCode = a.OrderCode,
                                           CustomerName = a.CustomerName,
                                           Mobile = a.Mobile,
                                           ItemCode = a.ItemCode,
                                           ItemName = a.ItemName,
                                           Quantity = a.Quantity,
                                           Status = a.StatusName
                                       }).FirstOrDefault();
                //checking fetched or not with the help of NULL or NOT.  
                if (inventorydetail != null)
                {
                    //sending response as status code OK with memberdetail entity.  
                    return Request.CreateResponse(HttpStatusCode.OK, inventorydetail);
                }
                else
                {
                    //sending response as error status code NOT FOUND with meaningful message.  
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invalid Code or Order Not Found");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

             
        }
        [ActionName("CreateOrder")]
        [HttpPost]
        // POST api/<controller>
        public HttpResponseMessage CreateOrder([FromBody]Order order)
        {
           
          //  ObjectParameter outmessage = new ObjectParameter("OutMessage", typeof(String));
           // ObjectParameter outParameter = new ObjectParameter("OutParameter", typeof(int));
            try
            {
             // int outParameter = 0;
                //string outmessage = "";

                ObjectParameter outmessage = new ObjectParameter("OutMessage", typeof(String));
                ObjectParameter outParameter = new ObjectParameter("OutParameter", typeof(int));
                db.SpInsOrder(0, order.OrderCode, order.CustomerName, order.Mobile, order.ItemCode, order.ItemName, order.Quantity, outParameter, outmessage);
                db.SaveChanges();
                //To add an new member record  
                 if (Convert.ToInt32(outParameter.Value) > 0)
                {
                    //return response status as successfully created with member entity  

                   // var msg = Request.CreateResponse(HttpStatusCode.Created, order);
                    //msg.Headers.Location = new Uri(Request.RequestUri + order.CustomerName.ToString());
                    return Request.CreateResponse(HttpStatusCode.Created, Convert.ToString(outmessage.Value));
                    //return msg;
                }
                else
                {
                    //return response status as successfully created with member entity  
                    return Request.CreateResponse(HttpStatusCode.BadRequest, Convert.ToString(outmessage.Value));
                   
                }
                
                //Response message with requesturi for check purpose  
               
            }
            catch (Exception ex)
            {

                //return response as bad request  with exception message.  
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
        [ActionName("UpdateOrder")]
        [HttpPost] 
        //To update member record  
        // PUT api/<controller>/5  
        public HttpResponseMessage UpdateOrder(string id ,[FromBody]Order order)
        {
            try
            {

                //fetching and filter specific member id record   
                 var orderdetail = (from a in db.TblexeOrders where a.OrderID == id && a.Mobile == order.Mobile && a.Active == true select a).FirstOrDefault();

                ////checking fetched or not with the help of NULL or NOT.  
                if (orderdetail != null)
                {  

                ObjectParameter outmessage = new ObjectParameter("OutMessage", typeof(String));
                ObjectParameter outParameter = new ObjectParameter("OutParameter", typeof(int));
                db.SpInsOrder(orderdetail.OrderUno, order.OrderCode, order.CustomerName, order.Mobile, order.ItemCode, order.ItemName, order.Quantity, outParameter, outmessage);
                db.SaveChanges();
                //To modify an order   
                if (Convert.ToInt32(outParameter.Value) > 0)
                {
                      
                    return Request.CreateResponse(HttpStatusCode.OK, Convert.ToString(outmessage.Value));
                    
                }
                else
                {
                    //return response status as successfully created with member entity  
                    return Request.CreateResponse(HttpStatusCode.BadRequest, Convert.ToString(outmessage.Value));

                }
                }
                else
                {
                    //return response error as NOT FOUND  with message.  
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invalid Code or Order Not Found" + id.ToString());
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Invalid Code or Order Not Found " + id.ToString());
            }
           


        }
        
         [ActionName("CancelOrder")]
        [HttpPost]
        // DELETE api/<controller>/5  
        public HttpResponseMessage DeleteOrder(string id)
        {

            try
            {
                //fetching and filter specific member id record   
                var _DeleteMember = (from a in db.TblexeOrders where a.OrderID == id && a.Active==true select a).FirstOrDefault();

                //checking fetched or not with the help of NULL or NOT.  
                if (_DeleteMember != null)
                {
                    _DeleteMember.StatusUno = 4;
                    _DeleteMember.Active = false;
                    //set received _member object properties with memberdetail  
                    //save set allocation.  
                    db.SaveChanges(); 
                    //return response status as successfully deleted with member id  
                    return Request.CreateResponse(HttpStatusCode.OK, "Order Cancelled Successfully " + id.ToString());
                }
                else
                {
                    //return response error as Not Found  with exception message.  
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Order Not Found or Invalid " + id.ToString());
                }
            }

            catch (Exception ex)
            {

                //return response error as bad request  with exception message.  
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }

        [ActionName("CompleteOrder")]
        [HttpPost]
        // DELETE api/<controller>/5  
        public HttpResponseMessage CompleteOrder(string id)
        {

            try
            {
                //fetching and filter specific member id record   
                var _DeleteMember = (from a in db.TblexeOrders where a.OrderID == id && a.Active == true select a).FirstOrDefault();

                //checking fetched or not with the help of NULL or NOT.  
                if (_DeleteMember != null)
                {
                    _DeleteMember.StatusUno = 3;
                    //set received _member object properties with memberdetail  
                    //save set allocation.  
                    db.SaveChanges();
                    //return response status as successfully deleted with member id  
                    return Request.CreateResponse(HttpStatusCode.OK, "Order Completed Successfully " + id.ToString());
                }
                else
                {
                    //return response error as Not Found  with exception message.  
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Order Not Found or Invalid " + id.ToString());
                }
            }

            catch (Exception ex)
            {

                //return response error as bad request  with exception message.  
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }
    }
}