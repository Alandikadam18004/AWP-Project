<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="web3.PlaceOrder" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 0 10px #ccc;">
            <h2>Place Your Order</h2>
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Visible="false"></asp:Label>
            
            <div>
                <label for="txtCakeName">Cake Name:</label>
                <asp:TextBox ID="txtCakeName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />

            <div>
                <label for="txtTotal">Total Price:</label>
                <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />

            <div>
                <label for="txtQuantity">Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />

            <div>
                <label for="FileUpload1">Cake Image:</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>
            <br />

            <div>
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="btnPlaceOrder_Click" />
            </div>
        </div>
    </form>
</body>
</html>
