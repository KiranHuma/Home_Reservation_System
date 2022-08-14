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



</head>
<body>
    <form id="form1" runat="server">
       
        <div>
            <asp:Label ID="username_lbl" runat="server" Text="Label17"></asp:Label>
        </div>
    </form>
</body>
</html>
