using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace timeSheet.Models
{
    public class UserTimeSheet
    {
        public string UserID { get; set; }
        public int UserTimeSheetID { get; set; }
        public int UserProjectID { get; set; }
        public int ProjecttaskID { get; set; }
        public DateTime Days { get; set; }
        public string days { get; set; }
        public decimal Hours { get; set; }
        public string TaskDescription { get; set; }

        public void DailyLoged()
        {
            bool chk = DataBase.InsertIntoDb("Logedhours",
                  new SqlParameter[] { 
                    new SqlParameter("@userprojectid",this.UserProjectID) ,
                    new SqlParameter("@day",this.days),
                    new SqlParameter("@hour",this.Hours),
                    new SqlParameter("@desc",this.TaskDescription)
                });
            if (chk)
                Sessions.IsUserLoged = "true";
            else
                Sessions.IsUserLoged = "false";
        }

        public static IEnumerable<UserTimeSheet> GetDaliyLoged(int Projectid)
        {
            List<UserTimeSheet> list = DataBase.SelectFromDB<UserTimeSheet>("GetTimesheet", new SqlParameter[] { new SqlParameter("@userid", Sessions.UserID), new SqlParameter("@projectid", Projectid) });
            ConvertDates(ref list);
            IEnumerable<UserTimeSheet> list2 = list;
            return list2;
        }

        public static IEnumerable<UserTimeSheet> GetResource(int projectid)
        {
            List<UserTimeSheet> list = DataBase.SelectFromDB<UserTimeSheet>("GetResources", new SqlParameter[] { new SqlParameter("@projectid", projectid)});
            ConvertDates(ref list);
            IEnumerable<UserTimeSheet> list2 = list;
            return list2;
        }

        private static void ConvertDates(ref List<UserTimeSheet> list)
        {
            for (int i = 0; i < list.Count; i++)
            {
                string temp = list[i].Days.ToString();
                string[] arr = temp.Split(' ');
                list[i].days = arr[0];
            }
        }

       
    }
}