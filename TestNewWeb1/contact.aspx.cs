using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace TestNewWeb1
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        [WebMethod]
        public static Dictionary<string, string> SubmitContactForm(string name, string email, string message, string country, string city, string region, string timezone)
        {

            try
            {
                SqlConnectionClass sql = new SqlConnectionClass();
                sql.InsertData("ContactMessages", new Dictionary<string, object> {
                    {"name", name },
                    {"email", email},
                    {"message", message},
                    {"country", country},
                    {"city", city},
                    {"region", region},
                    {"timezone", timezone}
                });

                return new Dictionary<string, string>
                {
                    { "status", "success" },
                    { "message", "Message sent successfully!" }
                };
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error in SubmitContactForm: " + ex.Message);
                throw;
            }
        }


    }
}