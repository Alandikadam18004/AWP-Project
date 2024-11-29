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
    public partial class AdminProductManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCakes();
            }
        }

        // Load the cakes into the GridView
        private void LoadCakes()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT CakeID, CakeName, Price FROM Cakes";
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCakes.DataSource = dt;
                gvCakes.DataBind();
            }
        }

        // Handle adding a new cake
        protected void btnAddCake_Click(object sender, EventArgs e)
        {
            string cakeName = txtCakeName.Text;
            decimal price = decimal.Parse(txtPrice.Text);

            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "INSERT INTO Cakes (CakeName, Price) VALUES (@CakeName, @Price)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CakeName", cakeName);
                cmd.Parameters.AddWithValue("@Price", price);

                cmd.ExecuteNonQuery();
            }

            // Reload the grid to show the new cake
            LoadCakes();

            // Clear the input fields
            txtCakeName.Text = string.Empty;
            txtPrice.Text = string.Empty;
        }

        // Handle editing or deleting cakes
        protected void gvCakes_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvCakes.Rows[index];
            int cakeID = Convert.ToInt32(row.Cells[0].Text);

            if (e.CommandName == "Edit")
            {
                // Redirect to a page to edit the cake (Optional: you can create an edit page)
                Response.Redirect("EditCake.aspx?CakeID=" + cakeID);
            }
            else if (e.CommandName == "Delete")
            {
                DeleteCake(cakeID);
            }
        }

        // Delete the selected cake
        private void DeleteCake(int cakeID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM Cakes WHERE CakeID = @CakeID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CakeID", cakeID);

                cmd.ExecuteNonQuery();
            }

            // Reload the grid after deletion
            LoadCakes();
        }
    }
}