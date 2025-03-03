using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TokenManager.IsLoggedInAlready(Session))
            {
                if (!TokenManager.IsUserAdmin(Session))
                {
                    TokenManager.SetLastPageUrl(Session, "/Messages.aspx");
                    Response.Redirect($"/index.aspx");
                }
            }
            else
            {
                Response.Redirect($"/login.aspx");
            }
            if (!IsPostBack)
            {
                LoadAllMessages();
            }
        }

        private void LoadAllMessages()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectAll("ContactMessages", orderBy: "submitted_at", sortDirection:"DESC");

            foreach (DataRow row in dt.Rows)
            {
                string fullMessage = row["message"].ToString().Replace("\"", "&quot;");
                tableBodyMessages.InnerHtml += $@"
                    <tr id='{row["id"]}'>
                        <td>{row["name"]}</td>
                        <td>{row["email"]}</td>
                        <td class='read-more' title='Click to read the entire message'>
                            {row["message"]}
                        </td>
                        <td>{row["country"]}</td>
                        <td>{row["city"]}</td>
                        <td>{row["region"]}</td>
                        <td>{row["timezone"]}</td>
                        <td class='wholeText'>{row["submitted_at"]}</td>
                    </tr>";
            }
        }

        //private void LoadAllMessages()
        //{
        //    SqlConnectionClass sql = new SqlConnectionClass();
        //    DataTable dt = sql.SelectAll("ContactMessages");

        //    foreach (DataRow row in dt.Rows)
        //    {
        //        tableBodyMessages.InnerHtml += $@"
        //                    <tr>
        //                        <td>{row["name"]}</td>
        //                        <td>{row["email"]}</td>
        //                         <td>
        //                           <span class='short-message'>{row["message"]}</span>
        //                           <span class='full-message'>{row["message"]}</span>
        //                           <button class='read-more' onclick='showFullMessage(this)'>Read More</button>
        //                        </td>
        //                        <td>{row["country"]}</td>
        //                        <td>{row["city"]}</td>
        //                        <td>{row["region"]}</td>
        //                        <td>{row["timezone"]}</td>
        //                        <td class=""wholeText"">{row["submitted_at"]}</td>
        //                    </tr>";
        //    }
        //}


    }
}