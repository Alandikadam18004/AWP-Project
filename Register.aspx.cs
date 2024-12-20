﻿using System;
using System.Data.SqlClient;
using System.Configuration;

namespace web3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CakeId"] != null)
            {
                int cakeId = Convert.ToInt32(Session["CakeId"]);
                lblError.Text = "You are registering for Cake ID: " + cakeId.ToString();
            }
            lblError.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            int cakeId = Convert.ToInt32(Session["CakeId"]); 
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "All fields are required.";
                lblError.Visible = true;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
               string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Username", username);
                checkCmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    conn.Open();
                    int userCount = (int)checkCmd.ExecuteScalar();

                    if (userCount > 0)
                    {
                        lblError.Text = "This user already exists. Please login.";
                        lblError.Visible = true;
                    }
                    else
                    {
                        string query = "INSERT INTO Users (Username, Email, Password) OUTPUT INSERTED.UserId VALUES (@Username, @Email, @Password)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        int userId = (int)cmd.ExecuteScalar();  Session["UserId"] = userId;
                        Response.Redirect("Login.aspx?CakeId=" + cakeId);
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An error occurred: " + ex.Message;
                    lblError.Visible = true;
                }
            }
        }
    }
}
