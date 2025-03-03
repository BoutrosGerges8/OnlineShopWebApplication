using System;
using System.Data;
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
            DashboardBtn.Visible = res && TokenManager.IsUserAdmin(Session);
            ordersPage.Visible = res && !TokenManager.IsUserAdmin(Session);
            profileLogo.Visible = res && !TokenManager.IsUserAdmin(Session);

            if (Request.Url.ToString().Contains("logout"))
            {
                TokenManager.DeleteCredentialsFromSession(Session);

                Session.Clear();
                Session.Abandon();

                Response.Redirect(Request.Url.AbsoluteUri.Split('?')[0]);
            }

            if (res)
            {
                int n = getNOrders();
                if(n != 0)
                {
                    N_Orders.InnerHtml = $"{getNOrders()}";
                }
                else{
                    N_Orders.Style["display"] = "none";
                    N_Orders.Disabled = true;
                }
            }
        }

        private int getNOrders()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectColumnsCondition("ordered", 
                new string[] {"order_id"}, $"user_id = {TokenManager.GetUserIdFromSession(Session)} AND status <> 'Delivered'");
            return dt.Rows.Count;
        }
    }
}
