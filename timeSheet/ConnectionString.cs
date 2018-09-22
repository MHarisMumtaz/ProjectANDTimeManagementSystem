using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace timeSheet
{
    public class ConnectionString
    {
        static SqlConnection con;

        public static SqlConnection Connect()
        {
            if (con == null)
            {
                con = new SqlConnection();
                con.ConnectionString = @"Data Source = .\HM; Initial Catalog = timesheet; Integrated Security= SSPI; ";
                con.Open();
            }
            return con;
        }
    }
}