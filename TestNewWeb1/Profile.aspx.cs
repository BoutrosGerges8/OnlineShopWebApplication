using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!TokenManager.IsLoggedInAlready(Session))
                {
                    TokenManager.SetLastPageUrl(Session, "/Profile.aspx");
                    Response.Redirect($"/login.aspx");
                }

                string id = TokenManager.GetUserIdFromSession(Session).ToString();

                if (!string.IsNullOrEmpty(id))
                {
                    SqlConnectionClass sql = new SqlConnectionClass();
                    DataTable dt = sql.SelectAllCondition("users", $"id = {id}");

                    DataRow row = dt.Rows[0];

                    UserId.Value = id;
                    username.Value = row["name"].ToString();
                    email.Value = row["email"].ToString();
                    inputPassword.Value = row["password"].ToString();
                    hiddenPassword.Value = row["password"].ToString();
                }
                else
                {
                    TokenManager.SetLastPageUrl(Session, "/Profile.aspx");
                    Response.Redirect("/login.aspx");
                }
            }
        }

        [WebMethod]
        public static string UpdateProfile(string userId, string username, string email, string password)
        {
            try
            {
                SqlConnectionClass sql = new SqlConnectionClass();
                sql.UpdateData("users", new Dictionary<string, object>
                {
                    {"name", username},
                    {"email", email},
                    {"password", password}
                }, $"id = {userId}");





                // Make sure the data object is not null
                DataTable data = sql.SelectColumnsCondition("users", new string[]
                {
                    "id", "isAdmin"
                }, $"email='{email}' AND password = '{password}'");

                HttpContext context = HttpContext.Current;
                
                if (data != null && data.Rows.Count > 0)
                {
                    DataRow firstRow = data.Rows[0];

                    TokenManager.AddCredentialsToSession(context.Session, email, password,
                        int.Parse(firstRow["id"].ToString()),
                        firstRow["isAdmin"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase));
                }



                //   Return a JSON response indicating success
                return Newtonsoft.Json.JsonConvert.SerializeObject(new
                {
                    success = true,
                    message = "Your profile has been updated successfully."
                });
            }
            catch (Exception ex)
            {
                // Return a JSON response indicating failure
                return Newtonsoft.Json.JsonConvert.SerializeObject(new
                {
                    success = false,
                    message = "Failed to update your profile. Error: " + ex.Message
                });
            }
        }


        //protected void Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("/index.aspx");
        //}

    }
}