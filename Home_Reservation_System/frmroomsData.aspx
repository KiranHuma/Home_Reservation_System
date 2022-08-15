<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmroomsData.aspx.vb" Inherits="Home_Reservation_System.frmroomsData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
   
   
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                 <h3>Room Registration</h3>
                  <br />
                  <asp:Button CommandArgument="View1" ID="btnnext1" runat="server" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="btnlast0" runat="server" Text  ="Room Reservation" />
                   <asp:Button ID="btnlast2" runat="server" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="btnlast1" runat="server" CommandArgument="View4" CommandName="SwitchViewByID" Text="Search" />
            </asp:View>
            <asp:View ID="View2" runat="server">
            </asp:View>
            <asp:View ID="View3" runat="server">
            </asp:View>
            <asp:View ID="View4" runat="server">
            </asp:View>
        </asp:MultiView>
    </form>
   
   
</body>
</html>
