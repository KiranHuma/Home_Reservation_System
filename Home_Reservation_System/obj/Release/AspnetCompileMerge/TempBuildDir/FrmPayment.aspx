<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FrmPayment.aspx.vb" Inherits="Home_Reservation_System.FrmPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Information</title>
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
    .auto-style13 {
        width: 115px;
    }
    .auto-style14 {
        width: 157px;
    }
    .auto-style15 {
        width: 254px;
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
        
      <a href="FrmCheckin_out.aspx"  class="w3-bar-item w3-button w3-blue w3-margin-bottom"> Payment Information </a>
    
    
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
    <p class="w3-left">CheckOut and Payment</p>
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
            <h2>Payment Management</h2>
            <hr />
             <div>


                 <table class="center">
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label31" runat="server" Text="Transaction #"></asp:Label>
                         </td>
                         <td style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="transactionid_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0"></asp:TextBox>

                         </td>
                 
                         <td class="auto-style13" style="text-align: right;">
                             <asp:Label ID="Label12" runat="server" Text="Customer Name"></asp:Label>

                         </td>
                         <td  style="text-align: left;" class="auto-style13">
                             <asp:DropDownList ID="Cname_txt" runat="server" Width="247px" AutoPostBack="True" DataTextField="Customer_Name" DataValueField="EntryNumber" OnSelectedIndexChanged="customer_SelectedIndexChanged"></asp:DropDownList>
                             </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label14" runat="server" Text="Room Number"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="customerRnumber_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0"></asp:TextBox>

                         </td>
                        
                         <td class="auto-style13" style="text-align: right;">
                             <asp:Label ID="Label10" runat="server" Text="Room Type"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style13"> 
                                                          <asp:TextBox ID="re_roomtype_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False"></asp:TextBox>

                         
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label9" runat="server" Text="No. of Customer"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="re_customer_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0"></asp:TextBox>

                         </td>
                        
                        
                     </tr>
                     <tr>
                         <td style="text-align: right;">
                             
                         <asp:Label ID="Label13" runat="server" Text="Check In Date"></asp:Label>
                         </td>
                          <td  style="text-align: left;" class="auto-style15">
                             
                              <asp:Calendar ID="re_checkin_dte" runat="server"></asp:Calendar>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label15" runat="server" Text="Address"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="re_address_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Height="56px" Enabled="False"></asp:TextBox>

                         </td>
                         
                         <td class="auto-style13" style="text-align: right;">
                             <asp:Label ID="Label16" runat="server" Text="Phone Number"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style13"> 
                             <asp:TextBox ID="phonenumber_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False"></asp:TextBox>

                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label17" runat="server" Text="Price"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="price_txt" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False">0</asp:TextBox>

                         </td>
                        
                      
                     </tr>
                     <tr>
                         <td style="text-align: right;">
                             
                         <asp:Label ID="Label6" runat="server" Text="Transaction Date"></asp:Label>
                         </td>
                          <td  style="text-align: left;" class="auto-style15">
                             
                              <asp:Calendar ID="transactiondte_txt" runat="server"></asp:Calendar>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label2" runat="server" Text="Service Name"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:DropDownList ID="ComboBox1" runat="server" Width="247px" AutoPostBack="True" OnSelectedIndexChanged="ComboBox1_SelectedIndexChanged">
                             </asp:DropDownList>

                         </td>
                         
                         <td class="auto-style13" style="text-align: right;">
                             <asp:Label ID="Label1" runat="server" Text="Service Price"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style13"> 
                             <asp:TextBox ID="TextBox1" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False">0</asp:TextBox>

                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label36" runat="server" Text="Services Details"></asp:Label>
                         </td>
                         <td>
                                <asp:TextBox ID="RichTextBox2" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Height="120px" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label11" runat="server" Text="Total Service Prices"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="TextBox5" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False">0</asp:TextBox>
                              <br />
                             <asp:Button ID="Button1" runat="server" Text="Calculate" ToolTip="Press the button to calculate the services total" />
                            
                         </td>
                         
                         <td class="auto-style13">
                             <br />
                            </td>
                         <td  style="text-align: left;" class="auto-style13"> 
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>

                             <asp:Button ID="Button2" runat="server" Text="Total " ToolTip=" Total Service and room charges"/>

                         </td>
                         <td>

                             <asp:TextBox ID="TextBox6" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False">0</asp:TextBox>

                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style14" style="text-align: right;">
                             <asp:Label ID="Label3" runat="server" Text="Discount"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="TextBox2" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0">0</asp:TextBox>

                         </td>
                         <td style="text-align: right;">
                             &nbsp;</td>
                         <td class="auto-style13"  style="text-align: left;">
                             &nbsp;</td>
                         <td> 
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td style="text-align: right;">
                             <asp:Label ID="Label4" runat="server" Text="Total Bill"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15">
                             <asp:TextBox ID="TextBox3" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Enabled="False">0</asp:TextBox>

                         </td>
                         <td>

                             <asp:Button ID="Button3" runat="server" Text="Total Bill" />

                         </td>
                         <td>
                             <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td style="text-align: right;" >
                           
                             <asp:Label ID="Label18" runat="server" Text="CheckOut" Visible="False"></asp:Label>
                         </td>
                         <td  style="text-align: left;" class="auto-style15"> 
                             <asp:TextBox ID="TextBox7" runat="server" Width="247px" CssClass="auto-style7" AutoPostBack="True" style="margin-left: 0" Visible="False"></asp:TextBox>

                         </td>
                       
                        
                         <td>

                             <asp:Label ID="Label7" runat="server" Text="sssssss" Visible="False"></asp:Label>
                             <asp:Label ID="Label5" runat="server" Text="sssssss" Visible="False"></asp:Label>

                         </td>
                     </tr>
                  <tr>

                  
                      <td>
                                                                                                                   
                            
                      </td>
                  </tr>
                 </table>
                 <table class="center">
                     <tr>
                         <td style="text-align: left;">
                              <asp:Button ID="btnadd" runat="server" Text="Add New" BorderStyle="None" CssClass="w3-button w3-light-green" />
                                    <asp:Button ID="btnsave" runat="server" Text="CheckOut" BorderStyle="None" CssClass="w3-button w3-green"/>
                                      <asp:Button ID="btnupdate" runat="server" Text="Update" BorderStyle="None" CssClass="w3-button w3-brown" Enabled="False" ToolTip="Select the field from Grid to Edit"/>
                                    <asp:Button ID="btndel" runat="server" Text="Delete" BorderStyle="None" CssClass="w3-button w3-red " Enabled="False" ToolTip="Select the rows from Grid to delete"/>
                         </td>
                     </tr>
                 </table>
                 <br />
                 <br />
                 <asp:Label ID="Label8" runat="server" Text="Search Customer"></asp:Label>
                 <br />
                 <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True" Width="309px" ToolTip="Search by Customer Name"></asp:TextBox>
                 <br />
                 <br />
                 <asp:GridView ID="payment_Grid" runat="server" align="center" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateSelectButton="True">
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
