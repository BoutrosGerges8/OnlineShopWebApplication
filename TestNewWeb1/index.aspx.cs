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
            LoadAllPriducts();

        }


        private void LoadAllPriducts()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dataTable = sql.SelectAll("products");
            

            foreach (DataRow row in dataTable.Rows)
            {
                if (row["category"].ToString().Equals("Men\'s", StringComparison.OrdinalIgnoreCase))
                {
                    MenContent.InnerHtml += AddProductCardHTML(row["product_name"].ToString(),
                        row["price"].ToString(),
                        row["image_url_full"].ToString(),
                        row["product_id"].ToString(),
                        Convert.ToInt16(sql.GetAvg("rated", "rating", $"product_id = {row["product_id"]}")));
                }
                else if (row["category"].ToString().Equals("Women\'s", StringComparison.OrdinalIgnoreCase))
                {
                    WomenContent.InnerHtml += AddProductCardHTML(row["product_name"].ToString(),
                        row["price"].ToString(),
                        row["image_url_full"].ToString(),
                        row["product_id"].ToString(),
                        Convert.ToInt16(sql.GetAvg("rated", "rating", $"product_id = {row["product_id"]}")));
                }
                else if (row["category"].ToString().Equals("Kid\'s", StringComparison.OrdinalIgnoreCase))
                {
                    KidsContent.InnerHtml += AddProductCardHTML(row["product_name"].ToString(),
                        row["price"].ToString(),
                        row["image_url_full"].ToString(),
                        row["product_id"].ToString(),
                        Convert.ToInt16(sql.GetAvg("rated", "rating", $"product_id = {row["product_id"]}")));
                }
            }
        }

        public string AddProductCardHTML(string title, string price, string img, string id, int stars)
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

            return item;
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