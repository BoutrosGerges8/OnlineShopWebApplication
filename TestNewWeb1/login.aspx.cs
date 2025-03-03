using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

using static TestNewWeb1.SqlConnectionClass;

namespace TestNewWeb1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TokenManager.IsLoggedInAlready(Session))
            {
                if (TokenManager.IsUserAdmin(Session))
                {
                    Response.Redirect("/AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect($"/index.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string EmailStr = email.Value.Trim(),
                PasswordStr = password.Value.Trim();


            // send verification email
            EmailSender emailSender = new EmailSender("smtp.gmail.com", 587, "your-email@example.com", "your-email-password");
            bool isSent = emailSender.SendEmail(EmailStr, "Verification", "103");




            SqlConnectionClass sql = new SqlConnectionClass();
            bool exsits = sql.RowDataAllExists("users", new Dictionary<string, object>
            {
                {"email", EmailStr },
                {"password", PasswordStr},
            });

            if (exsits)
            {
                // Make sure the data object is not null
                DataTable data = sql.SelectColumnsCondition("users", new string[]
                {
                    "id", "isAdmin"
                }, $"email='{EmailStr}' AND password = '{PasswordStr}'");

                if (data != null && data.Rows.Count > 0)
                {
                    DataRow firstRow = data.Rows[0];

                    TokenManager.AddCredentialsToSession(Session, EmailStr, PasswordStr,
                        int.Parse(firstRow["id"].ToString()),
                        firstRow["isAdmin"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase));

                    if (firstRow["isAdmin"].ToString() == "True")
                    {
                        Response.Redirect("/AdminDashboard.aspx");
                    }
                    else
                    {

                        // Retrieve the last page URL from the session
                        string lastPageUrl = TokenManager.GetLastPageUrl(Session);

                        // If no last page URL is found, redirect to a default page (e.g., Home.aspx)
                        if (string.IsNullOrEmpty(lastPageUrl))
                        {
                            lastPageUrl = firstRow["isAdmin"].ToString() == "True" ? "/AdminDashboard.aspx" : "/index.aspx";
                        }



                        Response.Redirect(lastPageUrl);
                        //Response.Redirect($"/index.aspx");
                    }
                }
                else
                {
                    // If no rows are returned, redirect with an error message
                    Response.Redirect("/login.aspx?Error=WrongEmailPassword-1");
                }


            }
            else
            {
                Response.Redirect("/login.aspx?Error=WrongEmailPassword");
            }

        }
    }
}