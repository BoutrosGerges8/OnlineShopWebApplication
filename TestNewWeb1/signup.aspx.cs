using System;
using System.Collections.Generic;
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
            sql.InsertData("users", new Dictionary<string, object>
            {
                {"name", nameStr },
                {"email", emailStr },
                {"password", passwordStr }
            });

            TokenManager.AddCredentialsToSession(Session, emailStr, passwordStr);

            Response.Redirect("/index.aspx");
        }
    }
}