using System;
using System.Web.UI;

namespace TestNewWeb1.Components
{
    public partial class Header : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool res = TokenManager.CredentialsExistInSession(Session);

            loginLink.Visible = !res;
            signOut.Visible = res;

            if (Request.Url.ToString().Contains("logout"))
            {
                TokenManager.DeleteCredentialsFromSession(Session);

                Session.Clear();
                Session.Abandon();

                Response.Redirect(Request.Url.AbsoluteUri.Split('?')[0]);
            }
            
        }
    }
}
