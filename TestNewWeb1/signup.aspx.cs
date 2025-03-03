using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string nameStr = name.Value.Trim(),
                emailStr = email.Value.Trim(),
                passwordStr = password.Value.Trim();


            SqlConnectionClass sql = new SqlConnectionClass();


            DataTable Exsits = sql.SelectAllCondition("users", $"email='{emailStr}'");

            if (Exsits != null && Exsits.Rows.Count > 0)
            {
                Response.Redirect("/signup.aspx?Error=Email already exists");
            }


            sql.InsertData("users", new Dictionary<string, object>
            {
                {"name", nameStr },
                {"email", emailStr },
                {"password", passwordStr }
            });

            DataTable data = sql.SelectColumnsCondition("users", new string[]
                {
                    "id", "isAdmin"
                }, $"email='{emailStr}' AND password = '{passwordStr}'");

            if (data != null && data.Rows.Count > 0)
            {
                DataRow firstRow = data.Rows[0];

                TokenManager.AddCredentialsToSession(Session, emailStr, passwordStr,
                    int.Parse(firstRow["id"].ToString()), firstRow["isAdmin"].ToString() == "true");

                if (firstRow["isAdmin"].ToString() == "True")
                {
                    Response.Redirect("/AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect($"/index.aspx");
                }
            }
            else
            {
                Response.Redirect("/signup.aspx?Error=Didn't add the data correctly");
            }


            Response.Redirect("/index.aspx");
        }
    }
}