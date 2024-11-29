<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProductManagement.aspx.cs" Inherits="web3.AdminProductManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">
            <h1>Admin Product Management</h1>

            <!-- Form to Add New Cake -->
            <div>
                <h2>Add New Cake</h2>
                <asp:Label ID="lblCakeName" runat="server" Text="Cake Name: "></asp:Label>
                <asp:TextBox ID="txtCakeName" runat="server"></asp:TextBox><br /><br />
                
                <asp:Label ID="lblPrice" runat="server" Text="Price: "></asp:Label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox><br /><br />

                <asp:Button ID="btnAddCake" runat="server" Text="Add Cake" OnClick="btnAddCake_Click" />
            </div>

            <hr />

            <!-- Grid to View Cakes -->
            <h2>Existing Cakes</h2>
            <asp:GridView ID="gvCakes" runat="server" AutoGenerateColumns="False" Width="70%">
                <Columns>
                    <asp:BoundField DataField="CakeID" HeaderText="Cake ID" />
                    <asp:BoundField DataField="CakeName" HeaderText="Cake Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:ButtonField Text="Edit" ButtonType="Button" CommandName="Edit" />
                    <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="Delete" />
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
