using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!TokenManager.IsLoggedInAlready(Session))
            {
                Session["ReturnUrl"] = Request.Url?.ToString();

                Response.Redirect("/index.aspx");
            }


            LoadOrdersData();


            ClientScript.RegisterHiddenField("__EVENTTARGET", "");
            ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
        }

        private void LoadOrdersData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectAllCondition("ordered", $"user_id = {TokenManager.GetUserIdFromSession(Session)}");

            string tableRows = "";
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["order_id"].ToString(),
                       quantity = row["quantity"].ToString(),
                       order_date = row["order_date"].ToString(),
                       total_price = row["total_price"].ToString(),
                       status = row["status"].ToString();

                tableRows += $@"
                    <tr id='orderRow_{id}'>
                        <td>{++i}</td>
                        <td>{quantity}</td>
                        <td>{total_price}</td>
                        <td>{order_date}</td>
                        <td>{status}</td>
                        <td>
                            {DeleteOrNot(status, id)}
                        </td>
                    </tr>";
            }

            OrderesTable.InnerHtml = tableRows;
        }

        private string DeleteOrNot(string status, string id)
        {
            if(!status.Equals("Delivered", StringComparison.OrdinalIgnoreCase))
            {
                return $@"                            
                            <form runat=""server"">
                                <button type=""button"" class=""btn btn-inverse-danger btn-fw"" runat=""server""
                                      onclick=""confirmDelete({id})""
                                >Delete</button>
                            </form>";
            }
            return "";
            
        }


        [WebMethod]
        public static string DeleteOrder(int orderId)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                sql.Delete("ordered", $"order_id = {orderId}");
                return "Success";
            }
            catch
            {
                return "Error";
            }
        }
    }
}