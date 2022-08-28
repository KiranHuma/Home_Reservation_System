<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddUsers.aspx.vb" Inherits="Home_Reservation_System.AddUsers" %>

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
    .center {
  margin-left: auto;
  margin-right: auto;
}
    .auto-style10 {
        width: 156px;
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
        
      <a href="AddUsers.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom"> Add Users </a>
    
    
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
    <p class="w3-left">Sign Up</p>
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
      <p>
                                     <asp:Label ID="Label14" runat="server" Text="Edit" ForeColor="White"></asp:Label>
                                 </p>
  </div>
  <!-- Product grid -->
  <div class="w3-row">
    <div class="w3-col l3 s6">
      <div class="w3-container">
      </div>   
    </div>          
         <div>     
               <div class="w3-padding-64 w3-light-grey w3-small w3-center ">
            <h2>Please fill in the form to create account!</h2>
            <hr />
        <div>
             <table  cellspacing="1" class="center">
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="UserID"></asp:Label></td>
                               <td style=" text-align: left;">
                                   <asp:TextBox ID="Uid_txt" runat="server" style="text-align: left" Width="322px" AutoPostBack="True"></asp:TextBox>
                                   <asp:Label ID="score_txt" runat="server" Text="0" Visible="False"></asp:Label>
                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                   <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Role"></asp:Label>
                               </td>
                               <td style=" text-align: left;">
                                    <asp:DropDownList ID="ComboBox1" runat="server" Width="322px">
                           <asp:ListItem>admin</asp:ListItem>
                           <asp:ListItem>User</asp:ListItem>
                       </asp:DropDownList>
                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                   <asp:Label ID="label1" runat="server" Font-Bold="True" Text="User Name"></asp:Label>

                               </td>
                               <td style=" text-align: left;">
                                   <asp:TextBox ID="txtUsername" runat="server" style="text-align: left" Width="322px" AutoPostBack="True"></asp:TextBox>
                               </td>
                           </tr>
                             <tr><td></td></tr>
                               <tr><td style=" text-align: right;">
                                   <asp:Label ID="label2" runat="server" Font-Bold="True" Text="Name"></asp:Label>
                                   </td>
                                   <td style=" text-align: left;">
                                   <asp:TextBox ID="txtName" runat="server" style="text-align: left" Width="322px"></asp:TextBox>
                                   </td>
                               </tr>
                          <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                   <asp:Label ID="label3" runat="server" Font-Bold="True" Text="Password"></asp:Label>
                               </td>
                               <td style=" text-align: left;">
                                   <asp:TextBox ID="txtPass" runat="server" style="text-align: left" Width="322px" AutoPostBack="True"></asp:TextBox>
                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                    <asp:Label ID="label4" runat="server" Font-Bold="True" Text="Password Again"></asp:Label>
                               </td>
                               <td style=" text-align: left;">
                                       <asp:TextBox ID="txtPassAgain" runat="server" Width="322px" AutoPostBack="True"></asp:TextBox>
                               </td>
                           </tr>
                             <tr><td></td>
                                 <td style=" text-align: left;">
                                     <asp:Label ID="label8" runat="server" Text="label8" Visible="False"></asp:Label>
                                 </td>
                             </tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10"> 
                                   <asp:Label ID="label5" runat="server" Font-Bold="True" Text="Gender"></asp:Label>

                               </td>
                               <td style=" text-align: left;">  
                                   <asp:TextBox ID="CmboGender" runat="server" Width="322px"></asp:TextBox>

                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                      <asp:Label ID="label9" runat="server" Font-Bold="True" Text="Contact no."></asp:Label>
                               </td>
                               <td style=" text-align: left;">
                                   <asp:TextBox ID="txtContact" runat="server" Width="322px"></asp:TextBox>

                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                    <asp:Label ID="label6" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                               </td>
                               <td style=" text-align: left;">
                                   <asp:TextBox ID="txtEmail" runat="server" Width="322px"></asp:TextBox>
                               </td>
                           </tr>
                             <tr><td></td></tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                   &nbsp;</td>
                               <td style=" text-align: left;">
                                   <asp:Label ID="label7" runat="server" Font-Bold="True" Text="label7"></asp:Label>
                               &nbsp;&nbsp;
                               </td>
                           </tr>
                             <tr><td></td>
                                 <td>

                                     <asp:Label ID="Label16" runat="server"></asp:Label>

                                 </td>
                             </tr>
                           <tr>
                               <td style=" text-align: right;" class="auto-style10">
                                  
                               </td>
                               <td style=" text-align: left;">
                                     <asp:Button ID="button2" runat="server" BorderStyle="None" CssClass="w3-button w3-light-green" Text="SignUp" />
                   <asp:Button ID="button1" runat="server" BorderStyle="None" CssClass="w3-button w3-brown" Text="Update" />
                               </td>
                           </tr>
                          
                   </table>
        </div>
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
