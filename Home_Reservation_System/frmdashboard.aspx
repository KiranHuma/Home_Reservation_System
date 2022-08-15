<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmdashboard.aspx.vb" Inherits="Home_Reservation_System.frmdashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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
   <!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-blue w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><asp:Label ID="username_lbl" runat="server" Text="Label"></asp:Label>
        </b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-white" style="font-weight:bold">
  
      <br />
        
      <a href="#"  class="w3-bar-item w3-button w3-blue w3-margin-bottom"> Room Information/CheckIn </a>
    <a href="#" class="w3-bar-item w3-button w3-blue w3-margin-bottom">Services Information</a>
       <a href="#" class="w3-bar-item w3-button w3-blue w3-margin-bottom">Customer Payment</a>

  
    <a href="#" class="w3-bar-item w3-button w3-blue w3-margin-bottom">Customer/Check In/Out </a>
    
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
       <p class="w3-left"> <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label></p>
    
   <p class="w3-right">
      
      <a href="Default.aspx"><i class="fa fa-home w3-margin-right"></i></a> 
       
     
  
    </p>
      
   
  </header>

  <!-- Image header -->
  <div class="w3-display-container w3-container">
    <img src="../images/homestays1.png" alt="Jeans" style="width:100%">
    <div class="w3-display-topleft w3-text-white" style="padding:24px 48px">
      <h1 class="w3-jumbo w3-hide-small">Home Stay Reservation System</h1>
      <h1 class="w3-hide-large w3-hide-medium">New arrivals</h1>
      <h1 class="w3-hide-small">Choose Best</h1>
      <p><a href="#jeans" class="w3-button w3-black w3-padding-large w3-large">Book NOW</a></p>
    </div>
  </div>

  <div class="w3-container w3-text-grey" >
    <p></p>
  </div>

  <!-- Product grid -->
  <div class="w3-row">
    <div class="w3-col l3 s6">
      <div class="w3-container">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="/images/rooms.png"  style="width:40%"/>
       
            
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rooms<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label10" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
          </p>
      </div>
    

    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
       
          <img src="/images/occupiedroom.jpg" style="width:50%"/>
         
       
        <p>Reserved Rooms<br/> <asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
          </p>
      </div>
    
    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
        <img src="/images/checkin.png"  style="width:40%"/>
        <p>Today's CheckIn<br/> <asp:Label ID="Label11" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
          </p>
      </div>
      <div class="w3-container">
        <div class="w3-display-container">
         
        
          
        </div>
      
      </div>
    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
        <img src="/images/checkout.png" style="width:40%"/>
        <p> Today's CheckOut<br/><asp:Label ID="Label12" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
          </p>
      </div>
     
    </div>
  </div>

  <!-- Subscribe section Button>>>>>class="w3-input w3-border" -->
  <div class="w3-container w3-black w3-padding-32">
   
   
    <p>&nbsp;</p>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="TextBox2" runat="server" Width="235px"></asp:TextBox>
       &nbsp;<asp:Button class="w3-button w3-red w3-margin-bottom"    ID="Button1" runat="server" Text="Search Available Room" Width="200px" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;
             
      <asp:TextBox ID="TextBox1"  Width="235px" runat="server"></asp:TextBox>
      &nbsp;
      <asp:Button class="w3-button w3-red w3-margin-bottom"    ID="Button2" runat="server" Text="Search Customer List" Width="200px" />
     
      <br />
      <br />
      &nbsp;<br />
       &nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
      <br />
     
  </div>
  
  <!-- Footer -->
  <footer class="w3-padding-64 w3-light-grey w3-small w3-center" id="footer">
    <div class="w3-row-padding">
      <div class="w3-col s4">
        <h4>Available Room
          </h4>
          <p>
              <asp:GridView ID="reservation_Grid" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                  <Columns>
                      <asp:BoundField DataField="roomnumber" HeaderText="Room Number" ItemStyle-Width="150px" />
                      <asp:BoundField DataField="roomtype" HeaderText="Room Type" ItemStyle-Width="150px" />
                      <asp:BoundField DataField="roomprice" HeaderText="Room Price" ItemStyle-Width="150px" />
                  </Columns>
              </asp:GridView>
          </p>
   
      </div>
         &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
        
        
      <div class="w3-col s4">
        <h4>Coustmer List
          </h4>
          <p><asp:GridView ID="DataGridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
           <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="EntryNumber" HeaderText="Entry Number" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Customer_Name" HeaderText="Customer Name" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Room_Number" HeaderText="Room Number" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Room_Type" HeaderText="Room Type" />
           
    </Columns>
            </asp:GridView>&nbsp;</p>
       
      </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

      <div class="w3-col s4 w3-justify" id="jeans">
        
        <p><i class="fa fa-fw fa-map-marker"></i> Home Stay</p>
        <p><i class="fa fa-fw fa-phone"></i> 0044123123</p>
        <p><i class="fa fa-fw fa-envelope"></i> ex@mail.com</p>
        <h4>We accept</h4>
        <p><i class="fa fa-fw fa-cc-amex"></i> Amex</p>
        <p><i class="fa fa-fw fa-credit-card"></i> Credit Card</p>
        <br>
        <i class="fa fa-facebook-official w3-hover-opacity w3-large"></i>
        <i class="fa fa-instagram w3-hover-opacity w3-large"></i>
        <i class="fa fa-snapchat w3-hover-opacity w3-large"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity w3-large"></i>
        <i class="fa fa-twitter w3-hover-opacity w3-large"></i>
        <i class="fa fa-linkedin w3-hover-opacity w3-large"></i>
      </div>
    </div>
      


      
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
