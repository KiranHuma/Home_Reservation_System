Imports System.Data
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data.DataTable
Imports System.Data.SqlClient
Public Class Frmlogin

    Inherits System.Web.UI.Page
    'Private bitmap As Bitmap 'for print grid
    Dim rdr As SqlDataReader
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As SqlConnection = New SqlConnection
    Dim ds As DataSet = New DataSet
    Dim da As SqlDataAdapter
    Dim tables As DataTableCollection = ds.Tables
    ' Dim source1 As New BindingSource()
    'Dim source2 As New BindingSource()
    Dim con As New SqlClient.SqlConnection
    Dim cmd As New SqlClient.SqlCommand
    Dim dt As New DataTable
    Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"

    'Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
    'Database Connection 
    Private Sub dbaccessconnection()
        Try
            con.ConnectionString = cs
            cmd.Connection = con

        Catch ex As Exception
            MsgBox("DataBase not connected due to the reason because " & ex.Message)
            Me.Dispose()
        End Try
    End Sub

    Protected Sub loginBtn_Click(sender As Object, e As EventArgs) Handles loginBtn.Click
        If selectUser.Text = "User" Then

            Dim con As New SqlConnection(cs) ' making connection
            Dim sda As New SqlDataAdapter("SELECT COUNT(*) FROM Users WHERE Username='" & txtUsername.Text & "' AND Password='" & txtPass.Text & "' AND UserRole='user'", con)
            ' in above line the program is selecting the whole data from table and the matching it with the user name and password provided by user. 
            Dim dt As New DataTable() 'this is creating a virtual table
            sda.Fill(dt)
            If dt.Rows(0)(0).ToString() = "1" Then
                'Me.Close()
                label6.Visible = True
                label6.Text = "User Login succesfully"
                ' frmdashboard.username_lbl.Text = Me.txtUsername.Text
                ' frmdashboard.Show()
                'Me.Close()

                ' 
                Dim url As String
                url = "frmdashboard.aspx?name=" & txtUsername.Text
                Response.Redirect(url)

                ' Response.Redirect("frmdashboard.aspx?name='" + txtUsername.Text + "' ")
            Else
                ' MessageBox.Show("Invalid username or password")
                label6.Visible = True
                label6.Text = " Not succsessfully login ,Try Again"
                Response.Redirect("Default.aspx")
            End If
        ElseIf selectUser.Text = "Admin" Then
            Dim con As New SqlConnection(cs) ' making connection
            Dim sda As New SqlDataAdapter("SELECT COUNT(*) FROM Users WHERE Username='" & txtUsername.Text & "' AND UserRole='admin'", con)
            ' in above line the program is selecting the whole data from table and the matching it with the user name and password provided by user. 
            Dim dt As New DataTable() 'this is creating a virtual table
            sda.Fill(dt)
            If dt.Rows(0)(0).ToString() = "1" Then


                '  AdminPanel.Show()
                label6.Visible = True
                label6.Text = "Admin Login succesfully"
                Response.Redirect("AdminPanel.aspx")
            Else
                ' MessageBox.Show("Your username Or password is not match", "Input Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                'label6.ForeColor = Color.Red
                label6.Visible = True
                label6.Text = " Not succsessfully login "
                Response.Redirect("Default.aspx")
            End If
        Else
            ' MessageBox.Show("Select your choice", "ADMIN or USER", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub txtUsername_TextChanged(sender As Object, e As EventArgs) Handles txtUsername.TextChanged

    End Sub

    Protected Sub selectUser_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selectUser.SelectedIndexChanged

    End Sub

    Protected Sub txtPass_TextChanged(sender As Object, e As EventArgs) Handles txtPass.TextChanged

    End Sub
End Class