using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using static TestNewWeb1.SqlConnectionClass;

namespace TestNewWeb1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            string EmailStr = email.Value.Trim(),
                PasswordStr = password.Value.Trim();

            SqlConnectionClass sql = new SqlConnectionClass();
            bool exsits = sql.RowDataAllExists("users", new Dictionary<string, object>
            {
                {"email", EmailStr },
                {"password", PasswordStr},
            });

            if (exsits)
            {
                TokenManager.AddCredentialsToSession(Session, EmailStr, PasswordStr);

                Response.Redirect("/index.aspx");
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorAlert", "showErrorAlert();", true);
                Response.Redirect("/login.aspx?Error=WrongEmailPassword");
                //Response.Write($"<input type=\"text\" placeholder=\"Enter your email\" id=\"email\" runat=\"server\" required value=\"{exsits}\">");
            }

        }
    }
}