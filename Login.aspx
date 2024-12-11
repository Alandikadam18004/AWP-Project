<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet Bliss Cakes!</title>
    <link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon"/>
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
.header {
    background-color: #e5416a;
    padding: 20px;
    text-align: center;
    color: white;
}
.order-details {
    margin-top: 20px;
}
.order-details div {
    margin: 10px 0;
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
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">
           <div class="header">
            <h1>Login</h1>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        <div class="order-container">
            <div class="order-details">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                <br />
                <br />

                <br />

            <br />
            <asp:Label ID="lblUserName" runat="server" Text="Username:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUserName" runat="server" Height="36px" Width="175px" />
                <br />
                <br />
            <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="35px" Width="164px" />
                <br />
                <br />
            <br />

            <asp:Button ID="btnLogin" CssClass="continue"  runat="server" Text="Login" OnClick="btnLogin_Click" Height="43px" Width="118px" />

                <br />
                <br />

            <br />
            <asp:Label ID="lblNewUser" style="color: #e5416a;"  runat="server" Text="New User? " />
            <asp:HyperLink ID="lnkRegister" runat="server" Style="color: #e5416a;">Register Here</asp:HyperLink>
        </div>
            </div>
            </div>

    </form>
</body>
</html>
