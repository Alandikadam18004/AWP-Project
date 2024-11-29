using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace web3
{
    public partial class BuyNow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if CakeId is passed from the previous page
            if (!IsPostBack)
            {
                if (Request.QueryString["CakeId"] != null)
                {
                    int cakeId = Convert.ToInt32(Request.QueryString["CakeId"]);
                    LoadCakeDetails(cakeId);
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("BuyNow Page - CakeId not found.");
                }
            }
        }

        private void LoadCakeDetails(int cakeId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;
            string query = "SELECT CakeName, ImagePath, Price FROM Cakes WHERE CakeId = @CakeId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CakeId", cakeId);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    lblCakeName.Text = reader["CakeName"].ToString();
                    lblPrice.Text = reader["Price"].ToString();
                    imgCake.ImageUrl = reader["ImagePath"].ToString(); // Assuming the image URL is stored
                }
                else
                {
                    lblCakeName.Text = "No cake details found.";
                }
                reader.Close();
            }
        }

        protected void btnProceedToPayment_Click(object sender, EventArgs e)
        {
            // Collect user information
            string fullName = txtFullName.Text;
            string address = txtAddress.Text;
            string phone = txtPhone.Text;
            string email = txtEmail.Text;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            string cakeName = lblCakeName.Text;
            string cakePrice = lblPrice.Text;
            int userId = Convert.ToInt32(Session["UserId"]);

            // Store the user information in the session
            Session["FullName"] = fullName;
            Session["Address"] = address;
            Session["Phone"] = phone;
            Session["Email"] = email;
            Session["Quantity"] = quantity;
            Session["CakeName"] = cakeName;
            Session["CakeImage"] = imgCake.ImageUrl;
            Session["Price"] = cakePrice;
            Session["UserId"] = userId;
            // Check if user is logged in, redirect if not
            if (Session["UserId"] == null)
            {
                lblCakeName.Text += " User not logged in.";
                Response.Redirect("Login.aspx"); // Redirect to login page
                return;
            }

            // Redirect to Review page
            Response.Redirect("Review.aspx");
        }
    }
}
