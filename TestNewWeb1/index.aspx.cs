using System;
using System.Collections.Generic;
using System.Data;
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
            DashboardBtn.Visible = res && TokenManager.IsUserAdmin(Session);

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

            LoadAllPriducts();

        }

        private void LoadAllPriducts()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dataTable = sql.SelectAll("products");

            foreach(DataRow row in dataTable.Rows)
            {
                if (row["category"].ToString().Equals("Men\'s", StringComparison.OrdinalIgnoreCase))
                {
                    AddProductCardHTML(row["product_name"].ToString(),
                        row["price"].ToString(),
                        row["image_url_full"].ToString(),
                        row["product_id"].ToString(),
                        Convert.ToInt16(double.Parse(row["rate"].ToString())));
                }
            }
        }

        public void AddProductCardHTML(string title, string price, string img, string id, int stars)
        {
            string item = $@"
                <div class=""item"">
                    <div class=""thumb"">
                        <div class=""hover-content"">
                            <ul>
                                <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-eye""></i></a></li>
                                <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-star""></i></a></li>
                                <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-shopping-cart""></i></a></li>
                            </ul>
                        </div>
                        <!-- Wrapper div for image with aspect ratio control -->
                        <div class=""image-wrapper"">
                            <img src=""/AllUploadedImages/{img}"" alt=""{img}"" class=""responsive-img"">
                        </div>
                    </div>
                    <div class=""down-content"">
                        <h4>{title}</h4>
                        <span>${price}</span>
                        <ul class=""stars"">
                            {GetStart(stars)}
                        </ul>
                    </div>
                </div>
            ";

            MenContent.InnerHtml += item;
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



        //public void AddProductCardHTML(string title, string price, string img, string id)
        //{
        //    string item = $@"
        //        <div class=""item"">
        //            <div class=""thumb"">
        //                <div class=""hover-content"">
        //                    <ul>
        //                        <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-eye""></i></a></li>
        //                        <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-star""></i></a></li>
        //                        <li><a href=""/single-product.aspx?id={id}""><i class=""fa fa-shopping-cart""></i></a></li>
        //                    </ul>
        //                </div>
        //                <img src=""/AllUploadedImages/{img}"" alt=""{img}"">
        //            </div>
        //            <div class=""down-content"">
        //                <h4>{title}</h4>
        //                <span>${price}</span>
        //                <ul class=""stars"">
        //                    <li><i class=""fa fa-star""></i></li>
        //                    <li><i class=""fa fa-star""></i></li>
        //                    <li><i class=""fa fa-star""></i></li>
        //                    <li><i class=""fa fa-star""></i></li>
        //                    <li><i class=""fa fa-star""></i></li>
        //                </ul>
        //            </div>
        //        </div>
        //    ";

        //    MenContent.InnerHtml += item;
        //}


    }
}