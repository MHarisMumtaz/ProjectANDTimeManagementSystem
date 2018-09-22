using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using timeSheet.Models;

namespace timeSheet.Controllers
{
    public class UsersController : Controller
    {
        //
        // GET: /Users/

        [HttpGet]
        public ActionResult USER()
        {
            return View("user");
        }

        [HttpPost]
        public ActionResult Loged(FormCollection collection)
        {
            UserTimeSheet tm = new UserTimeSheet();
            tm.UserProjectID = Convert.ToInt32(collection["projectID"].ToString());
            tm.days = collection["days"].ToString();
            tm.Hours = Convert.ToDecimal(collection["hour"].ToString());
            tm.TaskDescription = collection["desc"].ToString();
            tm.DailyLoged();
            return View("user");
        }
    }
}
