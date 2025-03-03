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
    public partial class BestSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TokenManager.IsLoggedInAlready(Session))
            {
                if (!TokenManager.IsUserAdmin(Session))
                {
                    TokenManager.SetLastPageUrl(Session, "/BestSales.aspx");
                    Response.Redirect($"/login.aspx");
                }
            }
            else
            {
                Response.Redirect($"/login.aspx");
            }

            if (!IsPostBack)
            {
                BindData();


                //var orderData = GetOrderData();
                //string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(orderData);
                //// Pass the JSON data to JavaScript
                //ClientScript.RegisterStartupScript(this.GetType(), "loadData", $"loadChartData({jsonData});", true);


                //// Fetch order data dynamically
                //var orderData = GetOrderData();
                //string jsData = GenerateChartScript(orderData);

                //// Inject JavaScript at the end of <body>
                //ClientScript.RegisterStartupScript(this.GetType(), "chartScript", jsData, false);

                

            }


            // Inject JavaScript into the page
            //ClientScript.RegisterStartupScript(this.GetType(), "loadChart", jsData, true);
        }

        private void BindData()
        {

            using (SqlConnection conn = new SqlConnection(@"Server=desktop-hr293u3;Database=OnlineShopWebApplication;Integrated Security=True;"))
            {
                string query = @"
                    SELECT 
                        p.product_name, 
                        u.name AS user_name,
                        SUM(o.quantity) AS total_quantity,
                        (SUM(o.quantity) * 100.0 / NULLIF((SELECT SUM(quantity) FROM ordered), 0)) AS sale_percentage,
                        o.status
                    FROM ordered o
                    JOIN users u ON o.user_id = u.id
                    JOIN products p ON o.product_id = p.product_id
                    GROUP BY p.product_name, u.name, o.status
                    ORDER BY sale_percentage DESC;
                ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Generate HTML rows dynamically
                    string htmlRows = "";
                    foreach (DataRow row in dt.Rows)
                    {
                        string salePercentage = Convert.ToDouble(row["sale_percentage"]).ToString("N2") + "%";
                        string textColor = GetTextColor(row["sale_percentage"]);
                        string arrowIcon = GetArrowIcon(row["sale_percentage"]);
                        string statusBadge = GetStatusBadge(row["status"]);

                        htmlRows += $@"
                            <tr>
                                <td>{row["user_name"]}</td>
                                <td>{row["product_name"]}</td>
                                <td><span class='{textColor}'>{salePercentage} <i class='{arrowIcon}'></i></span></td>
                                <td><label class='{statusBadge}'>{row["status"]}</label></td>
                            </tr>";
                    }

                    // Inject HTML into tableBody
                    tableBody.InnerHtml = htmlRows;
                }
            }
        }
        protected string GetTextColor(object sale)
        {
            double value = Convert.ToDouble(sale);
            return value < 50 ? "text-danger" : "text-success";
        }
        protected string GetArrowIcon(object sale)
        {
            double value = Convert.ToDouble(sale);
            return value < 50 ? "ti-arrow-down" : "ti-arrow-up";
        }
        protected string GetStatusBadge(object status)
        {
            switch (status.ToString())
            {
                case "Pending": return "badge badge-danger";    // For Pending status
                case "Shipped": return "badge badge-warning";   // For Shipped status
                case "Delivered": return "badge badge-success"; // For Delivered status
                default: return "badge badge-secondary";        // Default for any other status
            }
        }




        //private string GenerateChartScript(List<ChartData> data)
        //{
        //    // Convert database data into JavaScript arrays
        //    string labels = string.Join(",", data.Select(d => $"'{d.DayOfWeek}'"));
        //    string values = string.Join(",", data.Select(d => d.TotalOrders));

        //    return $@"
        //<script>
        //    document.addEventListener(""DOMContentLoaded"", function () {{
        //        let ctx = document.getElementById(""myChart"").getContext(""2d"");
        //        let myChart = new Chart(ctx, {{
        //            type: ""line"",
        //            data: {{
        //                labels: [{labels}],
        //                datasets: [{{
        //                    label: ""Total Orders"",
        //                    data: [{values}],
        //                    backgroundColor: ""rgba(153,205,1,0.6)"",
        //                    borderColor: ""rgba(153,205,1,1)"",
        //                    borderWidth: 2,
        //                    fill: false
        //                }}]
        //            }},
        //            options: {{
        //                responsive: true,
        //                scales: {{
        //                    y: {{
        //                        beginAtZero: true
        //                    }}
        //                }}
        //            }}
        //        }});
        //    }});
        //</script>";
        //}

        //private string GenerateChartScript(List<ChartData> data)
        //{
        //    // Prepare labels (days of the week)
        //    string labels = string.Join(",", data.Select(d => $"'{d.DayOfWeek}'"));

        //    // Prepare values (order counts)
        //    string values = string.Join(",", data.Select(d => d.TotalOrders));

        //    // Create the full script
        //    return $@"
        //<script src='https://cdn.jsdelivr.net/npm/chart.js'></script>
        //<script>
        //    let ctx = document.getElementById('myChart').getContext('2d');
        //    let myChart = new Chart(ctx, {{
        //        type: 'line',
        //        data: {{
        //        labels: [
        //            ""Monday"",
        //            ""Tuesday"",
        //            ""Wednesday"",
        //            ""Thursday"",
        //            ""Friday"",
        //            ""Saturday"",
        //            ""Sunday"",
        //        ],
        //            datasets: [{{
        //                label: 'Total Orders',
        //                data: [2, 9, 3, 17, 6, 3, 7],
        //                backgroundColor: 'rgba(153,205,1,0.6)',
        //                borderColor: 'rgba(153,205,1,1)',
        //                borderWidth: 2,
        //                fill: false
        //            }}]
        //        }},
        //        options: {{
        //            responsive: true,
        //            scales: {{
        //                y: {{
        //                    beginAtZero: true
        //                }}
        //            }}
        //        }}
        //    }});
        //</script>";
        //}



        private List<ChartData> GetOrderData()
        {
            List<ChartData> data = new List<ChartData>();
            //string query = @"
            //SELECT 
            //    DATENAME(WEEKDAY, purchase_date) AS DayOfWeek,
            //    SUM(quantity) AS TotalOrders
            //FROM purchases
            //GROUP BY DATENAME(WEEKDAY, purchase_date)
            //ORDER BY 
            //    CASE DATENAME(WEEKDAY, purchase_date)
            //        WHEN 'Monday' THEN 1
            //        WHEN 'Tuesday' THEN 2
            //        WHEN 'Wednesday' THEN 3
            //        WHEN 'Thursday' THEN 4
            //        WHEN 'Friday' THEN 5
            //        WHEN 'Saturday' THEN 6
            //        WHEN 'Sunday' THEN 7
            //        ELSE 8
            //    END;
            //";
            string query = @"
            SELECT DATENAME(WEEKDAY, order_date) AS DayOfWeek, SUM(quantity) AS TotalOrders
            FROM ordered
            GROUP BY DATENAME(WEEKDAY, order_date)
            ORDER BY 
                CASE DATENAME(WEEKDAY, order_date)
                    WHEN 'Monday' THEN 1
                    WHEN 'Tuesday' THEN 2
                    WHEN 'Wednesday' THEN 3
                    WHEN 'Thursday' THEN 4
                    WHEN 'Friday' THEN 5
                    WHEN 'Saturday' THEN 6
                    WHEN 'Sunday' THEN 7
                    ELSE 8
                END;

            ";

            try
            {
                using (SqlConnection conn = new SqlConnection(@"Server=desktop-hr293u3;Database=OnlineShopWebApplication;Integrated Security=True;"))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        data.Add(new ChartData
                        {
                            DayOfWeek = reader["DayOfWeek"].ToString(),
                            TotalOrders = Convert.ToInt32(reader["TotalOrders"])
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }

            return data;
        }

    }
}



public class ChartData
{
    public string DayOfWeek { get; set; }
    public int TotalOrders { get; set; }
}