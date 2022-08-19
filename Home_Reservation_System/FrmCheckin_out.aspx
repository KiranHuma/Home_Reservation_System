<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmCheckin_out.aspx.vb" Inherits="Home_Reservation_System.FrmCheckin_out" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check IN/OUT Information</title>
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
    .auto-style3 {
        height: 21px;
        width: 135px;
    }
    .center {
  margin-left: auto;
  margin-right: auto;
}
    .auto-style6 {
        width: 233px;
    }
    .auto-style7 {
        margin-left: 104;
    }
    .auto-style8 {
        margin-left: 20px;
    }
    .auto-style9 {
        height: 21px;
        width: 201px;
        text-align: left;
    }
    .auto-style10 {
        width: 201px;
    }
    .auto-style11 {
        text-align: left;
    }
    </style>
    </head>
<body>
  <form id="form2" runat="server">
   <!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-blue w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><asp:Label ID="username_lbl" runat="server" Text="Label" Visible="False"></asp:Label>
        </b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-white" style="font-weight:bold">
  
      <br />
        
      <a href="FrmCheckin_out.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom"> Check In/Out </a>
    
    
  </div>
  <a href="frmroomsData.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom w3-padding">LogOut</a>
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
    <p class="w3-left">Check IN/OUT Records</p>
         <p class="w3-left"><asp:Label ID="errormessage" runat="server" Text="Label" Visible="False"></asp:Label></p>
       <p class="w3-left"> &nbsp;</p>  
   <p class="w3-right">   
      <a href="frmdashboard.aspx"><i class="fa fa-home w3-margin-right"></i></a>           
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
            <h2>Check IN/OUT Management</h2>
            <hr />
             
               <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"  >
            

             
                         <asp:View ID="View1" runat="server">
                  <h3> Check In</h3>
                   <p>
                       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   </p>
                 
                       &nbsp;<table class="center">
                            <tr>
                               <td class="auto-style10" style="text-align: left;">
                                   
                                </td>
                             
                           </tr>
                           <tr>
                               <td class="auto-style10" style="text-align: left;">
                                   <asp:Calendar ID="trandtefrom_txt" runat="server"></asp:Calendar>
                               </td>
                               <td class="auto-style3" style="text-align: center;">
                                   <asp:Calendar ID="trandteto_txt" runat="server" CssClass="auto-style8"></asp:Calendar>
                               </td>
                           </tr>
                           <tr>
                                 <td class="auto-style9">
                                  <asp:RadioButton ID="transactioncheck" runat="server" Text="Search by Date" AutoPostBack="True" />
                                </td>
                           </tr>
                       </table>
                             <br />
                               <br />
                             <br />
                       &nbsp;
                       <asp:Label ID="Label1" runat="server" Text="Search by Customer Name"></asp:Label>
                             <br />
                   <asp:TextBox ID="TextBox1" runat="server" Width="337px" AutoPostBack="True"></asp:TextBox>
                              <br />
                               <br />
                   <asp:GridView ID="payment_Gridd" runat="server" align="center" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
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
                 <asp:Button ID="view1btn1" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View1"  runat="server"   Font-Bold="True" ForeColor="#FFFFCC" Text = "Customer/CheckIn Details" />
                  <asp:Button ID="view1btn2" runat="server" BackColor="#0099FF" BorderStyle="None" CommandArgument="View2" CommandName="SwitchViewByID"   Font-Bold="True" ForeColor="#FFFFCC" Text  ="CheckOut" />
             <br />
                       </div >
                       </asp:View> 
                    <asp:View ID="View2" runat="server">
                  <h3> Check Out</h3>
                        <p>
                            
                        </p>
                         <table align="center" class="center">
                             <tr>
                                
                               <td class="auto-style6" style="text-align: left;">
                                    
                                </td>
                                <td style="text-align: right;">
                                    
                                </td>
                            </tr>
                             
                             <tr>
                                 <td class="auto-style6" style="text-align: left;">
                                    <asp:Calendar ID="DateTimePicker2" runat="server" Width="133px"></asp:Calendar>
                                </td>
                                <td style="text-align: center;">
                                    <asp:Calendar ID="DateTimePicker1" runat="server"></asp:Calendar>
                                </td>
                                 
                             </tr>
                             <tr>
                                 <td class="auto-style11">
                                 <asp:RadioButton ID="RadioButton1" runat="server" Text="Search by Date" AutoPostBack="True" />
                                 </td>
                                 <td>
    
                                 </td>
                             </tr>
                        </table>
                        <br />
                        <br />
                        <asp:Label ID="Label21" runat="server" Text="Search by Customer Name"></asp:Label>
                        <br />

                        <asp:TextBox ID="TextBox2" runat="server" Width="337px" CssClass="auto-style7" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <br />
                        <asp:GridView ID="DataGridView1" runat="server" align="center" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                            <Columns>
                                <asp:BoundField DataField="Transacion_ID" HeaderText="Transaction ID" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Room_Number" HeaderText="Room Number" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Room_Type" HeaderText="Room Type" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Number_of_Customers" HeaderText="NO. of Customers" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Check_In_Date" HeaderText="Check In Date" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Check_Out_Date" HeaderText="Check Out Date" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Service_Details" HeaderText="Service Details" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Total_Service_Rate" HeaderText="Total Services Bill" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Discount" HeaderText="Discount" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Total_Bill" HeaderText="Total Bill" ItemStyle-Width="200px" />
                            </Columns>
                        </asp:GridView>
                        <p>
                            &nbsp;</p>
                  <br />
                  <br />
                        <div style="background-color: #0099FF;height: 50px;">
                            <br />
                  <asp:Button  CommandArgument="0" CommandName="PrevView" ID="view2btn1" runat="server"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text = "Customer/CheckIn Details" />
                   <asp:Button  CommandArgument="View2" CommandName="SwitchViewByID" ID="view2btn2"   runat="server"  BackColor="#0099FF" BorderStyle="None" Font-Bold="True" ForeColor="#FFFFCC" Text="CheckOut" />     
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
      
   
          <asp:Label ID="welcomemsg" runat="server" Font-Size="X-Large"></asp:Label>
      
   
      </div>
        
      </div>
       
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
