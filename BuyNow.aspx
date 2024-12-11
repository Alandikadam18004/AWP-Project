<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyNow.aspx.cs" Inherits="web3.BuyNow" %>

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

       
        .order-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            text-align: center;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .order-details {
            margin-top: 20px;
        }

        .order-details img {
             border-radius: 8px;
             width: 100%;
            height: 300px;
            transition: box-shadow 0.3s ease;         }

        .order-details img :hover {
            box-shadow: 0 12px 24px #0f0105;
              }

        .order-details div {
            margin: 10px 0;
        }

        .error {
            color: red;
            font-size: 18px;
             font-weight: bold;
        }
         .content {
     padding: 20px;
     font-size: 18px;
     background-color: #fff;
     border-radius: 8px;
     margin: 20px;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 }
        .continue {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px 20px;
            background-color: #e5416a;
            color: white;
            border-radius: 5px;
            cursor: pointer;
    font-size: large;
            transition: background-color 0.2s ease;
            margin: 5px;
}
.continue:hover {
    background-color: #82112d;
}

      
        footer {
            text-align: center;
            padding: 10px;
            background-color: #e5416a;
            color: white;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        
        <div class="header">
            <h1>Order Cake</h1>
        </div>

        <br />

       
        <div class="order-container">
            <div class="order-details">
                <asp:Image ID="imgCake" runat="server" Height="230px" Width="252px" />
                <div>
                    <label>Cake Name: </label>
                    <asp:Label ID="lblCakeName" runat="server" />
                </div>
                <div>
                    <label>Price: ₹ </label>
                    <asp:Label ID="lblPrice" runat="server" />
                </div>
                <div>
                    <label>Quantity:&nbsp;&nbsp;&nbsp;&nbsp; </label>
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" Height="26px" Width="70px" />
                    <span id="errorQuantity" class="error"></span>
                </div>
            </div>

            
            <h3 style="color: #e5416a;" >Your Information</h3>
            <div>
                <label>Full Name:&nbsp;&nbsp;&nbsp; </label>&nbsp;<asp:TextBox ID="txtFullName" runat="server" Height="27px" Width="163px" />
                <br />
                <br />
            </div>
            <div>
                <label>Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" ></asp:TextBox>
                <br />
                <br />
            </div>
            <div>
                <label>Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPhone" runat="server" Height="32px" Width="176px" />
                <br />
                <br />
            </div>
            <div>
                <label>Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server" Height="31px" Width="187px" />
                <br />
                <br />
            </div> &nbsp;&nbsp;

            
            <asp:Button ID="btnProceedToPayment" runat="server"  OnClick="btnProceedToPayment_Click" Text="Proceed to Payment" Height="41px" CssClass="continue" Width="203px" />
            <br />
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<div> <span id="errorFields" class="error"></span> &nbsp;&nbsp;
<span id="errorEmail" class="error"></span> &nbsp;&nbsp;
    <span id="errorPhone" class="error"></span><br>
&nbsp;&nbsp; </div>
        </div>

        <br />

       
        <footer>
            &copy; 2024 My Cake Shop. All Rights Reserved.
        </footer>
    </form>

    <script type="text/javascript">
        
        function validateForm() {
          
            var quantity = document.getElementById("txtQuantity").value;
            if (quantity < 1 || isNaN(quantity)) {
                document.getElementById("errorQuantity").innerText = "Quantity must be 1 or more.";
                return false;
            } else {
                document.getElementById("errorQuantity").innerText = "";
            }

           
            var fullName = document.getElementById("txtFullName").value.trim();
            var address = document.getElementById("txtAddress").value.trim();
            var phone = document.getElementById("txtPhone").value.trim();
            var email = document.getElementById("txtEmail").value.trim();

            if (fullName === "" || address === "" ) {
                document.getElementById("errorFields").innerText = "All fields are required.";
                return false;
            } else {
                document.getElementById("errorFields").innerText = "";
            }

          
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById("errorEmail").innerText = "Please enter a valid email address.";
                return false;
            } else {
                document.getElementById("errorEmail").innerText = "";
            }

            
            var phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(phone)) {
                document.getElementById("errorPhone").innerText = "Phone number must be exactly 10 digits.";
                return false;
            } else {
                document.getElementById("errorPhone").innerText = "";
            }

            return true;
        }
    </script>
</body>
</html>
