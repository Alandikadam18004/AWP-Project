<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="web3.Products" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sweet Bliss Cakes!</title>
        <link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon">
    <style>
        /* General styling */
        body {
            font-family: Comic Sans MS;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Navigation bar */
        .navbar {
            background-color: #e5416a;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            height: 63px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: large;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #090106;
        }

        /* Page title */
        h2 {
            text-align: center;
            margin: 30px 0;
        }

        /* Product card layout */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            background-color: #fff;
            padding: 15px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px #e5416a;
        }
        .product-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 8px;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-price {
            font-size: 16px;
            color: #1b0212;
            margin-bottom: 15px;
        }
        .add-to-cart-button {
            padding: 10px 20px;
            border: none;
            background-color: #e5416a;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s ease;
            margin: 5px;
        }
        .add-to-cart-button:hover {
            background-color: #82112d;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 10px;
            background-color: #e5416a;
            color: white;
            margin-top: 20px;
        }
        .logo {
            width: 54px;
            height: 49px;
             border-radius: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation bar -->
        <div class="navbar">
            <div><img src="/images/cake logo.jpeg" class="logo"><strong style="font-size: xx-large; font-family: 'Comic Sans MS';">&nbsp; Sweet Bliss Cakes!</strong></div>
            <div>
                <a href="Products.aspx">Home</a>
                <a href="About.aspx">About</a>
                <a href="Contact.aspx">Contact</a>
               <a href="ViewOrders.aspx">View Orders</a>
                 
            </div>
        </div>

        <!-- Page title -->
        <h2 style="color: #e5416a;" >Our Products</h2>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label style="color: #e5416a; font-size: large;" ID="lbl" runat="server" Text="" ></asp:Label>

        <!-- Product cards -->
        <div class="product-container">
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <img src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' alt='<%# Eval("CakeName") %>' class="product-image" />
                        <div class="product-name"><%# Eval("CakeName") %></div>
                        <div class="product-price">Price: ₹<%# Eval("Price", "{0:F2}") %></div>
                        <asp:Button ID="btnBuyNow" runat="server" 
                                    CommandArgument='<%# Eval("CakeId") %>' 
                                    Text="Buy Now" 
                                    OnCommand="btnBuyNow_Command" 
                                    CssClass="add-to-cart-button" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        &nbsp;&nbsp;
        </div>

        <!-- View Cart link -->
        <!--<div><a href="Cart.aspx">View Cart</a></div>
        <!-- Footer -->n 
        <footer>
            &copy; 2024 My Cake Shop. All Rights Reserved.
        </footer>
    </form>
</body>
</html>          