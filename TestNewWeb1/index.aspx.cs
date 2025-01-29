using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using Antlr.Runtime.Misc;

namespace TestNewWeb1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool res = TokenManager.CredentialsExistInSession(Session);

            loginLink.Visible = !res;
            signOut.Visible = res;

            // Check if the query string contains "logout=true"
            if (Request.Url.ToString().Contains("logout"))
            {
                // Delete session credentials
                TokenManager.DeleteCredentialsFromSession(Session);

                // Clear the session and redirect to the current page
                Session.Clear();
                Session.Abandon();

                // Redirect to remove query string and show the correct state
                Response.Redirect(Request.Url.AbsoluteUri.Split('?')[0]);
            }
            else
            {
                //Response.Redirect($"/login.aspx?key={Request.QueryString["logout"]}");
            }

            //Response.Write("Logout query string: " + Request.QueryString["logout"]);


        }

        //protected void Signout_Click(object sender, EventArgs e)
        //{
        //    TokenManager.DeleteCredentialsFromSession(Session);
        //    Response.Redirect("/index.aspx");
        //}
    }
}