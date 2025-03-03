using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Microsoft.Ajax.Utilities;
using System.Web.Services;
using System.Configuration;
using System.Security.Cryptography;
using System.Diagnostics;

namespace TestNewWeb1
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        public string[] Categories = new string[]
        {
            "Men\'s", "Women\'s", "Kid\'s"
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (TokenManager.IsLoggedInAlready(Session))
            {
                if (!TokenManager.IsUserAdmin(Session))
                {
                    Response.Redirect($"/index.aspx");
                }
            }
            else
            {
                Response.Redirect($"/login.aspx");
            }
            if (!IsPostBack)
            {
                LoadUserData();
                LoadProductsData();
                LoadOrdersData();
                //LoadOrdersData(OrderesTable);

                //BindData();

            }


            ClientScript.RegisterHiddenField("__EVENTTARGET", "");
            ClientScript.RegisterHiddenField("__EVENTARGUMENT", "");
        }


        private void LoadUserData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            //DataTable dt = sql.SelectAllCondition("users", $"id <> {TokenManager.GetUserIdFromSession(Session)}");
            DataTable dt = sql.UsersWithTheirAmount();

            // Dynamically populate the table rows
            string tableRows = "";
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["user_id"].ToString();
                string name = row["user_name"].ToString();
                string email = row["user_email"].ToString();
                string password = row["user_password"].ToString();
                string amount = row["total_amount_spent"].ToString();
                //string progress = GetProgressBar();

                tableRows += $@"
                        <tr>
                            <td>{i++}</td>
                            <td>{name}</td>
                            <td>{email}</td>
                            <td>${amount}</td>
                            <td>
                                <form runat=""server"">
                                    <button type=""button"" class=""btn btn-inverse-success btn-fw"" runat=""server""
                                          onclick=""switchToEditMode(
                                                &quot;{id}&quot;, &quot;{name}&quot;, &quot;{email}&quot;, &quot;{password}&quot;
                                              )""
                                    >Edit</button>
                                </form>
                            </td>
                            <td>
                                <form runat=""server"">
                                    <button type=""button"" class=""btn btn-inverse-danger btn-fw"" runat=""server""
                                          onclick=""confirmAction({id}, DeleteUser)""
                                    >Delete</button>
                                </form>
                            </td>
                        </tr>";
            }

            // Inject rows into the table body
            userTableBody.InnerHtml = tableRows;
        }
        private string GetProgressBar(String value="50")
        {
            if (value.Equals("33"))
            {
                return $@"
                    <div class='progress'>
                        <div class='progress-bar bg-danger' role='progressbar'
                             style='width: {value}%' aria-valuenow='25'
                             aria-valuemin='0' aria-valuemax='100'>
                        </div>
                    </div>";
            }else if (value.Equals("66"))
            {
                return $@"
                    <div class='progress'>
                        <div class='progress-bar bg-warning' role='progressbar'
                             style='width: {value}%' aria-valuenow='25'
                             aria-valuemin='0' aria-valuemax='100'>
                        </div>
                    </div>";
            }
            return $@"
                <div class='progress'>
                    <div class='progress-bar bg-success' role='progressbar'
                         style='width: {value}%' aria-valuenow='25'
                         aria-valuemin='0' aria-valuemax='100'>
                    </div>
                </div>";
        }
        private void LoadProductsData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectAll("products");

            DataTable dt_rates = sql.JoinTables(new string[] { "rated", "products" },
                new Dictionary<string, string>
                {
                    {"rated.product_id", "products.product_id" }
                });

            string tableRows = "";
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["product_id"].ToString(),
                       title = row["product_name"].ToString(),
                       desc1 = row["short_description"].ToString(),
                       desc2 = row["long_description"].ToString(),
                       price = row["price"].ToString(),
                       rate = row["rate"].ToString(),
                       img1 = row["image_url_thumbnail"].ToString(),
                       img2 = row["image_url_full"].ToString(),
                       category = row["category"].ToString(),
                       no = row["number_of_orders"].ToString(),
                       created_at = row["created_at"].ToString(),
                       updated_at = row["updated_at"].ToString();

                double totalRating = 0.0;
                int ratingCount = 0;

                // Calculate the average rating for the product
                foreach (DataRow col in dt_rates.Rows)
                {
                    if (col["product_id"].ToString().Equals(id))
                    {
                        totalRating += Double.Parse(col["rating"].ToString());
                        ratingCount++;
                    }
                }

                double averageRating = ratingCount > 0 ? totalRating / ratingCount : 0.0;

                tableRows += $@"
            <tr>
                <td>{i++}</td>
                <td>{title}</td>
                <td>{desc1}</td>
                <td>{desc2}</td>
                <td>${price}</td>
                <td>{no}</td>
                <td class=""py-1"">
                    <img src=""/AllUploadedImages/{img1}"" alt=""product image"" />
                </td>
                <td class=""py-1"">
                    <img src=""/AllUploadedImages/{img2}"" alt=""other side image"" />
                </td>
                <td>{category}</td>
                <td>{averageRating.ToString("F2")}</td>
                <td class=""wholeText"">{created_at}</td>
                <td class=""wholeText"">{updated_at}</td>
                <td>
                    <form runat=""server"">
                        <button type=""button"" class=""btn btn-inverse-success btn-fw"" runat=""server""
                              onclick=""ShowAddWindowFunctionAsEdit(&quot;{id}&quot;, &quot;{title}&quot;,
                                            &quot;{desc1}&quot;, &quot;{desc2}&quot;, 
                                            &quot;{price}&quot;, &quot;{no}&quot;, &quot;{img1}&quot;, 
                                            &quot;{img2}&quot;, {IndexOf(category)})""
                        >Edit</button>
                    </form>
                </td>
                <td>
                    <form runat=""server"">
                        <button type=""button"" class=""btn btn-inverse-danger btn-fw"" runat=""server""
                              onclick=""confirmAction({id}, DeleteProduct)""
                        >Delete</button>
                    </form>
                </td>
            </tr>";
            }

            productsTableBody.InnerHtml = tableRows;
        }

        [WebMethod]
        public static string CheckEmailExists(string email)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                DataTable data = sql.SelectColumnsCondition("users", new string[]
                {
                    "id"
                }, $"email='{email}'");

                if (data != null && data.Rows.Count > 0)
                {
                    return "exists"; // Email already exists
                }
                else
                {
                    return "not_exists"; // Email does not exist
                }
            }
            catch (Exception ex)
            {
                // Log or handle exception if necessary
                return "error: " + ex.Message;
            }
        }

        [WebMethod]
        public static string AddUser(string username, string email, string password)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                sql.InsertData("users", new Dictionary<string, object>
                {
                    {"name", username},
                    {"email", email},
                    {"password", password}
                });

                return "success"; // User added successfully
            }
            catch (Exception ex)
            {
                // Log or handle exception if necessary
                return "error: " + ex.Message;
            }
        }
        [WebMethod]
        public static string EditUser(int userId, string username, string email, string password)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                sql.UpdateData("users", new Dictionary<string, object>
                {
                    {"name", username},
                    {"email", email},
                    {"password", password}
                }, $"id = {userId}");

                return "success"; // User updated successfully
            }
            catch (Exception ex)
            {
                // Log or handle exception if necessary
                return "error: " + ex.Message;
            }
        }


        private int IndexOf(string value)
        {
            int i = 0;
            foreach(string item in Categories)
            {
                if (item.Equals(value, StringComparison.OrdinalIgnoreCase)) return i;
                i++;
            }
            return -1;
        }

        private void LoadOrdersData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.JoinTables(new string[] {"ordered", "products", "users" }, 
                new Dictionary<string, string>
                {
                    {"ordered.product_id" , "products.product_id" },
                    {"ordered.user_id", "users.id" }
                }, orderBy: "order_id", sortDirection: "DESC");


            string tableRows = "";
            int i = 1;
            foreach (DataRow row in dt.Rows)
            {
                string id = row["order_id"].ToString(),
                       title = row["short_description"].ToString(),
                       name = row["name"].ToString(),
                       img1 = row["image_url_thumbnail"].ToString(),
                       quantity = row["quantity"].ToString(),
                       order_date = row["order_date"].ToString(),
                       total_price = row["total_price"].ToString(),
                       status = row["status"].ToString();

                tableRows += $@"
                    <tr id='orderRow_{id}'>
                        <td>{i++}</td>
                        <td>{name}</td>
                        <td>{title}</td>
                        <td class='py-1'>
                            <img src='/AllUploadedImages/{img1}' alt='product image' />
                        </td>
                        <td>{quantity}</td>
                        <td>{total_price}</td>
                        <td class=""wholeText"">{order_date}</td>
                        <td>{SelectedStatus(status, int.Parse(id))}</td>
                        <td>{GetProgressBar(GetProgressValue(status))}</td>
                        <td>
                            <form runat=""server"">
                                <button type=""button"" class=""btn btn-inverse-danger btn-fw"" runat=""server""
                                      onclick=""confirmAction({id}, DeleteOrder)""
                                >Delete</button>
                            </form>
                        </td>
                    </tr>";
            }


            OrderesTable.InnerHtml = tableRows;
        }


        


        [WebMethod]
        public static string DeleteOrder(int orderId)
        {

            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                DataTable dt = sql.SelectAllCondition("ordered", $"order_id = {orderId}");
                DataRow dataRow = dt.Rows[0];

                if (!dataRow["status"].ToString().Equals("Delivered"))
                {
                    dt = sql.SelectAllCondition("products", $"product_id = {dataRow["product_id"]}");
                    string oldQuantity = dt.Rows[0]["number_of_orders"].ToString();


                    sql.UpdateData("products", new Dictionary<string, object>
                    {
                        {"number_of_orders", Convert.ToInt32(oldQuantity) + Convert.ToInt32(dataRow["quantity"].ToString())}
                    }, $"product_id = {dataRow["product_id"]}");
                }

                sql.Delete("ordered", $"order_id = {orderId}");

                return "Success";
            }
            catch
            {
                return "Error";
            }


            //SqlConnectionClass sql = new SqlConnectionClass();
            //try
            //{
            //    sql.Delete("ordered", $"order_id = {orderId}");
            //    return "Success";
            //}
            //catch
            //{
            //    return "Error";
            //}
        }
        [WebMethod]
        public static string DeleteProduct(int proId)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                // Retrieve the image file paths from the database
                DataTable dt = sql.SelectColumnsCondition("products", new string[] { "image_url_thumbnail", "image_url_full" },
                    $"product_id = {proId}");

                if (dt.Rows.Count > 0)
                {
                    // Get the image file names from the database
                    string imageThumbnail = dt.Rows[0]["image_url_thumbnail"].ToString();
                    string imageFull = dt.Rows[0]["image_url_full"].ToString();

                    // Define the folder path where images are stored
                    string folderPath = HttpContext.Current.Server.MapPath("~/AllUploadedImages/");

                    // Check if the image files exist and delete them
                    if (File.Exists(Path.Combine(folderPath, imageThumbnail)))
                    {
                        File.Delete(Path.Combine(folderPath, imageThumbnail));
                    }

                    if (File.Exists(Path.Combine(folderPath, imageFull)))
                    {
                        File.Delete(Path.Combine(folderPath, imageFull));
                    }
                }

                // Now, delete the product record from the database
                sql.Delete("products", $"product_id = {proId}");

                // Delete related records in "rated" table
                sql.Delete("rated", $"product_id = {proId}");

                // Delete related records in "ordered" table
                sql.Delete("ordered", $"product_id = {proId}");

                return "Success";
            }
            catch (Exception ex)
            {
                // Log or handle exception if necessary
                return "Error: " + ex.Message;
            }
        }

        [WebMethod]
        public static string DeleteUser(int userId)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {


                DataTable dt = sql.SelectAllCondition("ordered", $"user_id = {userId}");
                
                foreach(DataRow row in dt.Rows)
                {
                    if (!row["status"].ToString().Equals("Delivered"))
                    {
                        dt = sql.SelectAllCondition("products", $"product_id = {row["product_id"]}");
                        string oldQuantity = dt.Rows[0]["number_of_orders"].ToString();


                        sql.UpdateData("products", new Dictionary<string, object>
                    {
                        {"number_of_orders", Convert.ToInt32(oldQuantity) + Convert.ToInt32(row["quantity"].ToString())}
                    }, $"product_id = {row["product_id"]}");
                    }
                }


                // Delete related records in "rated" table
                sql.Delete("rated", $"user_id = {userId}");

                // Delete related records in "ordered" table
                sql.Delete("ordered", $"user_id = {userId}");

                // Delete the user from the "users" table
                sql.Delete("users", $"id = {userId}");

                return "Success";
            }
            catch (Exception ex)
            {
                // Log or handle exception if necessary
                Console.WriteLine("Error deleting user: " + ex.Message); // Debugging
                return "Error: " + ex.Message;
            }
        }

        //private static string SelectedStatus(string item)
        //{
        //    return $@"
        //        <select class=""form-control"" runat=""server"" id=""OrderStatus"">
        //            <option {(item == "Pending" ? "selected" : "")}>Pending</option>
        //            <option {(item == "Shipped" ? "selected" : "")}>Shipped</option>
        //            <option {(item == "Delivered" ? "selected" : "")}>Delivered</option>
        //        </select>
        //    ";
        //}

        private static string SelectedStatus(string item, int orderId)
        {
            if(item == "Delivered")
            {
                return $"{item}";
            }
            return $@"
                <select class=""form-control"" runat=""server"" id=""OrderStatus"" data-order-id=""{orderId}"" onchange=""StatusChanged(this)"">
                    <option {(item == "Pending" ? "selected" : "")}>Pending</option>
                    <option {(item == "Shipped" ? "selected" : "")}>Shipped</option>
                    <option {(item == "Delivered" ? "selected" : "")}>Delivered</option>
                </select>
            ";
        }

        private static string GetProgressValue(string item)
        {
            if (item == "Pending") return "33";
            else if (item == "Shipped") return "66";
            else if (item == "Delivered") return "100";
            return "";
        }



        [WebMethod]
        public static string UpdateOrderStatus(int orderId, string status)
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            try
            {
                sql.UpdateData("ordered", new Dictionary<string, object>
                {
                    {"status", status}
                }, $"order_id = {orderId}");

                return "Success";
            }
            catch (Exception ex)
            {
                // Log the error if needed
                return "Error"; // Return error message
            }
        }


        protected void ButtonEdit_Click(object sender, EventArgs e)
        {
            // Define the folder path to save the image
            string folderPath = Server.MapPath("~/AllUploadedImages/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable imgs = sql.SelectColumnsCondition("products", new string[] {
                "image_url_thumbnail",
                "image_url_full"}, $"product_id = {ProId.Value}");
            DataRow dataRow = imgs.Rows[0];


            string filePathImg1 = "", filePathImg2 = "";
            string fileNameImg1 = dataRow["image_url_thumbnail"].ToString(),
                fileNameImg2 =  dataRow["image_url_full"].ToString();



            // Check if the "productImageInput" file input has been uploaded
            if (Request.Files["productImageInput"] != null && Request.Files["productImageInput"].ContentLength > 0)
            {
                var uploadedFile = Request.Files["productImageInput"];
                string fileExtension = Path.GetExtension(uploadedFile.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    try
                    {

                        if (File.Exists(Path.Combine(folderPath, filePathImg1)))
                        {
                            File.Delete(Path.Combine(folderPath, filePathImg1));
                        }

                        fileNameImg1 = "product_" + Guid.NewGuid().ToString() + fileExtension;
                        filePathImg1 = Path.Combine(folderPath, fileNameImg1);
                        uploadedFile.SaveAs(filePathImg1);

                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error uploading file: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("Only image files (.jpg, .jpeg, .png, .gif) are allowed.");
                }
            }
            
            // Check if the "sideImageInput" file input has been uploaded
            if (Request.Files["sideImageInput"] != null && Request.Files["sideImageInput"].ContentLength > 0)
            {
                var uploadedFile = Request.Files["sideImageInput"];
                string fileExtension = Path.GetExtension(uploadedFile.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    try
                    {

                        if (File.Exists(Path.Combine(folderPath, filePathImg2)))
                        {
                            File.Delete(Path.Combine(folderPath, filePathImg2));
                        }

                        fileNameImg2 = "side_" + Guid.NewGuid().ToString() + fileExtension;
                        filePathImg2 = Path.Combine(folderPath, fileNameImg2);
                        uploadedFile.SaveAs(filePathImg2);

                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error uploading file: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("Only image files (.jpg, .jpeg, .png, .gif) are allowed.");
                }
            }

            


            sql.UpdateData("products", new Dictionary<string, object>
                {
                    {"product_name", ProTitle.Value.Trim() },
                    {"short_description", ProShortDesc.Value.Trim() },
                    {"long_description", ProLongDesc.Value.Trim() },
                    {"price", ProPrice.Value.Trim() },
                    {"number_of_orders", ProQuantity.Value.Trim() },
                    {"image_url_thumbnail", fileNameImg1 },
                    {"image_url_full", fileNameImg2 },
                    {"category", Categories[ProCategory.SelectedIndex]},
                    {"updated_at", DateTime.Now.ToString()}
                }, $"product_id = {ProId.Value}");

            ClearAllFields();
            Response.Redirect("/AdminDashboard.aspx");
        }


        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            //Response.Redirect($"/AdminDashboard.aspx?cat={Categories[ProCategory.SelectedIndex]}");

            // Define the folder path to save the image
            string folderPath = Server.MapPath("~/AllUploadedImages/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath); // Create the folder if it doesn't exist
            }

            string filePathImg1 = "", filePathImg2 = "";
            string fileNameImg1 = "", fileNameImg2 = "";
            // Check if the "productImageInput" file input has been uploaded
            if (Request.Files["productImageInput"] != null && Request.Files["productImageInput"].ContentLength > 0)
            {
                // Get the uploaded file from the "productImageInput" input field
                var uploadedFile = Request.Files["productImageInput"];

                // Validate the file extension (only accept images)
                string fileExtension = Path.GetExtension(uploadedFile.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    try
                    {
                        // Generate a unique file name using GUID to prevent overwriting
                        fileNameImg1 = "product_" + Guid.NewGuid().ToString() + fileExtension;

                        // Define the full file path to save the uploaded image
                        filePathImg1 = Path.Combine(folderPath, fileNameImg1);

                        // Save the uploaded file to the server
                        uploadedFile.SaveAs(filePathImg1);

                    }
                    catch (Exception ex)
                    {
                        // Handle errors (e.g., file saving errors)
                        Response.Write("Error uploading file: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("Only image files (.jpg, .jpeg, .png, .gif) are allowed.");
                }
            }
            else
            {
                Response.Write("No file selected for upload.");
            }

            // Check if the "sideImageInput" file input has been uploaded
            if (Request.Files["sideImageInput"] != null && Request.Files["sideImageInput"].ContentLength > 0)
            {
                // Get the uploaded file from the "sideImageInput" input field
                var uploadedFile = Request.Files["sideImageInput"];

                // Validate the file extension (only accept images)
                string fileExtension = Path.GetExtension(uploadedFile.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    try
                    {
                        // Generate a unique file name using GUID to prevent overwriting
                        fileNameImg2 = "side_" + Guid.NewGuid().ToString() + fileExtension;

                        // Define the full file path to save the uploaded image
                        filePathImg2 = Path.Combine(folderPath, fileNameImg2);

                        // Save the uploaded file to the server
                        uploadedFile.SaveAs(filePathImg2);

                    }
                    catch (Exception ex)
                    {
                        // Handle errors (e.g., file saving errors)
                        Response.Write("Error uploading file: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("Only image files (.jpg, .jpeg, .png, .gif) are allowed.");
                }
            }
            else
            {
                Response.Write("No file selected for upload.");
            }
            
            SqlConnectionClass sql = new SqlConnectionClass();
            sql.InsertData("products", new Dictionary<string, object>
            {
                {"product_name", ProTitle.Value.Trim() },
                {"short_description", ProShortDesc.Value.Trim() },
                {"long_description", ProLongDesc.Value.Trim() },
                {"price", ProPrice.Value.Trim() },
                {"number_of_orders", ProQuantity.Value.Trim() },
                {"image_url_thumbnail", fileNameImg1 },
                {"image_url_full", fileNameImg2},
                {"category", Categories[ProCategory.SelectedIndex]}
            });
            ClearAllFields();

            Response.Redirect("/AdminDashboard.aspx");
        }

        private void ClearAllFields()
        {
            ProTitle.Value = "";
            ProShortDesc.Value = "";
            ProLongDesc.Value = "";
            ProQuantity.Value = "";
            ProPrice.Value = "";
            imageName1.Value = "";
            imageName2.Value = "";
        }



        //protected void AddNewProduct(object sender, EventArgs e)
        //{
        //    // Check if a file was uploaded
        //    if (FileUploadImage.HasFile)
        //    {
        //        // Get the file's extension
        //        string fileExtension = Path.GetExtension(FileUploadImage.FileName).ToLower();

        //        // Validate if the file is an image
        //        if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
        //        {
        //            try
        //            {
        //                // Create the folder if it doesn't exist
        //                string folderPath = Server.MapPath("~/AllUploadedImages/");
        //                if (!Directory.Exists(folderPath))
        //                {
        //                    Directory.CreateDirectory(folderPath);
        //                }

        //                // Generate a unique file name to avoid overwriting existing files
        //                string fileName = Guid.NewGuid().ToString() + fileExtension;

        //                // Save the file to the folder
        //                string filePath = Path.Combine(folderPath, fileName);
        //                FileUploadImage.SaveAs(filePath);

        //                // Provide success feedback
        //                LabelMessage.Text = "Image uploaded successfully!";
        //                LabelMessage.ForeColor = System.Drawing.Color.Green;
        //            }
        //            catch (Exception ex)
        //            {
        //                LabelMessage.Text = "Error uploading image: " + ex.Message;
        //            }
        //        }
        //        else
        //        {
        //            LabelMessage.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
        //        }
        //    }
        //    else
        //    {
        //        LabelMessage.Text = "Please select an image file to upload.";
        //    }
        //}



    }
}