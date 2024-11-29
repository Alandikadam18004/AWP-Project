using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace web3
{
    public partial class ViewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                BindOrderData();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex; // Set the new page index
            BindOrderData(); // Rebind the data to the GridView with the updated page index
        }
        private void BindOrderData()
        {
            int userID = Convert.ToInt32(Session["UserID"]); // Current logged-in user ID
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ToString();

            // Fetch orders for the logged-in user based on the correct column names
            string query = @"
                SELECT 
                    O.OrderID, 
                    O.Total, 
                    O.CakeName, 
                    O.CakeImage, 
                    O.Quantity
                FROM 
                    Orders O
                INNER JOIN 
                    Users U ON O.UserID = U.UserId
                WHERE 
                    U.UserId = @UserID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        Debug.WriteLine("OrderID: " + row["OrderID"].ToString() + " Total: " + row["Total"].ToString());
                    }
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.EmptyDataText = "No orders found for the current user.";
                    GridView1.DataBind();
                }
            }
        }
    }
}
