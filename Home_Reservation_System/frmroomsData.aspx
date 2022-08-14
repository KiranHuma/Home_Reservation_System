<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmroomsData.aspx.vb" Inherits="Home_Reservation_System.frmroomsData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">

        <div>

            <asp:Panel ID="Panel1" runat="server" Height="23px" style="margin-top: 44px" Width="910px">
                <asp:Button ID="RoomReg" runat="server" BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Rooms Registration" />
                <asp:Button ID="Button2" runat="server" BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Room Reservation" />
                <asp:Button ID="Button3" runat="server" BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                <asp:Button ID="Button4" runat="server" BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
               <br />
                <br />
                <br />
                <br />
               <div>
            <h2>MultiView and View Controls</h2>
            
            <asp:DropDownList ID="DropDownList1" runat="server" Width="231px">
            </asp:DropDownList>
            
            <hr />
            
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"  onactiveviewchanged="MultiView1_ActiveViewChanged" >
               <asp:View ID="View1" runat="server">
                  <h3>Room Registration</h3>
                  <br />
                  <asp:Button CommandArgument="View1" ID="btnnext1" runat="server" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="btnlast0" runat="server" Text  ="Room Reservation" />
                   <asp:Button ID="btnlast2" runat="server" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="btnlast1" runat="server" CommandArgument="View4" CommandName="SwitchViewByID" Text="Search" />
               </asp:View> 
					
               <asp:View ID="View2" runat="server">
                  <h3>Room Reservation</h3>
                 <asp:Button CommandName="View1" ID="Button6" runat="server" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="Button7" runat="server" Text  ="Room Reservation" />
                   <asp:Button ID="Button8" runat="server" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="Button9" runat="server" CommandArgument="View4" CommandName="SwitchViewByID" Text="Search" />
              
                   
               </asp:View> 

               <asp:View ID="View3" runat="server">
                  <h3> Reserved Room</h3>
                  <br />
                  <asp:Calendar ID="Calender1" runat="server"></asp:Calendar>
                  <br />
                 <asp:Button CommandName="View1" ID="Button10" runat="server" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="Button11" runat="server" Text  ="Room Reservation" />
                   <asp:Button ID="Button12" runat="server" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="Button13" runat="server" CommandArgument="View4" CommandName="SwitchViewByID" Text="Search" />
               </asp:View> 
                    <asp:View ID="View4" runat="server">
                  <h3> Search</h3>
                  <br />
                  <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                  <br />
                  <asp:Button  CommandArgument="0" CommandName="SwitchViewByIndex" ID="Button1"   runat="server" Text = "Rooms Registration" />
                  <asp:Button CommandName="View2" ID="Button5" runat="server" Text = "Room Reservation" />
              
                   <asp:Button ID="Button14" runat="server" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="Button15" runat="server" CommandArgument="View4" CommandName="SwitchViewByID" Text="Search" />     
                    
                    </asp:View> 
               
            </asp:MultiView>
         </div>



            </asp:Panel>

        </div>
    </form>
</body>
</html>
