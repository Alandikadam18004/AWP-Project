<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="web3.Review" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Sweet Bliss Cakes!</title>
    <link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon">
    <style>
       
        body {
            font-family: Comic Sans MS;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

       
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

      
        .review-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .review-container h2 {
            color: #333;
        }

        .review-container p {
            margin: 15px 0;
        }

        .review-container label {
        }

        .review-container input[type="text"] {
            padding: 8px;
            font-size: 16px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .review-container input[type="text"]:read-only {
            background-color: #f4f4f4;
        }

        .review-container .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .review-container .button-group input {
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
         .content {
     padding: 20px;
     font-size: 18px;
     background-color: #fff;
     border-radius: 8px;
     margin: 20px;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 }
        .review-container .button-group input:hover {
            background-color: #82112d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="header">
            <h1>Review Your Order</h1>
        </div>

        <br />

        
        <div class="review-container">
            <h2  style="color: #e5416a;">Your Cake Order</h2>
            <asp:Image ID="imgCake" runat="server" Width="230px" Height="252px" />
            <p>
                <label>Cake Name:</label>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblCakeName" runat="server"></asp:Label>
            </p>
            <p>
                <label>Price: Rs.</label>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblPrice" runat="server"></asp:Label>
            </p>
            <p>
                <label>Full Name:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFullName" runat="server" ReadOnly="True" Height="16px" Width="196px"></asp:TextBox>
            </p>
            <p>
                <label>Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" ReadOnly="True"></asp:TextBox>
            </p>
            <p>
                <label>Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPhone" runat="server" ReadOnly="True" Height="16px" Width="205px"></asp:TextBox>
            </p>
            <p>
                <label>Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" Height="16px" Width="214px"></asp:TextBox>
            </p>
            <p>
                <label>Quantity:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtQuantity" runat="server" ReadOnly="True" Height="16px" Width="133px"></asp:TextBox>
            </p>
            <p>
                &nbsp;</p>

          
            <div class="button-group">
                <asp:Button ID="btnChange" runat="server" Text="Change" OnClick="btnChange_Click" Visible="True" Height="41px" Width="104px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnOk" runat="server" Text="OK" OnClick="btnOk_Click" Visible="False" Height="40px" Width="72px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click" Visible="True" Height="40px" Width="125px" />
            </div>
        </div>
    </form>
</body>
</html>
