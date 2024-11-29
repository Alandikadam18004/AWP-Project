<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="web3.Payment" %>

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
            background-color: #f79ed6;
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

        /* Header */
        .header {
            background-color: #e5416a;
            padding: 20px;
            text-align: center;
            color: white;
        }

        .header h1 {
            margin: 0;
            font-size: xx-large;
        }

        /* Payment Section */
        .payment-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .payment-container h2 {
            color: #333;
        }
         .content {
     padding: 20px;
     font-size: 18px;
     background-color: #fff;
     border-radius: 8px;
     margin: 20px;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 }

        .payment-container p {
            margin: 15px 0;
        }

        .payment-container label {
        }

        .payment-container .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .payment-container .button-group input {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px 20px;
            font-size: large;
            cursor: pointer;
            border-radius: 4px;
            background-color: #e5416a;
            color: white;
            transition: background-color 0.3s ease;
        }

        .payment-container .button-group input:hover {
            background-color: #82112d;
        }

        .thank-you-message {
            display: none;
            font-size: 20px;
            color: #28a745;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <h1>Payment Details</h1>
        </div>

        <br />

        <!-- Payment Section -->
        <div class="payment-container">
            <h2  style="color: #e5416a;">Your Payment Summary</h2>
            <p>
                <label>Cake Name:</label>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblCakeName" runat="server"></asp:Label>
            </p>
            <p>
                <label>Order Quantity:</label>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblQuantity" runat="server"></asp:Label>
            </p>
            <p>
                <label>Total Order Price:&nbsp;&nbsp; +₹</label><asp:Label ID="lblOriginalPrice" runat="server"></asp:Label>
            </p>
             <p>
                    <label>Total Discount:&nbsp;&nbsp; -₹35</label><asp:Label ID="Label1" runat="server"></asp:Label>
             </p>
             <p>
                     <label>Shipping Price:&nbsp;&nbsp; +₹50</label><asp:Label ID="Label2" runat="server"></asp:Label>
            </p>
           
           
            <p><label>Order Total :&nbsp;&nbsp; ₹</label><asp:Label ID="lblTotal" runat="server"></asp:Label>
            </p>

            <p>
                <label>Payment Method:</label>&nbsp;&nbsp;&nbsp;&nbsp; Only Cash on Delivery Available !
            
            
            
            <p>
                &nbsp;</p>

            <!-- Button Group -->
            <div class="button-group">
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" Visible="True" Height="40px" Width="148px" />
                <br />
            </div>
                         <p>
<asp:Label ID="lblErrorMessage" runat="server" 
           Text="" 
           Style="color: #82112d; font-size: x-large; font-weight: 700;">
</asp:Label>
            
            </p>
            <div class="button-group">
    <asp:Button ID="btnProducts" runat="server" Text="Continue Shopping" OnClick="btnProducts_Click"  Visible="false"  Height="40px" Width="192px" />
    <br />
</div>
        </div>

        <!-- Thank You Message -->
        
    </form>
</body>
</html> 
