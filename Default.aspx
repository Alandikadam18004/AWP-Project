<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div style="text-align:center;">
            <h1>Welcome to Simple E-Commerce</h1>
            <p>Start shopping for amazing products!</p>
            <asp:Button ID="btnShop" runat="server" Text="Start Shopping" OnClick="btnShop_Click" />
        </div>
    </form>
</body>
</html>
