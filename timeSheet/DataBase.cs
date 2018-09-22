using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace timeSheet
{
    public class DataBase
    {
        public static List<T> SelectFromDB<T>(string StoredProcedure)
        {
            SqlCommand sc = new SqlCommand(StoredProcedure, ConnectionString.Connect());
            sc.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter sda = new SqlDataAdapter(sc);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            List<T> list = ORM.ConvertTableIntolist<T>(dt);
            return list;
        }

       
        public static List<T> SelectFromDB<T>(string StoredProcedure, SqlParameter[] parameters)
        {
            SqlCommand sc = new SqlCommand(StoredProcedure, ConnectionString.Connect());
            sc.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter item in parameters)
            {
                sc.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
            SqlDataAdapter sda = new SqlDataAdapter(sc);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            List<T> list = ORM.ConvertTableIntolist<T>(dt);
            return list;
        }

        public static List<string> SelectFromDb(string StoredProcedure, SqlParameter[] parameters)
        {
            SqlCommand sc = new SqlCommand(StoredProcedure, ConnectionString.Connect());
            sc.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter item in parameters)
            {
                sc.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
            SqlDataAdapter sda = new SqlDataAdapter(sc);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            List<string> list = ORM.ConvertTableIntolist(dt);
            return list;
        }

        public static void InsertIntoDB(string StoredProcedure, SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(StoredProcedure, ConnectionString.Connect());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            foreach (SqlParameter item in parameters)
            {
                cmd.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
            cmd.ExecuteNonQuery();
        }



        //new
        public static bool InsertIntoDb(string StoredProcedure, SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(StoredProcedure, ConnectionString.Connect());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            foreach (SqlParameter item in parameters)
            {
                cmd.Parameters.AddWithValue(item.ParameterName, item.Value);
            }
           int chk= cmd.ExecuteNonQuery();
           if (chk >= 0)
               return true;
           else
               return false;
        }
    }
}