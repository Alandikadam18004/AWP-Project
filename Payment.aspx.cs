using System;
using System.Diagnostics;
using System.Web;

namespace web3
{
    public partial class Payment : System.Web.UI.Page
    {
        double total;
        string Total;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderDetails();
            }
        }

        public void LoadOrderDetails()
        {

            try
            {
                
                string cakeName = Session["CakeName"]?.ToString();
                double priceString = Convert.ToDouble(Session["Price"]);
                string quantityString = Session["Quantity"]?.ToString();

                Debug.WriteLine("Cake Name: " + cakeName);
                Debug.WriteLine("Price from Session: " + priceString);
                Debug.WriteLine("Quantity from Session: " + quantityString);

                total = (priceString - (priceString * 0.10)) + 50; 
                Total = total.ToString(); 
                lblOriginalPrice.Text = priceString.ToString();
                lblCakeName.Text = cakeName;
                lblQuantity.Text = quantityString;
                lblTotal.Text = Total;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while loading order details: " + ex.Message;
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                SaveOrderDetails();
                SaveOrderTable();
                btnProducts.Visible = !btnProducts.Visible;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while placing the order: " + ex.Message;
            }
        }

        public void SaveOrderDetails()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                string fullName = Session["FullName"]?.ToString();
                string address = Session["Address"]?.ToString();
                string phone = Session["Phone"]?.ToString();
                string email = Session["Email"]?.ToString();
                string cakeName = Session["CakeName"]?.ToString();
                string Price = Session["Price"]?.ToString();
                string Quantity = Session["Quantity"]?.ToString();

                Total = total.ToString();

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CakeShopDB"].ToString();
                string query = @"INSERT INTO UserInformation (UserId, FullName, Address, Phone, Email, CakeName, Price, Quantity, Total)
                                 VALUES (@UserId, @FullName, @Address, @Phone, @Email, @CakeName, @Price, @Quantity, @Total)";

                using (var conn = new System.Data.SqlClient.SqlConnection(connectionString))
                {
                    using (var cmd = new System.Data.SqlClient.SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@FullName", fullName ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Address", address ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Phone", phone ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Email", email ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@CakeName", cakeName ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Price", Price ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Quantity", Quantity ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Total", lblTotal.Text);

                       conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblErrorMessage.Text = "Order Confirmed! Thank you for shopping with us!";
                        }
                        else
                        {
                            lblErrorMessage.Text = "Failed to insert order into the database.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while saving order details: " + ex.Message;
            }
        }

        public void SaveOrderTable()
        {
            try
            {
                string userName = Session["FullName"]?.ToString();
                string cakeName = Session["CakeName"]?.ToString();
                string Quantity = Session["Quantity"]?.ToString();
                string cakeImage = Session["CakeImage"]?.ToString();
                int userId = Convert.ToInt32(Session["UserId"]);


                Total = total.ToString();

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CakeShopDB"].ToString();
                string query = @"INSERT INTO Orders (UserID, UserName, CakeImage, CakeName, Quantity, Total)
                                 VALUES (@UserID, @UserName, @CakeImage, @CakeName, @Quantity, @Total)";

                using (var conn = new System.Data.SqlClient.SqlConnection(connectionString))
                {
                    using (var cmd = new System.Data.SqlClient.SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.Parameters.AddWithValue("@UserName", userName ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@CakeName", cakeName ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@CakeImage", cakeImage ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Quantity", Quantity ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@Total", lblTotal.Text);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while saving order table: " + ex.Message;
            }
        }

        protected void btnProducts_Click(object sender, EventArgs e)
        {
            Session["Total"] = Total;
            Response.Redirect("Products.aspx");
        }
    }
}
