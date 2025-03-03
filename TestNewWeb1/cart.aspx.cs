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
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!TokenManager.IsLoggedInAlready(Session))
            {
                Response.Redirect("/index.aspx");
            }

            LoadCartData();

            ClientScript.RegisterHiddenField("__EVENTTARGET", "");
            ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
        }

        private void LoadCartData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            // Get cart items for the logged-in user
            DataTable dt = sql.JoinTables(new string[] { "cart", "products" },
                    new Dictionary<string, string>
                    {
                        {"cart.product_id" , "products.product_id" }
                    });

            string tableRows = "";
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["cart_id"].ToString(),
                       title = row["short_description"].ToString(),
                       img1 = row["image_url_thumbnail"].ToString(),
                       quantity = row["quantity"].ToString(),
                       date_added = row["date_added"].ToString(),
                       total_price = row["total_price"].ToString();

                tableRows += $@"
                    <tr id='cartRow_{id}'>
                        <td>{++i}</td>
                        <td>{title}</td>
                        <td class='py-1'>
                            <img src='/AllUploadedImages/{img1}' alt='product image' />
                        </td>
                        <td>{quantity}</td>
                        <td>{total_price}</td>
                        <td>{date_added}</td>
                        <td>
                            {DeleteButton(id)}
                        </td>
                        <td>
                            <button type='button' class='btn btn-success' onclick='ProceedToCheckout({id})'>Checkout</button>
                        </td>
                    </tr>";
            }

            CartTable.InnerHtml = tableRows;
        }

        private string DeleteButton(string id)
        {
            return $@"<form runat=""server"">
                        <button type=""button"" class=""btn btn-inverse-danger btn-fw"" runat=""server""
                              onclick=""confirmDelete({id})""
                        >Remove</button>
                    </form>";
        }

        [WebMethod]
        public static string DeleteCartItem(int cartId)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                // Remove the item from the cart
                sql.Delete("cart", $"cart_id = {cartId}");
                return "Success";
            }
            catch
            {
                return "Error";
            }
        }

        [WebMethod]
        public static string ProceedToCheckout(int cartId)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                // Get the cart item details
                DataTable dt = sql.SelectAllCondition("cart", $"cart_id = {cartId}");
                DataRow dataRow = dt.Rows[0];
                string productId = dataRow["product_id"].ToString(),
                       quantity = dataRow["quantity"].ToString(),
                       totalPrice = dataRow["total_price"].ToString();

                // Insert the item into the 'ordered' table
                sql.InsertData("ordered", new Dictionary<string, object>
                {
                    {"user_id", TokenManager.GetUserIdFromSession(HttpContext.Current.Session)},
                    {"product_id", productId},
                    {"quantity", quantity},
                    {"total_price", totalPrice},
                    {"order_date", DateTime.Now},
                    {"status", "Pending"}
                });

                // Remove the item from the cart
                sql.Delete("cart", $"cart_id = {cartId}");

                return "Success";
            }
            catch
            {
                return "Error";
            }
        }
    }
}



//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace TestNewWeb1
//{
//    public partial class cart : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}