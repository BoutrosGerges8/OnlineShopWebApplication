using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

// CartItem class (simple representation)
public class CartItem
{
    public string ProductId { get; set; }
    public int Quantity { get; set; }
}

namespace TestNewWeb1
{
    public partial class single_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                try
                {
                    SqlConnectionClass sql = new SqlConnectionClass();
                    var data = sql.SelectAllCondition("products", $"product_id = {id}");
                    if (data != null && data.Rows.Count > 0)
                    {
                        var row = data.Rows[0];

                        ProTitle.InnerText = row["product_name"].ToString();
                        ProPrice.InnerText = "$" + row["price"].ToString();
                        TotalPrice.InnerText = "Total: $" + row["price"].ToString();
                        ProPriceValue.Value = row["price"].ToString();
                        ProImg1.Src = "/AllUploadedImages/" + row["image_url_thumbnail"].ToString();
                        ProImg2.Src = "/AllUploadedImages/" + row["image_url_full"].ToString();
                        ProShortDesc.InnerText = row["short_description"].ToString();
                        ProLongDesc.InnerText = row["long_description"].ToString();
                        AddQuantityOrdered.Attributes["max"] = row["number_of_orders"].ToString();
                        ProStars.InnerHtml = GetStart(Convert.ToInt16(double.Parse(row["rate"].ToString())));
                        ProIdHidden.Value = id;
                    }
                    else
                    {
                        Response.Redirect("/index.aspx");
                    }
                }
                catch
                {
                    Response.Redirect("/index.aspx");
                }


                ClientScript.RegisterHiddenField("__EVENTTARGET", "");
                ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
            }

            if (IsPostBack)
            {
                // Retrieve the rating value from the hidden field
                string ratingValue = Request.Form["RatingHiddenField"];

                // If the rating value is valid, update the database
                if (int.TryParse(ratingValue, out int rating) && rating >= 0 && rating <= 5)
                {
                    SqlConnectionClass sql = new SqlConnectionClass();
                    sql.UpdateData("products", new Dictionary<string, object> {
                        {"rate", rating }
                    }, $"product_id = {id}");  // Make sure to use the correct column name for product ID
                }
            }
        }

        private string GetStart(int n)
        {
            string stars = "";

            for (int i = 0; i < n; i++)
            {
                stars += "<li><i class=\"fa fa-star\"></i></li>";
            }

            for (int i = 0; i < 5 - n; i++)
            {
                stars += "<li><i class=\"fa fa-star-o\"></i>\r\n</li>";
            }

            return stars;
        }

        //public void BuyProduct()
        //{
        //    string id = Request.QueryString["id"];
        //    SqlConnectionClass sql = new SqlConnectionClass();
        //    var data = sql.SelectAllCondition("products", $"product_id = {id}");
        //    DataTable dt = sql.SelectAllCondition("products", $"product_id = {id}");
        //    DataRow row = dt.Rows[0];

        //    sql.UpdateData("priducts", new Dictionary<string, object>
        //    {
        //        {"number_of_orders", int.Parse(row["number_of_orders"].ToString()) - int.Parse(AddQuantityOrdered.Value) }
        //    }, $"product_id = {id}");
        //}


        //[WebMethod]
        //public static string BuyProduct(int productId, int quantity)
        //{
        //    try
        //    {
        //        SqlConnectionClass sql = new SqlConnectionClass();

        //        // Use parameterized query to avoid SQL injection
        //        var data = sql.SelectAllCondition("products", "product_id = @productId");

        //        if (data != null && data.Rows.Count > 0)
        //        {
        //            DataRow row = data.Rows[0];

        //            // Subtract quantity from current number of orders
        //            int currentOrders = int.Parse(row["number_of_orders"].ToString());
        //            int updatedOrders = currentOrders - quantity;  // Correct calculation for subtracting

        //            // Update the product in the database using parameterized queries
        //            sql.UpdateData("products", new Dictionary<string, object>
        //    {
        //        {"number_of_orders", updatedOrders }
        //    }, "product_id = @productId");

        //            // Return a structured JSON response
        //            var response = new { success = true, message = "Product updated successfully" };
        //            return new JavaScriptSerializer().Serialize(response);
        //        }
        //        else
        //        {
        //            // Return error response in JSON format
        //            var response = new { success = false, message = "Product not found" };
        //            return new JavaScriptSerializer().Serialize(response);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the exception (use logging framework here)
        //        var response = new { success = false, message = $"Error: {ex.Message}" };
        //        return new JavaScriptSerializer().Serialize(response);
        //    }
        //}



        //[WebMethod]
        //public static string BuyProduct(string productId, string quantity, string totalPrice)
        //{
        //    try
        //    {
        //        SqlConnectionClass sql = new SqlConnectionClass();
        //        sql.InsertData("ordered", new Dictionary<string, object> {
        //            {"user_id", TokenManager.GetUserIdFromSession(HttpContext.Current.Session) },
        //            {"product_id", productId },
        //            {"quantity", quantity },
        //            {"total_price", totalPrice}
        //        });

        //        return new JavaScriptSerializer().Serialize(new { success = true, message = "Product added to cart" });
        //    }
        //    catch (Exception ex)
        //    {
        //        return new JavaScriptSerializer().Serialize(new { success = false, message = $"Error: {ex.Message}" });
        //    }
        //}





        [WebMethod]
        public static string BuyProduct(string productId, int quantity, double totalPrice)
        {

            if (!TokenManager.IsLoggedInAlready(HttpContext.Current.Session))
            {
                // Return a redirect response
                return new JavaScriptSerializer().Serialize(new { success = false, 
                    message = "Please log in first.",
                    redirectTo = "/login.aspx" });
            }

            try
            {
                SqlConnectionClass sql = new SqlConnectionClass();
                sql.InsertData("ordered", new Dictionary<string, object> {
                    {"user_id", TokenManager.GetUserIdFromSession(HttpContext.Current.Session) },
                    {"product_id", productId },
                    {"quantity", quantity },
                    {"total_price", totalPrice}
                });


                //var data = sql.SelectAllCondition("products", $"product_id = {productId}");
                //DataRow row = data.Rows[0];
                //int currentOrders = int.Parse(row["number_of_orders"].ToString());
                //int updatedOrders = currentOrders - quantity;
                //sql.UpdateData("products", new Dictionary<string, object>
                //                {
                //                    {"number_of_orders", updatedOrders }
                //                }, $"product_id = {productId}");


                return new JavaScriptSerializer().Serialize(new { success = true, message = "Product added to cart" });
            }
            catch (Exception ex)
            {
                return new JavaScriptSerializer().Serialize(new { success = false, message = $"Error: {ex.Message}" });
            }
        }


        /// <summary>
        /// ///////  best
        /// </summary>
        //[WebMethod]
        //public static string BuyProduct(string productId, int quantity)
        //{
        //    try
        //    {
        //        SqlConnectionClass sql = new SqlConnectionClass();

        //        //sql.InsertData("ordered", new Dictionary<string, object> {
        //        //    {"user_id", TokenManager.GetUserIdFromSession(HttpContext.Current.Session) },
        //        //    {"product_id", productId },
        //        //    {"quantity", quantity },
        //        //    {"total_price", totalPrice}
        //        //});
        //        //return "Success";

        //        // Select product details from the database
        //        var data = sql.SelectAllCondition("products", $"product_id = {productId}");
        //        if (data != null && data.Rows.Count > 0)
        //        {
        //            DataRow row = data.Rows[0];

        //            // Subtract the quantity ordered from the existing number of orders
        //            int currentOrders = int.Parse(row["number_of_orders"].ToString());
        //            int updatedOrders = currentOrders - quantity; // assuming quantity should add to number of orders

        //            // Update the product in the database
        //            sql.UpdateData("products", new Dictionary<string, object>
        //                {
        //                    {"number_of_orders", updatedOrders }
        //                }, $"product_id = {productId}");

        //            return "Success"; // Optionally return a success response
        //        }
        //        else
        //        {
        //            return "Product not found"; // Handle case where product is not found in database
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the exception and return a failure message
        //        return $"Error: {ex.Message}";
        //    }
        //}




    }
}





