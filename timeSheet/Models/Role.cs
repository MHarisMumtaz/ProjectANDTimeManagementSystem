using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace timeSheet.Models
{
    public class Role
    {
        public int RoleID { get; set; }
        public string RoleCode { get; set; }

      

        public static IEnumerable<Role> FetchRoles()
        {
           return DataBase.SelectFromDB<Role>("FetchRoles");
        }
    }
}