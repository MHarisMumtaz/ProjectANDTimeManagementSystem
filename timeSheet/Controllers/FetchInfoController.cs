using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using timeSheet.Models;

namespace timeSheet.Controllers
{
    public class FetchInfoController : ApiController
    {
        // GET api/fetchinfo
        [HttpGet]
        [ActionName("GetResources")]
        public IEnumerable<UserTimeSheet> GetResources(string id)
        {
            return UserTimeSheet.GetResource(Convert.ToInt16(id));
        }
   
        [HttpGet]
        [ActionName("ProjectInfo")]
        public IEnumerable<Project> ProjectInfo(string id)
        {
           return Project.GetInfo(id);
        }

        [HttpGet]
        [ActionName("Dailylog")]
        public IEnumerable<UserTimeSheet> Dailylog(string id)
        {
            return UserTimeSheet.GetDaliyLoged(Convert.ToInt32(id));
        }
    }
}
