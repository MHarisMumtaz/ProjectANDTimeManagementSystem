using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace timeSheet
{
    public static class Sessions
    {
        public static string ID { get; set; }
        public static string UserID { get; set; }
        public static string UserType { get; set; }
        public static string DepartmentID { get; set; }

        public static string IsProjectAssigned { get; set; }
        public static string IsUserCreated { get; set; }
        public static string IsUserLoged { get; set; }
    }
}