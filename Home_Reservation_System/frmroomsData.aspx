<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmroomsData.aspx.vb" Inherits="Home_Reservation_System.frmroomsData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rooms Information</title>
    <script type="text/javascript" language="javascript">

            function DisableBackButton() {
                window.history.forward()
            }
            DisableBackButton();
            window.onload = DisableBackButton;
            window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
            window.onunload = function () { void (0) }
    </script>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
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

            <hr />

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"  >
               <asp:View ID="View1" runat="server">
                  <h3 style="text-align: center">Room Registration</h3>
                  
                    
                      
                       <asp:Panel ID="Panel3" runat="server" Width="400px">
                           <asp:Label ID="Label1" runat="server" Text="Room Number"></asp:Label>
                           <asp:TextBox ID="roomnum_txt" runat="server" style="text-align: left"></asp:TextBox>
                           <br />
                           <asp:Label ID="Label2" runat="server" Text="Room Type"></asp:Label>
                           <asp:DropDownList ID="roomtype_txt" runat="server" Width="157px">
                           </asp:DropDownList>
                           <br />
                           <asp:Label ID="Label3" runat="server" Text="Room Rate"></asp:Label>
                           <asp:TextBox ID="roomrate_txt" runat="server"></asp:TextBox>
                           <asp:Label ID="Label4" runat="server" Text="Select Date"></asp:Label>
                           <asp:Calendar ID="regdate_txt" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="200px">
                               <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                               <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                               <OtherMonthDayStyle ForeColor="#999999" />
                               <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                               <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                               <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                               <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                               <WeekendDayStyle BackColor="#CCCCFF" />
                           </asp:Calendar>
                           <asp:Button ID="btnadd" runat="server" Text="Add New" />
                           <asp:Button ID="btnsave" runat="server" Text="Save" />
                           <asp:Button ID="btnupdate" runat="server" Text="Update" />
                           <asp:Button ID="btndel" runat="server" Text="Delete" />
      
                            
                       
                            
                       </asp:Panel>
                  
                    
                      
                      
                      
                      
                 
                   
                   
                   <br />
                  <asp:Button CommandArgument="View1" ID="btnnext1" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="btnlast0" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text  ="Room Reservation" />
                   <asp:Button ID="btnlast2" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" CommandArgument="View3" CommandName="SwitchViewByID" Text="Reserved Room" />
                   <asp:Button ID="btnlast1" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
               </asp:View> 

               <asp:View ID="View2" runat="server">
                  <h3>Room Reservation</h3>
                 <asp:Button CommandName="View1" ID="Button6" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="Button7" runat="server"   BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text  ="Room Reservation" />
                   <asp:Button ID="Button8" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="Button9" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />


               </asp:View> 

               <asp:View ID="View3" runat="server">
                  <h3> Reserved Room</h3>
                  <br />
                  <asp:Calendar ID="Calender1" runat="server"></asp:Calendar>
                  <br />
                 <asp:Button CommandName="View1" ID="Button10" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="Button11" runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text  ="Room Reservation" />
                   <asp:Button ID="Button12" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="Button13" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
               </asp:View> 
                    <asp:View ID="View4" runat="server">
                  <h3> Search</h3>
                  <br />
                  <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                  <br />
                  <asp:Button  CommandArgument="0" CommandName="SwitchViewByIndex" ID="Button1"   runat="server"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandName="View2" ID="Button5" runat="server"   BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text = "Room Reservation" />

                   <asp:Button ID="Button14" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="Button15" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#3366FF" BorderStyle="Groove" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />     

                    </asp:View> 

            </asp:MultiView>
         </div>



            </asp:Panel>

        </div>
         
      </form>
   </body>
</html>
   

