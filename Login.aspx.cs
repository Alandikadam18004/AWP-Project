using System;
using System.Data.SqlClient;
using System.Web;

namespace web3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cakeId = Request.QueryString["CakeId"];
                if (!string.IsNullOrEmpty(cakeId))
                {
                    lnkRegister.NavigateUrl = $"Register.aspx?CakeId={cakeId}";
                }
                else
                {
                    lnkRegister.NavigateUrl = "Register.aspx";
                }
            }
            lblError.Visible = false; // Reset error message visibility
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Perform user authentication (you need to implement this method based on your database)
            int userId = AuthenticateUserAndRetrieveUserId(username, password);

            if (userId > 0)
            {
                // Store UserId in session if authentication is successful
                Session["UserId"] = userId;
                Session["IsLoggedIn"] = true;

                // Check if CakeId is present in the query string
                if (Request.QueryString["CakeId"] != null && Session["UserId"] != null)
                {
                    // If CakeId is present, get it and redirect to BuyNow.aspx
                    int cakeId = Convert.ToInt32(Request.QueryString["CakeId"]);

                    // Redirect to BuyNow.aspx with both CakeId and UserId as query parameters
                    Response.Redirect($"BuyNow.aspx?CakeId={cakeId}&UserId={userId}");
                }
                else
                {
                    // If no CakeId is present, redirect to BuyNow.aspx
                    Response.Redirect("BuyNow.aspx");
                }
            }
            else
            {
                // If login fails, show error message
                lblError.Visible = true;
                lblError.Text = "Invalid Password And Username! please Try again";
            }
        }


        public int AuthenticateUserAndRetrieveUserId(string username, string password)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;
            string query = "SELECT UserId FROM Users WHERE UserName = @UserName AND Password = @Password";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                object result = cmd.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0; // Return UserId if found, otherwise 0
            }
        }
    }
}
