using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace timeSheet.Models
{
    public class Project
    {
        public string UserID { get; set; }
        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public int StatusCode { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string startdate { get; set; }
        public string enddate { get; set; }
        public int UserProjectID { get; set; }
        public int ProjectTemplateID { get; set; }
        public string ProjectTemplateName { get; set; }
        public static bool IsProjectCreated { get; set; }
        public void Create_New_Project()
        {
            DataBase.InsertIntoDB("NewProject", new SqlParameter[] { new SqlParameter("@projname", this.ProjectName), new SqlParameter("@startdate", this.startdate), new SqlParameter("@enddate", this.enddate), new SqlParameter("@tempname", this.ProjectTemplateName) });
            IsProjectCreated = true;
        }

        public static IEnumerable<Project> GetProjects(List<string> option = null)
        {
            IEnumerable<Project> ien = DataBase.SelectFromDB<Project>("FetchProjects");
            return ien;
        }

        public static IEnumerable<Project> GetAllProjectsInfo()
        {
            List<Project> ien = DataBase.SelectFromDB<Project>("GetAllProjects");
            ConvertDates(ref ien);
            return ien;
        }

        public void AssignProject()
        {
        bool chk = DataBase.InsertIntoDb("ProjectAssignment", new SqlParameter[] { new SqlParameter("@projectid", this.ProjectID), new SqlParameter("@userid", this.UserID), new SqlParameter("@startdate", this.startdate), new SqlParameter("@enddate", this.enddate), new SqlParameter("@statuscode", this.StatusCode) });
        if (chk)
            Sessions.IsProjectAssigned = "true";
        else
            Sessions.IsProjectAssigned = "false";
        }
        private static void ConvertDates(ref List<Project> list)
        {
            string temp;
            string[] arr;
            for (int i = 0; i < list.Count; i++)
            {
                temp = list[i].StartDate.Date + "";
                arr = temp.Split(' ');
                list[i].startdate = arr[0];
                temp = list[i].EndDate + "";
                arr = temp.Split(' ');
                list[i].enddate = arr[0];
            }
        }

        public static IEnumerable<Project> GetInfo(string projectID)
        {
            List<Project> list = DataBase.SelectFromDB<Project>("FetchProjectInfo", new SqlParameter[] { new SqlParameter("@projectid", projectID) });
            ConvertDates(ref list);
            return list;
        }

        public static IEnumerable<Project> GetUserProjects()
        {
            List<Project> list = DataBase.SelectFromDB<Project>("GetUserProjects", new SqlParameter[] { new SqlParameter("@userid", Sessions.UserID) });
            return list;
        }
    }
}