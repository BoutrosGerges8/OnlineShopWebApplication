using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestNewWeb1.Components
{
    public partial class AdminHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                LoadTop3Messages();
            }
        }


        private void LoadTop3Messages()
        {
            SqlConnectionClass sql = new SqlConnectionClass();
            DataTable dt = sql.SelectTopNTable("ContactMessages", 3, orderBy:"submitted_at", "DESC");

            int i = 4;
            foreach (DataRow dr in dt.Rows)
            {
                MessagesDropDown.InnerHtml += $@"
                    <a class=""dropdown-item"" href=""/Messages.aspx?id={dr["id"]}"">
                        <div class=""item-thumbnail"">
                            <img src=""{faceUrl(i++)}"" alt=""image"" class=""profile-pic"">
                        </div>
                        <div class=""item-content flex-grow"">
                            <h6 class=""ellipsis font-weight-normal"">{dr["name"].ToString()}
                            </h6>
                            <p class=""font-weight-light small-text text-muted mb-0"">
                                {shortMessage(dr["message"].ToString())}
                            </p>
                        </div>
                    </a>
                ";
            }
        }

        private string faceUrl(int i)
        {
            return $"/assets/images/faces/face{i}.jpg";
        }

        private string shortMessage(string message)
        {
            if (message != null) {
                if(message.Length > 24)
                {
                    return message.Substring(0, 24) + "...";
                }
            }
            return message;
        }

    }
}