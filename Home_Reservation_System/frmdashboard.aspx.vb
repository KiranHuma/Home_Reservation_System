
Imports System.Web
Public Class frmdashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        username_lbl.Text = Request.QueryString("name")


    End Sub

End Class