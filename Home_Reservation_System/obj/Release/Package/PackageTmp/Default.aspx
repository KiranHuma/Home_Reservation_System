<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Home_Reservation_System.Frmlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>First form</h1>
        </div>
        <asp:DropDownList ID="selectUser" runat="server" Width="229px">
            <asp:ListItem Value="User"></asp:ListItem>
            <asp:ListItem Value="Admin"></asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:TextBox ID="txtUsername" runat="server" Width="215px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="txtPass" runat="server" Width="218px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="loginBtn" runat="server" Text="Button" />
&nbsp;&nbsp;
            <asp:Label ID="label6" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
