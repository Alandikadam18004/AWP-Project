﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web3
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductData();
            }
        }
        private void BindProductData()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CakeShopDB"].ConnectionString;
            string query = "SELECT CakeID, CakeName, Price, ImagePath FROM Cakes";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    rptProducts.DataSource = reader;
                    rptProducts.DataBind();
                }
            }
        }
        
        protected void btnBuyNow_Command(object sender, CommandEventArgs e)
        {
            
                try
                {
                    
                    int cakeId = Convert.ToInt32(e.CommandArgument);

                   
                    if (Session["UserId"] != null && Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] == true)
                    {
                        int userId = Convert.ToInt32(Session["UserId"]); 
                                                                       
                        Response.Redirect($"BuyNow.aspx?CakeId={cakeId}&UserId={userId}");
                    }
                    else
                    {
                      
                        Session["CakeId"] = cakeId;

                       
                        Response.Redirect($"Login.aspx?CakeId={cakeId}");
                    }
                }
                catch (Exception ex)
                {
                    
                    lbl.Text = "An error occurred: " + ex.Message;
                    lbl.Visible = true;
                }
            

        }

    }
}
