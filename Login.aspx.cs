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
            lblError.Visible = false; 
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();

           int userId = AuthenticateUserAndRetrieveUserId(username, password);

            if (userId > 0)
            {
                Session["UserId"] = userId;
                Session["IsLoggedIn"] = true;

                 if (Request.QueryString["CakeId"] != null && Session["UserId"] != null)
                {
                    
                    int cakeId = Convert.ToInt32(Request.QueryString["CakeId"]);

                     Response.Redirect($"BuyNow.aspx?CakeId={cakeId}&UserId={userId}");
                }
                else
                {
                    Response.Redirect("BuyNow.aspx");
                }
            }
            else
            {
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
                return result != null ? Convert.ToInt32(result) : 0;
        }
    }
}
