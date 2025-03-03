using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestNewWeb1.QRCodeHanlder;

namespace TestNewWeb1
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!TokenManager.IsLoggedInAlready(Session))
            {
                TokenManager.SetLastPageUrl(Session, "/orders.aspx");
                Response.Redirect("/login.aspx");
            }else if (TokenManager.IsUserAdmin(Session))
            {
                Response.Redirect("/DashBoard.aspx");
            }


            LoadOrdersData();


            ClientScript.RegisterHiddenField("__EVENTTARGET", "");
            ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
        }

        private void LoadOrdersData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.JoinTables(new string[] { "ordered", "products" },
                 new Dictionary<string, string>
                 {
                    {"ordered.product_id", "products.product_id"}
                 }, condition:$"user_id = {TokenManager.GetUserIdFromSession(Session)}", orderBy: "order_id", sortDirection: "DESC");

            string tableRows = "";
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["order_id"].ToString(),
                       title = row["short_description"].ToString(),
                       img1 = row["image_url_thumbnail"].ToString(),
                       quantity = row["quantity"].ToString(),
                       order_date = row["order_date"].ToString(),
                       total_price = row["total_price"].ToString(),
                       status = row["status"].ToString();

                // Generate a QR code based on the order id (or any other unique value)
                //string qrCodeImage = QRHandler.GenerateQRCodeAsBase64($"");
                

                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority;
                string orderDetailsUrl = $"{baseUrl}/OrderDetails.aspx?id={id}"; 
                string qrCodeImage = QRHandler.GenerateQRCodeAsBase64(orderDetailsUrl);


                tableRows += $@"
                    <tr id='orderRow_{id}'>
                        <td>{++i}</td>
                        <td>{title}</td>
                        <td class='py-1'>
                            <img src='/AllUploadedImages/{img1}' alt='product image' />
                        </td>S
                        <td>{quantity}</td>
                        <td>{total_price}</td>
                        <td>{order_date}</td>
                        <td>{status}</td>
                        <td>
                            <img src='{qrCodeImage}' alt='QR Code for order {id}' style='width:100px;height:100px;' class='QrImg' />
                        </td>
                        <td>{DeleteOrNot(status, id)}</td>
                    </tr>";
            }

            OrderesTable.InnerHtml = tableRows;
        }


        //private void LoadOrdersData()
        //{
        //    SqlConnectionClass sql = new SqlConnectionClass();
        //    //DataTable dt = sql.SelectAllCondition("ordered", $"user_id = {TokenManager.GetUserIdFromSession(Session)}");
        //    DataTable dt = sql.JoinTables(new string[] { "ordered", "products" },
        //            new Dictionary<string, string>
        //            {
        //                            {"ordered.product_id" , "products.product_id" }
        //            }, orderBy: "order_id", sortDirection: "DESC");

        //    string tableRows = "";
        //    int i = 0;
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        string id = row["order_id"].ToString(),
        //               title = row["short_description"].ToString(),
        //               img1 = row["image_url_thumbnail"].ToString(),
        //               quantity = row["quantity"].ToString(),
        //               order_date = row["order_date"].ToString(),
        //               total_price = row["total_price"].ToString(),
        //               status = row["status"].ToString();

        //        tableRows += $@"
        //            <tr id='orderRow_{id}'>
        //                <td>{++i}</td>
        //                <td>{title}</td>
        //                <td class='py-1'>
        //                    <img src='/AllUploadedImages/{img1}' alt='product image' />
        //                </td>
        //                <td>{quantity}</td>
        //                <td>{total_price}</td>
        //                <td>{order_date}</td>
        //                <td>{status}</td>
        //                <td>
        //                    {DeleteOrNot(status, id)}
        //                </td>
        //            </tr>";
        //    }

        //    OrderesTable.InnerHtml = tableRows;
        //}

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
                DataTable dt = sql.SelectAllCondition("ordered", $"order_id = {orderId}");
                DataRow dataRow = dt.Rows[0];
                
                dt = sql.SelectAllCondition("products", $"product_id = {dataRow["product_id"]}");
                string oldQuantity = dt.Rows[0]["number_of_orders"].ToString();


                sql.UpdateData("products", new Dictionary<string, object>
                {
                    {"number_of_orders", Convert.ToInt32(oldQuantity) + Convert.ToInt32(dataRow["quantity"].ToString())}
                }, $"product_id = {dataRow["product_id"]}");

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