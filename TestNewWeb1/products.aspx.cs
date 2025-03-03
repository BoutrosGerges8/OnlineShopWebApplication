using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSomeProducts();
            }
        }

        private void LoadSomeProducts()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dtMen = sql.SelectTopN("products", 3, "category");

            foreach (DataRow row in dtMen.Rows)
            {
                ProductsContainer.InnerHtml += AddProductCardHTML(row["product_name"].ToString(),
                    row["price"].ToString(),
                    row["image_url_full"].ToString(),
                    row["product_id"].ToString(),
                    Convert.ToInt16(sql.GetAvg("rated", "rating", $"product_id = {row["product_id"]}")));
            }

            ProductsContainer.InnerHtml += PagesNumber();

        }

        public string AddProductCardHTML(string title, string price, string img, string id, int stars)
        {
            string item = $@"
                <div class= ""col-lg-4"" >
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

        private string PagesNumber()
        {
            return @"
                <div class=""col-lg-12"">
                    <div class=""pagination"">
                        <ul>
                            <li class=""active"">
                                <a href=""#"">1</a>
                            </li>
                            <li>
                                <a href=""#"">2</a>
                            </li>
                            <li>
                                <a href=""#"">3</a>
                            </li>
                            <li>
                                <a href=""#"">4</a>
                            </li>
                            <li>
                                <a href=""#"">></a>
                            </li>
                        </ul>
                    </div>
                </div>
            ";
        }

    }
}


//< div class= "col-lg-4" >
//    < div class= "item" >
//        < div class= "thumb" >
//            < div class= "hover-content" >
//                < ul >
//                    < li >< a href = "single-product.html" >< i class= "fa fa-eye" ></ i ></ a ></ li >
//                    < li >< a href = "single-product.html" >< i class= "fa fa-star" ></ i ></ a ></ li >
//                    < li >< a href = "single-product.html" >< i class= "fa fa-shopping-cart" ></ i ></ a ></ li >
//                </ ul >
//            </ div >
//            < img src = "assets/images/men-01.jpg" alt = "" >
//        </ div >
//        < div class= "down-content" >
//            < h4 > Classic Spring </ h4 >
//            < span >$120.00 </ span >
//            < ul class= "stars" >
//                < li >< i class= "fa fa-star" ></ i ></ li >
//                < li >< i class= "fa fa-star" ></ i ></ li >
//                < li >< i class= "fa fa-star" ></ i ></ li >
//                < li >< i class= "fa fa-star" ></ i ></ li >
//                < li >< i class= "fa fa-star" ></ i ></ li >
//            </ ul >
//        </ div >
//    </ div >
//</ div >