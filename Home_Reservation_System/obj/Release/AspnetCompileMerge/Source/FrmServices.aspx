﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmServices.aspx.vb" Inherits="Home_Reservation_System.FrmServices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Services Information</title>
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
    .center {
  margin-left: auto;
  margin-right: auto;
}
    .auto-style16 {
        width: 100%;
    }
    </style>
</head>
<body>
      <form id="form1" runat="server">
      
   <!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-blue w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><asp:Label ID="username_lbl" runat="server" Text="Label" Visible="False"></asp:Label>
        </b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-white" style="font-weight:bold">
  
      <br />
        
      <a href="FrmCheckin_out.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom">Services </a>
    
    
  </div>
  <a href="Default.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom w3-padding">LogOut</a>
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
    <p class="w3-left">Services Management</p>
         <p class="w3-left"><asp:Label ID="errormessage" runat="server" Text="Label" Visible="False"></asp:Label></p>
       <p class="w3-left"> &nbsp;</p>  
   <p class="w3-right">   
      <a href="frmdashboard.aspx"><i class="fa fa-home w3-margin-right"></i></a>           
    </p>       
      <asp:Label ID="status_lbl" runat="server" Text="Available" Visible="False"></asp:Label>     
      <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
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
            <h2>Services Management</h2>
            <hr />



                     <br />
                   <div>

                       <div>

                           <table align="center" class="auto-style16">
                                <tr>
                               <td style="text-align: right;">
                                   <asp:Label ID="Label1" runat="server" Text="Service ID"></asp:Label>
                               </td>
                               <td style="text-align: left;">
                                   <asp:TextBox ID="service_txt" runat="server" Width="322px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td style="text-align: right;">
                                   <asp:Label ID="Label2" runat="server" Text="Service Name"></asp:Label>
                               </td>
                               <td style="text-align: left;">
                                   <asp:DropDownList ID="serviceName_txt" runat="server" Width="322px">
                                       <asp:ListItem>Bed Sheet</asp:ListItem>
                                       <asp:ListItem>Extra Bed</asp:ListItem>
                                       <asp:ListItem>Spa</asp:ListItem>
                                   </asp:DropDownList>
                               </td>
                           </tr>
                           <tr>
                               <td style="text-align: right;">
                                   <asp:Label ID="Label3" runat="server" Text="Service Rate"></asp:Label>
                               </td>
                               <td style="text-align: left;">
                                   <asp:TextBox ID="serviceRate_txt" runat="server" Width="322px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td style="text-align: right;">
                                   <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                               </td>
                               <td style="text-align: left;">
                                   <asp:Calendar ID="serviceDate_txt" runat="server" Height="166px" Width="72px"></asp:Calendar>
                               </td>
                           </tr>
                           <tr>
                               <td></td>
                           </tr>
                           <tr>
                               <td>&nbsp;</td>
                               <td> <asp:Button ID="btnadd" runat="server" Text="Add New" BorderStyle="None" CssClass="w3-button w3-light-green" />
                                    <asp:Button ID="btnsave" runat="server" Text="Save" BorderStyle="None" CssClass="w3-button w3-green"/>
                                      <asp:Button ID="btnupdate" runat="server" Text="Update" BorderStyle="None" CssClass="w3-button w3-brown" Enabled="False" ToolTip="Select the field from Grid to Edit"/>
                                    <asp:Button ID="btndel" runat="server" Text="Delete" BorderStyle="None" CssClass="w3-button w3-red " Enabled="False" ToolTip="Select the rows from Grid to delete"/></td>
                           </tr>
                           </table>

                       </div>

                       <table class="auto-style16">
                          
                       </table>



                   </div>
                 <br />
                 <asp:Label ID="Label8" runat="server" Text="Search Service"></asp:Label>
                 <br />
                 <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Width="309px" ToolTip="Search by Customer Name"></asp:TextBox>
                 <br />
                 <br />
                 <asp:GridView ID="servicereg_Grid" runat="server" align="center" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
                            <Columns>
                                <asp:BoundField DataField="Service_ID" HeaderText="Service ID" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Service_Name" HeaderText="Service Name" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Service_Rate" HeaderText="Service Bill" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="Service_Reg_Date" HeaderText="Service Reg Date" ItemStyle-Width="200px" />
                                
                            </Columns>
                        </asp:GridView>
             </div>
              
      
      </div>



          

        </div>
         
      
   

   

    
  </div>
 <!-- Subscribe section Button>>>>>class="w3-input w3-border" -->
 
  
  <!-- Footer -->
  <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
      <div class="w3-col s4">
      
   
      </div>
        
        <asp:Label ID="welcomemsg" runat="server" Font-Size="X-Large"></asp:Label>
        
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
