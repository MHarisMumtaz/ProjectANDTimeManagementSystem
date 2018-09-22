using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

namespace timeSheet
{
    public class ORM
    {

        public static List<T> ConvertTableIntolist<T>(DataTable dt)
        {
            List<T> list = new List<T>();
            Type tClass = typeof(T);

            PropertyInfo[] pClass = tClass.GetProperties();
            List<DataColumn> dc = dt.Columns.Cast<DataColumn>().ToList();
            T cn;

            foreach (DataRow item in dt.Rows)
            {
                cn = (T)Activator.CreateInstance(tClass);
                foreach (PropertyInfo pc in pClass)
                {
                    DataColumn d = dc.Find(c => c.ColumnName == pc.Name);
                    if (d != null)
                        pc.SetValue(cn, item[pc.Name], null);
                }//end of inner loop for setting properties and its values to the generic class

                list.Add(cn);
            }//end of Outer loop

            return list;
        }//end of Converting table into generic list<T>


        public static List<string> ConvertTableIntolist(DataTable dt)
        {
            List<string> list = new List<string>();

            List<DataColumn> dc = dt.Columns.Cast<DataColumn>().ToList();

            foreach (DataRow item in dt.Rows)
            {
                list.Add(item["ID"].ToString());
                list.Add(item["UserTypeID"].ToString());
                list.Add(item["DepartmentID"].ToString());
            }//end of Outer loop

            return list;
        }//end of Converting table into generic list<T>
    }
}