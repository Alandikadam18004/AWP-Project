using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace web3
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["UserID"]);
            string cakeName = txtCakeName.Text.Trim();
            decimal total = Convert.ToDecimal(txtTotal.Text.Trim());
            int quantity = Convert.ToInt32(txtQuantity.Text.Trim());
            string imagePath = "~/Images/" + FileUpload1.FileName;

            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath(imagePath));
            }

            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Orders (UserID, CakeName, Total, Quantity, CakeImage, OrderDate) VALUES (@UserID, @CakeName, @Total, @Quantity, @CakeImage, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@CakeName", cakeName);
                cmd.Parameters.AddWithValue("@Total", total);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@CakeImage", imagePath);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Order placed successfully!";
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
