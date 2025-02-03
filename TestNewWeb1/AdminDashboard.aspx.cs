using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


        protected void AddNewProduct(object sender, EventArgs e)
        {
            // Your code for handling the button click
        }

    }
}