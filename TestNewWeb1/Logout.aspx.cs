using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear user credentials and last page URL from the session
            TokenManager.DeleteCredentialsFromSession(Session);
            TokenManager.ClearLastPageUrl(Session);
            Response.Redirect("/index.aspx");
        }
    }
}