//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace TestNewWeb1
//{
//    public partial class single_product : System.Web.UI.Page
//    {
//        private int productId = 0;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // Get the product ID from the query string (if available)
//            string idParam = Request.QueryString["id"];
//            bool hasValidId = int.TryParse(idParam, out productId);

//            if (!IsPostBack && hasValidId)
//            {
//                LoadProductData(productId);
//            }

//            ClientScript.RegisterHiddenField("__EVENTTARGET", "");
//            ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
//        }

//        private void LoadProductData(int productId)
//        {
//            try
//            {
//                SqlConnectionClass sql = new SqlConnectionClass();
//                var data = sql.SelectAllCondition("products", "product_id = @productId");

//                if (data != null && data.Rows.Count > 0)
//                {
//                    var row = data.Rows[0];

//                    ProTitle.InnerText = row["product_name"]?.ToString() ?? "";
//                    ProPrice.InnerText = row["price"]?.ToString() ?? "0";
//                    TotalPrice.InnerText = "Total: $" + (row["price"]?.ToString() ?? "0");
//                    ProImg1.Src = "/AllUploadedImages/" + (row["image_url_thumbnail"]?.ToString() ?? "default.png");
//                    ProImg2.Src = "/AllUploadedImages/" + (row["image_url_full"]?.ToString() ?? "default.png");
//                    ProShortDesc.InnerText = row["short_description"]?.ToString() ?? "";
//                    ProLongDesc.InnerText = row["long_description"]?.ToString() ?? "";
//                    AddQuantityOrdered.Attributes["max"] = row["number_of_orders"]?.ToString() ?? "0";

//                    int rating = row["rate"] is DBNull ? 0 : Convert.ToInt32(row["rate"]);
//                    ProStars.InnerHtml = GetStars(rating);
//                }
//            }
//            catch
//            {
//                // Don't redirect; just leave the page as is.
//            }
//        }

//        protected void SubmitRating_Click(object sender, EventArgs e)
//        {
//            // Read the rating value from the hidden field
//            string ratingValue = AddQuantityOrdered.Value;
//            if (int.TryParse(ratingValue, out int rating) && rating >= 0 && rating <= 5)
//            {
//                SqlConnectionClass sql = new SqlConnectionClass();
//                sql.UpdateData("products", new Dictionary<string, object> {
//                    { "rate", rating }
//                }, "product_id = @productId");

//                // Reload product data to update the stars
//                LoadProductData(productId);
//            }
//        }

//        private string GetStars(int n)
//        {
//            string stars = "";
//            for (int i = 0; i < n; i++)
//            {
//                stars += "<li><i class=\"fa fa-star\"></i></li>";
//            }
//            for (int i = 0; i < 5 - n; i++)
//            {
//                stars += "<li><i class=\"fa fa-star-o\"></i></li>";
//            }
//            return stars;
//        }
//    }
//}

