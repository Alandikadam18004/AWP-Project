<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="web3.ViewOrders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sweet Bliss Cakes!</title>
<link rel="icon" href="/images/cake logo.jpeg" type="image/x-icon"/>
    <style type="text/css">
        .order-grid {}
          body {
      font-family: Comic Sans MS;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      color: #333;
            height: 857px;
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
    width: 90%;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
            height: 548px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="header">View Orers</div>
            <br />
            <br />        <div class="review-container">

&nbsp;&nbsp;&nbsp;&nbsp;
                 <br />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="order-grid" 
    AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" Height="259px" Width="755px">
    <Columns>
        <asp:BoundField DataField="OrderId" HeaderText="Order ID" SortExpression="OrderId" />
        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
        <asp:BoundField DataField="CakeName" HeaderText="Cake Name" SortExpression="CakeName" />
        <asp:ImageField DataImageUrlField="CakeImage" HeaderText="Cake Image" SortExpression="CakeImage">
            <ControlStyle Width="100px" Height="100px" />
        </asp:ImageField>
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
    </Columns>
</asp:GridView>
 </div>
        </div>
    </form>
</body>
</html>
