using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TestNewWeb1
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
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
            }
        }


        private void LoadUserData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectAllCondition("users", $"id <> {TokenManager.GetUserIdFromSession(Session)}");

            // Dynamically populate the table rows
            string tableRows = "";
            foreach (DataRow row in dt.Rows)
            {
                string id = row["id"].ToString();
                string name = row["name"].ToString();
                string email = row["email"].ToString();
                string progress = GetProgressBar();

                //tableRows += $@"
                //        <tr>
                //            <td class='py-1'>
                //                <img src='' alt='image' />
                //            </td>
                //            <td>{name}</td>
                //            <td>{email}</td>
                //            <td>{progress}</td>
                //            <td>$100.00</td>
                //            <td>May 15, 2025</td>
                //        </tr>";
                tableRows += $@"
                        <tr>
                            <td>{id}</td>
                            <td>{name}</td>
                            <td>{email}</td>
                            <td>{progress}</td>
                            <td>$100.00</td>
                            <td>May 15, 2025</td>
                        </tr>";
            }

            // Inject rows into the table body
            userTableBody.InnerHtml = tableRows;
        }
        private string GetProgressBar()
        {
            return @"
                <div class='progress'>
                    <div class='progress-bar bg-success' role='progressbar'
                         style='width: 25%' aria-valuenow='25'
                         aria-valuemin='0' aria-valuemax='100'>
                    </div>
                </div>";
        }

        private void LoadProductsData()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectAll("products");

            string tableRows = "";
            foreach (DataRow row in dt.Rows)
            {
                string id = row["product_id"].ToString(),
                    title = row["product_name"].ToString(),
                    desc1 = row["short_description"].ToString(),
                    desc2 = row["long_description"].ToString(),
                    price = row["price"].ToString(),
                    rate= row["rate"].ToString(),
                    img1 = row["image_url_thumbnail"].ToString(),
                    img2 = row["image_url_full"].ToString(),
                    no = row["number_of_orders"].ToString();


                tableRows += $@"
                        <tr>
                            <td>{id}</td>
                            <td>{title}</td>
                            <td>{desc1}</td>
                            <td>{desc2}</td>
                            <td>${price}</td>
                            <td>{no}</td>
                            <td class='py-1'>
                                <img src='/AllUploadedImages/{img1}' alt='product image' />
                            </td>
                            <td class='py-1'>
                                <img src='/AllUploadedImages/{img2}' alt='other side image' />
                            </td>
                            <td>{rate}</td>
                        </tr>";
            }

            productsTableBody.InnerHtml = tableRows;
        }


        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
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
                {"image_url_full", fileNameImg2}
            });
            ClearAllFields();
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