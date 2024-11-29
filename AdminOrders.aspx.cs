using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web3
{
    public partial class AdminOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT OrderID, UserName, OrderDate, Total, OrderStatus FROM Orders";
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        protected void gvOrders_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Redirect to Order Summary page with OrderID
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvOrders.Rows[index];
                int orderID = Convert.ToInt32(row.Cells[0].Text);
                Response.Redirect("OrderSummary.aspx?OrderID=" + orderID);
            }
            else if (e.CommandName == "UpdateStatus")
            {
                // Update the order status
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvOrders.Rows[index];
                int orderID = Convert.ToInt32(row.Cells[0].Text);

                // Example: Update the status to "Shipped"
                string newStatus = "Shipped"; // You can customize the status as needed
                UpdateOrderStatus(orderID, newStatus);
            }
        }

        private void UpdateOrderStatus(int orderID, string newStatus)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "UPDATE Orders SET OrderStatus = @OrderStatus WHERE OrderID = @OrderID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderStatus", newStatus);
                cmd.Parameters.AddWithValue("@OrderID", orderID);

                cmd.ExecuteNonQuery();

                // Refresh the order list after updating
                LoadOrders();
            }
        }
    }
}