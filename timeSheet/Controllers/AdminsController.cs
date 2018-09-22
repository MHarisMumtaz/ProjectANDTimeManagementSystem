using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using timeSheet.Models;

namespace timeSheet.Controllers
{
    public class AdminsController : Controller
    {
        //
        // GET: /Admins/

        public ActionResult admin()
        {
            Sessions.IsUserCreated = "";
            return View("Admin");
        }

        [HttpGet]
        public ActionResult ProjectCreation()
        {
            return View("CreationOfProject");
        }
        [HttpPost]
        public ActionResult CreateProject(FormCollection proj)
        {
            Project pro = new Project();
   
           pro.ProjectName= proj["projectname"].ToString();
         pro.ProjectTemplateName=  proj["projecttemplate"].ToString();
         pro.startdate = proj["startdate"].ToString();
         pro.enddate = proj["enddate"].ToString();
         pro.Create_New_Project();
            return View("CreationOfProject");
        }

        [HttpPost]
        public ActionResult createUser(FormCollection user)
        {
            Users u = new Users();
            u.UserID = user["userid"].ToString();
            u.UserPassword = user["pass"].ToString();
             string[] roles = user["checkbox"].Split(',');
             u.CreateUser(roles);
            return View("UserCreation");
        }

        [HttpGet]
        public ActionResult ProjectInfo(object id)
        {

            return View();
        }

        [HttpGet]
        public ActionResult ProjectAsign()
        {
            return View("ProjectAssign");
        }

        [HttpPost]
        public ActionResult ProjectAsign(FormCollection collect)
        {
            Project p = new Project();
            var temp = collect["userID"].ToString();
            p.UserID = collect["userID"].ToString();
            temp = collect["projectID"].ToString();
            p.ProjectID = Convert.ToInt32(collect["projectID"].ToString());
            temp = collect["startdate"].ToString();
            p.startdate = collect["startdate"].ToString();
            temp = collect["enddate"].ToString();
            p.enddate = collect["enddate"].ToString();
            p.StatusCode = Convert.ToInt32(collect["statuscode"].ToString());
            p.AssignProject();
            return View("ProjectAssign");
        }

        public ActionResult CreateUser()
        {
            return View("UserCreation");
        }

    }
}
