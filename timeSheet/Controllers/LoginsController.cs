using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using timeSheet.Models;

namespace timeSheet.Controllers
{
    public class LoginsController : Controller
    {
        //
        // GET: /Logins/
        [HttpGet]
        public ActionResult Login()
        {
            Sessions.DepartmentID = "";
            Sessions.ID = "";
            Sessions.IsProjectAssigned = "";
            Sessions.IsUserCreated = "";
            Sessions.IsUserLoged = "";
            Sessions.UserID = "";
            Sessions.UserType = "";
            return View("Login");
        }

        [HttpPost]
        public ActionResult Login(Users user)
        {
            user.ValidateLogin();
            ViewBag.UserID = Sessions.UserID;
            if (Sessions.UserType == "2")
            {
                return RedirectToAction("USER", "Users");
            }
            else if (Sessions.UserType == "1")
            {
                return RedirectToAction("Admin", "Admins");
            }
            return View("Login");
        }
     
    }
}
