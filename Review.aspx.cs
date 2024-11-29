using System;
using System.Web.UI;

namespace web3
{
    public partial class Review : Page
    {
        double total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load user information from session
                LoadUserInformation();
            }

            // Ensure UserId is in session for the Payment page
            if (Session["UserId"] == null)
            {
                // Redirect to login if UserId is not available in session
                Response.Redirect("Login.aspx");
            }

        }

        public void LoadUserInformation()
        {
            imgCake.ImageUrl = Session["CakeImage"]?.ToString();
            lblCakeName.Text = Session["CakeName"]?.ToString();

            // Retrieve and display the price
            double cakePrice = Convert.ToDouble(Session["Price"]);
            System.Diagnostics.Debug.WriteLine("Cake Price on Review Page: " + cakePrice);
            double quantityString = Convert.ToDouble(Session["Quantity"]);
            total = cakePrice * quantityString;
            string totalstring = total.ToString();
            if (!string.IsNullOrEmpty(totalstring))
            {
                lblPrice.Text = $"{totalstring}";
            }
            else
            {
                lblPrice.Text = "Price not available"; // Fallback text
            }

            txtFullName.Text = Session["FullName"]?.ToString();
            txtAddress.Text = Session["Address"]?.ToString();
            txtPhone.Text = Session["Phone"]?.ToString();
            txtEmail.Text = Session["Email"]?.ToString();
            txtQuantity.Text = Session["Quantity"]?.ToString();


        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            // Enable editing
            txtFullName.ReadOnly = false;
            txtAddress.ReadOnly = false;
            txtPhone.ReadOnly = false;
            txtEmail.ReadOnly = false;
            txtQuantity.ReadOnly = false;

            // Toggle button visibility
            btnChange.Visible = false;
            btnContinue.Visible = false;
            btnOk.Visible = true;
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            // Save updated information in session
            Session["FullName"] = txtFullName.Text;
            Session["Address"] = txtAddress.Text;
            Session["Phone"] = txtPhone.Text;
            Session["Email"] = txtEmail.Text;
            Session["Quantity"] = txtQuantity.Text;

            // Optionally update the database here if required

            // Reload page to display updated information in read-only mode
            Response.Redirect("Review.aspx");
        }

        public void btnContinue_Click(object sender, EventArgs e)
        {
           
            string cakePrice = lblPrice.Text;
            int userId = Convert.ToInt32(Session["UserId"]);

            Session["Quantity"] = txtQuantity.Text;
            Session["CakeName"] = lblCakeName.Text;
            Session["CakeImage"] = imgCake.ImageUrl;
            Session["Price"] = cakePrice;

            Session["UserId"] = userId;
            if (Session["UserId"] == null)
            {
                lblCakeName.Text += " User not logged in.";
                Response.Redirect("Login.aspx"); // Redirect to login page
                return;
            }

            // Redirect to Payment page
            Response.Redirect("Payment.aspx");

        }
    }
}

