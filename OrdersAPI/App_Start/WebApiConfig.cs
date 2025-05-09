using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http; 
using Newtonsoft.Json.Serialization;
using OrdersAPI.Basic_Authentication;

namespace OrdersAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
             
            // Web API configuration and services
         

            config.Routes.MapHttpRoute(
             name: "ApiByAction",
             routeTemplate: "api/{controller}/{action}"
              //  defaults: new { id = RouteParameter.Optional }
            //  defaults: new { action = "Get" }
         );
            //config.Routes.MapHttpRoute(
            //             name: "DefaultApi",
            //             routeTemplate: "api/{controller}/{id}",
            //             defaults: new { id = RouteParameter.Optional }
            //         );
            config.Routes.MapHttpRoute(
                name: "ApiByName",
                routeTemplate: "api/{controller}/{action}/{id}",
                 defaults: new { id = RouteParameter.Optional }
            // constraints: new { id = @"^[a-z]+$" }
            );
            config.Filters.Add(new BasicAuthentication());
            // Web API routes
            //  config.MapHttpAttributeRoutes();

            //config.Routes.MapHttpRoute(
            //    name: "DefaultApi",
            //    routeTemplate: "api/{controller}/{id}",
            //    defaults: new { id = RouteParameter.Optional }
            //);
        }
    }
}
