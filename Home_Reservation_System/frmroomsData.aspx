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
    <form id="form2" runat="server">
   <!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-blue w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><asp:Label ID="username_lbl" runat="server" Text="Label"></asp:Label>
        </b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-white" style="font-weight:bold">
  
      <br />
        
      <a href="frmroomsData.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom"> Room Information/CheckIn </a>
    
    
  </div>
  <a href="#footer"  class="w3-bar-item w3-button w3-blue w3-margin-bottom w3-padding">LogOut</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left">Dashboard</p>
         <p class="w3-left"><asp:Label ID="errormessage" runat="server" Text="Label" Visible="False"></asp:Label></p>
       <p class="w3-left"> &nbsp;</p>
    
   <p class="w3-right">
      
      <a href="Default.aspx"><i class="fa fa-home w3-margin-right"></i></a> 
       
     
  
    </p>
      
   
      <asp:Label ID="status_lbl" runat="server" Text="Available" Visible="False"></asp:Label>
      
   
  </header>

  <!-- Image header -->
  <div class="w3-display-container w3-container" >
    <img src="/images/otherpageHeader.png" alt="Jeans" style="width:100%" />

    </div>


  <div class="w3-container w3-text-grey" >
    <p></p>
      <p></p>
  </div>

  <!-- Product grid -->
  <div class="w3-row">
    <div class="w3-col l3 s6">
      <div class="w3-container">
 
      </div>
    

    </div>
       
      
         <div>

          
               <div class="w3-padding-64 w3-light-grey w3-small w3-center ">
            <h2>Room Management</h2>

            <hr />

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"  >
               <asp:View ID="View1" runat="server">
                  <h3>Room Registration</h3>
                  
                    
                      
                       <p>
                           <asp:Label ID="Label1" runat="server" Text="Room Number" Font-Bold="True"></asp:Label> &nbsp;&nbsp;
                           <asp:TextBox ID="roomnum_txt" runat="server" style="text-align: left" Width="322px"></asp:TextBox>
                             <br />
                            <br />
                           <asp:Label ID="Label2" runat="server" Text="Room Type" Font-Bold="True"></asp:Label> &nbsp;&nbsp;
                          
                           <asp:DropDownList ID="roomtype_txt" runat="server" Width="322px">
                               <asp:ListItem>VIP</asp:ListItem>
                               <asp:ListItem>Single Bed</asp:ListItem>
                               <asp:ListItem>Double Bed</asp:ListItem>
                           </asp:DropDownList>
                              <br />
                            <br />
                           <asp:Label ID="Label3" runat="server" Text="Room Rate" Font-Bold="True"></asp:Label> &nbsp; &nbsp;&nbsp;
                              
                           <asp:TextBox ID="roomrate_txt" runat="server"  Width="322px"></asp:TextBox>
                             <br />
                            <br />
                            <br />
                          
                   </p>
                   <asp:Label ID="Label4" runat="server" Text="Select Date"></asp:Label>
                   <asp:Calendar ID="regdate_txt" runat="server" align="center" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="200px">
                       <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                       <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                       <OtherMonthDayStyle ForeColor="#999999" />
                       <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                       <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                       <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                       <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                       <WeekendDayStyle BackColor="#CCCCFF" />
                   </asp:Calendar>
                  
                    
                      
                       <br />
                  
                    
                      
                       <asp:TextBox ID="roomrdate_txt0" runat="server" Visible="False" Width="322px"></asp:TextBox>
                  
                    
                      
                       <br />
                  
                    
                      
                       <br />
                   <asp:Button ID="btnadd" runat="server" Text="Add New" BorderStyle="None" CssClass="w3-button w3-light-green" />
                   <asp:Button ID="btnsave" runat="server" Text="Save" BorderStyle="None" CssClass="w3-button w3-green"/>
                   <asp:Button ID="btnupdate" runat="server" Text="Update" BorderStyle="None" CssClass="w3-button w3-brown" Enabled="False"/>
                   <asp:Button ID="btndel" runat="server" Text="Delete" BorderStyle="None" CssClass="w3-button w3-red " Enabled="False"/>
                  
                  
                    <br />
                        <br />
                     <br />
                     <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="SearchRoom" runat="server" Text="Search Room Number" CssClass="w3-button w3-black"  Width="210px" />
                   &nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:TextBox ID="room_search" runat="server" Width="322px"></asp:TextBox>
                   &nbsp;&nbsp;&nbsp;
                   <br />
                   &nbsp;<asp:GridView ID="roomreg_Grid" align="center" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
                                <Columns>
                      <asp:BoundField DataField="roomnumber" HeaderText="Room Number" ItemStyle-Width="200px" />
                      <asp:BoundField DataField="roomtype" HeaderText="Room Type" ItemStyle-Width="200px" />
                      <asp:BoundField DataField="roomprice" HeaderText="Room Price" ItemStyle-Width="200px" />
                   <asp:BoundField DataField="roomregdate" HeaderText="Room Registration Date" ItemStyle-Width="200px" />
                                
                                    </Columns>
                           </asp:GridView>
                       <asp:Panel ID="Panel3" class="w3-center" runat="server" Width="828px" style="margin-right: 0px">
                       </asp:Panel>      
                   
                   <br />
                    <br />
                    <br />
                    <br />
                   <div style="background-color: #0099FF; height: 50px;" >
                       <br />
                       <asp:Button ID="view1btn1" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View1" Font-Bold="True" ForeColor="#FFFFCC" Text="Rooms Registration" />
                       <asp:Button ID="view1btn2" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View2" CommandName="SwitchViewByID" Font-Bold="True" ForeColor="#FFFFCC" Text="Room Reservation" />
                       <asp:Button ID="view1btn3" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View3" CommandName="SwitchViewByID" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                       <asp:Button ID="view1btn4" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View4" CommandName="SwitchViewByID" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
                   <br />
                       </div>
                   <br />
               </asp:View> 

               <asp:View ID="View2" runat="server">
                  <h3>Room Reservation</h3>
                   <p>
                       <asp:Label ID="Label12" runat="server" Text="Entry #" Font-Bold="True"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:TextBox ID="entry_txt" runat="server" style="text-align: left" Width="325px"></asp:TextBox>
                             &nbsp;
                       <asp:Label ID="Label11" runat="server" Text="Name" Font-Bold="True"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="customer_txt" runat="server" style="text-align: left" Width="325px"></asp:TextBox>
                             <br />
                       <br />
                        <asp:Label ID="Label14" runat="server" Text="Room Number" Font-Bold="True"></asp:Label> &nbsp;&nbsp;<asp:TextBox ID="customerRnumber_txt" runat="server" style="text-align: left" Width="325px" Enabled="False"></asp:TextBox>
                             &nbsp;<asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Room Type"></asp:Label>
                       &nbsp;&nbsp;
                          
                           <asp:DropDownList ID="re_roomtype_txt" runat="server" Width="325px" Enabled="False">
                               <asp:ListItem>VIP</asp:ListItem>
                               <asp:ListItem>Single Bed</asp:ListItem>
                               <asp:ListItem>Double Bed</asp:ListItem>
                           </asp:DropDownList>
                        <br />
                       <br />
                           <asp:Label ID="Label9" runat="server" Text="No. of Customer" Font-Bold="True"></asp:Label> &nbsp; &nbsp;&nbsp;
                              
                           <asp:TextBox ID="re_customer_txt" runat="server"  Width="294px"></asp:TextBox>
                            
                       <br />
                       <br />
                       <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Check In Date"></asp:Label>
                       <asp:Calendar ID="re_checkin_dte" runat="server" align="center" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="200px">
                           <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                           <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                           <OtherMonthDayStyle ForeColor="#999999" />
                           <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                           <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                           <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                           <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                           <WeekendDayStyle BackColor="#CCCCFF" />
                       </asp:Calendar>
                   </p>
                  
                    
                      
                       <p>
                           <asp:TextBox ID="roomredate_txt1" runat="server" Visible="False" Width="322px"></asp:TextBox>
                           <br />
                           <br />
                           <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Address"></asp:Label>
                           <asp:TextBox ID="re_address_txt" runat="server" Width="294px"></asp:TextBox>
                           &nbsp;
                           <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Phone Number"></asp:Label>
                           <asp:TextBox ID="phonenumber_txt" runat="server" Width="325px"></asp:TextBox>
                           <br />
                           <br />
                           <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Price"></asp:Label>
                           <asp:TextBox ID="price_txt" runat="server" Enabled="False" Width="294px"></asp:TextBox>
                           <br />
                   </p>
                  
                    
                      
                       <br />
                   <asp:Button ID="btnadd_res" runat="server" Text="Add New" BorderStyle="None" CssClass="w3-button w3-light-green" />
                                     <asp:Button ID="btnsave_reser" runat="server" Text="Reserve" BorderStyle="None" CssClass="w3-button w3-blue"/>
                   
                   <asp:Button ID="btnupdate_rserv" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"    Text="Update" BorderStyle="None" CssClass="w3-button w3-brown" Enabled="False"/>

                
                   <asp:Button ID="btndelete_rserve" runat="server" Text="Delete" BorderStyle="None" CssClass="w3-button w3-red " Enabled="False"/>
                     <asp:Button ID="Button1" runat="server" Text="Cancel" BorderStyle="None" CssClass="w3-button w3-light-blue " Enabled="False"/>
                    <br />
                        <br />
                     <br />
                     <asp:Button ID="SearchRoom0" runat="server" CssClass="w3-button w3-black" Text="Search Room Number" Width="210px" />
                   <asp:TextBox ID="room_search0" runat="server" Width="322px"></asp:TextBox>
                     <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:GridView ID="reservation_Grid" align="center" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
                                <Columns>
                      <asp:BoundField DataField="roomnumber" HeaderText="Room Number" ItemStyle-Width="200px" />
                      <asp:BoundField DataField="roomtype" HeaderText="Room Type" ItemStyle-Width="200px" />
                      <asp:BoundField DataField="roomprice" HeaderText="Room Price" ItemStyle-Width="200px" />
                   <asp:BoundField DataField="roomregdate" HeaderText="Room Registration Date" ItemStyle-Width="200px" />                        
                 <asp:BoundField DataField="Reservation_Status" HeaderText="Status" ItemStyle-Width="200px" />
                    
                                    </Columns>
                           </asp:GridView>
                   <p>
                       &nbsp;</p>
                   <div style="background-color: #0099FF;height: 50px;">
                       <br />
                 <asp:Button CommandName="SwitchViewByID" ID="view2btn1" runat="server"   CommandArgument="View1" BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="view2btn2" runat="server"   BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text  ="Room Reservation" />
                   <asp:Button ID="view2btn3" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="view2btn4" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
                       <br />
                       </div>
               </asp:View> 

               <asp:View ID="View3" runat="server">
                  <h3> Reserved Room</h3>
                   <p>
                       <asp:Button ID="SearchRoom1" runat="server" CssClass="w3-button w3-black" Text="Search Customer" Width="210px" />
                       <asp:TextBox ID="room_search1" runat="server" Width="322px"></asp:TextBox>
                   </p>
                   <p>
                       <asp:Button ID="Button6" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View2" CommandName="SwitchViewByID" Font-Bold="True" ForeColor="#FFFFCC" Text="Select Rows to Remove" />
                       <asp:Label ID="Label22" runat="server" Text="Label" Visible="False"></asp:Label>
                   </p>
                   <asp:GridView ID="reservedgrid" runat="server" align="center" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
                       <Columns>
                           <asp:BoundField DataField="EntryNumber" HeaderText="Entry Number" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Room_Number" HeaderText="Room Number" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Room_Type" HeaderText="Room Type" ItemStyle-Width="200px" />
                          <asp:BoundField DataField="Number_of_Customers" HeaderText="NO. of Customers" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Check_In_Date" HeaderText="Check In Date" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-Width="200px" />
                             <asp:BoundField DataField="Reservation_Status" HeaderText="Reservation Status" ItemStyle-Width="200px" />
                           </Columns>
                   </asp:GridView>
                  <br />
                  <br />
                   <div style="background-color: #0099FF;height: 50px;">
                       <br />
                 <asp:Button CommandName="NextView" ID="view3btn1"   runat="server"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button CommandArgument="View2" CommandName="SwitchViewByID" ID="view3btn2" runat="server"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text  ="Room Reservation" />
                   <asp:Button ID="view3btn3" runat="server" CommandArgument="View3" CommandName="SwitchViewByID"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="view3btn4" runat="server" CommandArgument="View4" CommandName="SwitchViewByID"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />
             <br />
                       </div >
                       </asp:View> 
                    <asp:View ID="View4" runat="server">
                  <h3> Search</h3>
                        <p>
                            <asp:Label ID="Label21" runat="server" Text="Search by Customer Name"></asp:Label>
                        </p>
                        <p>
                            <asp:TextBox ID="TextBox3" runat="server" Width="294px"></asp:TextBox>
                            <asp:Button ID="SearchRoom2" runat="server" CssClass="w3-button w3-black" Text="Search Customer" Width="210px" />
                        </p>
                        <p>
                            &nbsp;</p>
                        <asp:GridView ID="DataGridView1" runat="server" align="center" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                               <Columns>
                           <asp:BoundField DataField="EntryNumber" HeaderText="Entry Number" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Room_Number" HeaderText="Room Number" ItemStyle-Width="200px" />
                           <asp:BoundField DataField="Room_Type" HeaderText="Room Type" ItemStyle-Width="200px" />
                          <asp:BoundField DataField="Number_of_Customers" HeaderText="NO. of Customers" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Check_In_Date" HeaderText="Check In Date" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="200px" />
                              <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-Width="200px" />
                             <asp:BoundField DataField="Reservation_Status" HeaderText="Reservation Status" ItemStyle-Width="200px" />
                           </Columns>
                        </asp:GridView>
                        <p>
                            &nbsp;</p>
                  <br />
                  <br />
                        <div style="background-color: #0099FF;height: 50px;">
                            <br />
                  <asp:Button  CommandArgument="0" ID="view4btn1"  CommandName="SwitchViewByIndex" runat="server"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text = "Rooms Registration" />
                  <asp:Button ID="view4btn2" runat="server" CommandArgument="View2"   BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text = "Room Reservation" />

                   <asp:Button ID="view4btn3" runat="server"  CommandName="PrevView"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Reserved Room" />
                   <asp:Button ID="view4btn4" runat="server" CommandName="PrevView"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="Search" />     
                          <br />
                            </div>
                    </asp:View> 

            </asp:MultiView>
         </div>



          

        </div>
         
      
   

   

    
  </div>

  <!-- Subscribe section Button>>>>>class="w3-input w3-border" -->
 
  
  <!-- Footer -->
  <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
      <div class="w3-col s4">
      
   
          <asp:Label ID="welcomemsg" runat="server"></asp:Label>
      
   
      </div>
         &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
        
        
  
       
      </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

     
    
      


      
  &nbsp;
  </footer>

  <div class="w3-black w3-center w3-padding-24">All Rights Reserved by <a href="http://ayatfatim-001-site1.atempurl.com/" title="W3.CSS" target="_blank" class="w3-hover-opacity">Home Stay Reservation</a></div>

  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>

<script>
    // Accordion 
    function myAccFunc() {
        var x = document.getElementById("demoAcc");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }

    // Click on the "Jeans" link on page load to open the accordion for demo purposes
    document.getElementById("myBtn").click();


    // Open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>
    </form>
   
   
   </body>
</html>
   

