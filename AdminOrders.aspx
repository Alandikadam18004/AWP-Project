<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="web3.AdminOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">
            <h1>Admin Orders Management</h1>

            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" Width="70%">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" />
                    <asp:ButtonField Text="View Details" ButtonType="Button" CommandName="ViewDetails" />
                    <asp:ButtonField Text="Update Status" ButtonType="Button" CommandName="UpdateStatus" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
