using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace timeSheet.Models
{
    public class Users
    {

        public int ID { get; set; }

        [Display(Name = "UserID")]
        public string UserID { get; set; }

        [Display(Name = "Password")]
        public string UserPassword { get; set; }
        public int DepartmentID { get; set; }
        public int UserTypeID { get; set; }


        public void ValidateLogin()
        {
            List<string> list = DataBase.SelectFromDb("UserLogin", new SqlParameter[] { new SqlParameter("@userid", this.UserID), new SqlParameter("@password", this.UserPassword) });
            if (list.Count == 0)
            {
                Sessions.UserType = "not found";
            }
            else
            {
                Sessions.ID = list[0].ToString();
                Sessions.UserType = list[1].ToString();
                Sessions.DepartmentID = list[2].ToString();
                Sessions.UserID = this.UserID;
            }
        }

        public void CreateUser(string[] roles)
        {
            bool check = DataBase.InsertIntoDb("NewUser", new SqlParameter[] { new SqlParameter("@Userid", this.UserID.ToLower()), new SqlParameter("@Pass", this.UserPassword) });
            if (check)
            {
                for (int i = 0; i < roles.Length; i++)
                {
                    DataBase.InsertIntoDb("AddUserRoles", new SqlParameter[] { new SqlParameter("@userid", this.UserID), new SqlParameter("@roleid", roles[i]) });
                }
                Sessions.IsUserCreated = "true";
            }
            else
                Sessions.IsUserCreated = "false";
        
            }

        public static IEnumerable<Users> GetUsers()
        {
            return DataBase.SelectFromDB<Users>("FetchUsers");

        }
    }
}