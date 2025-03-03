using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class OrderDeatils : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                try
                {
                    SqlConnectionClass sql = new SqlConnectionClass();
                    //var data = sql.SelectAllCondition("products", $"product_id = {id}");
                    DataTable data = sql.JoinTables(new string[] { "ordered", "products", "users" },
                         new Dictionary<string, string>
                         {
                                 {"ordered.product_id", "products.product_id"},
                                 {"ordered.user_id", "users.id"}
                         },  $"order_id = {id}");


                    //DataTable dt = sql.JoinTables(new string[] { "ordered", "products" },
                    //     new Dictionary<string, string>
                    //     {
                    //             {"ordered.product_id", "products.product_id"}
                    //     }, orderBy: "order_id", sortDirection: "DESC");


                    if (data != null && data.Rows.Count > 0)
                    {
                        var row = data.Rows[0];

                        ProTitle.InnerText = row["product_name"].ToString();
                        ProPrice.InnerText = "$" + row["price"].ToString();
                        TotalPrice.InnerText = "$" + row["total_price"].ToString();
                        ProPriceValue.Value = row["price"].ToString();
                        ProImg1.Src = "/AllUploadedImages/" + row["image_url_thumbnail"].ToString();
                        ProImg2.Src = "/AllUploadedImages/" + row["image_url_full"].ToString();
                        ProShortDesc.InnerText = row["short_description"].ToString();
                        ProLongDesc.InnerText = row["long_description"].ToString();
                        NOfOrder.InnerText = row["quantity"].ToString();
                        ProStars.InnerHtml = GetStart(Convert.ToInt16(double.Parse(row["rate"].ToString())));
                        DateOfOrder.InnerText = row["order_date"].ToString();
                        Buyer.InnerText = row["name"].ToString();
                        OrderStatus.InnerText = row["status"].ToString();
                        ProIdHidden.Value = id;

                        NotFoundDiv.Style["display"] = "none";
                    }
                    else
                    {
                        //Response.Redirect("/index.aspx");
                        ItemDiv.Style["display"] = "none";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    //Response.Redirect("/index.aspx");
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

    }
}