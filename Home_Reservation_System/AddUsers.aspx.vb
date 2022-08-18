Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Security.Cryptography

Public Class AddUsers
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand()
    Dim con As New SqlConnection()
    Dim str As String
    Dim com As SqlCommand
    Dim rdr As SqlDataReader
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As SqlConnection = New SqlConnection
    Dim ds As DataSet = New DataSet
    Dim da As SqlDataAdapter
    Dim tables As DataTableCollection = ds.Tables


    Dim dt As New DataTable
    Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"
    Private Sub dbaccessconnection()
        Try
            con.ConnectionString = cs
            cmd.Connection = con
        Catch ex As Exception
            MsgBox("DataBase not connected due to the reason because " & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label14.Text = Request.QueryString("idlabel")
        Uid_txt.Text = Request.QueryString("updatelbel")
        If Not Me.IsPostBack Then




            If Label14.Text = "Update" Then
                get_record_users()
                button1.Visible = True
                label7.Visible = False
                button2.Visible = False
            Else
                txtboxid()
            End If
        End If
    End Sub
    Private Sub get_record_users()
        Dim con As New SqlConnection(cs)
        Try

            Dim command As New SqlCommand("select * from Users where U_ID='" & Uid_txt.Text & "'", con)
            con.Open()
            cmd.Parameters.Clear()
            Dim read As SqlDataReader = command.ExecuteReader()

            Do While read.Read()
                ' TextBox4.Text = (read("AssetID").ToString())
                txtUsername.Text = (read("Username").ToString())
                ComboBox1.Text = (read("UserRole").ToString())
                txtName.Text = (read("Name").ToString())
                txtPass.Text = (read("Password").ToString())
                CmboGender.Text = (read("Gender").ToString())
                txtContact.Text = (read("Contact_no").ToString())
                txtEmail.Text = (read("Email").ToString())
            Loop
            read.Close()

        Catch ex As Exception

            MsgBox(ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Protected Sub button2_Click(sender As Object, e As EventArgs) Handles button2.Click
        insert()
        Response.Redirect("Default.aspx")

    End Sub
    Private Sub insert()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = "INSERT INTO Users (U_ID,UserRole,Username,Name,Password,Gender,Contact_no,Email)values
                                                 ('" & Uid_txt.Text & "','" & ComboBox1.Text & "','" & txtUsername.Text & "','" & txtName.Text & "','" & txtPass.Text & "','" & CmboGender.Text & "','" & txtContact.Text & "','" & txtEmail.Text & "')"
            cmd.ExecuteNonQuery()
            con.Close()
            ' getdata()
            MsgBox("Registration completed Successfully")
        Catch ex As Exception
            MsgBox("Data Inserted Failed because " & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Private Sub update2()
        If Label14.Text = "Update" Then
            Try

                dbaccessconnection()
                con.Open()
                cmd.CommandText = "Update Users set UserRole='" & ComboBox1.Text & "',Username='" & txtUsername.Text & "', Name='" & txtName.Text & "', Password='" & txtPass.Text & "',Gender= '" & CmboGender.Text & "',Contact_no= '" & txtContact.Text & "',Email= '" & txtEmail.Text & "'  where U_ID='" & Uid_txt.Text & "'"

                cmd.ExecuteNonQuery()
                con.Close()

                MsgBox("Update Successfully")
            Catch ex As Exception
                MsgBox("Data Inserted Failed because " & ex.Message)
                Me.Dispose()
            End Try

        End If

    End Sub
    Public Sub namecheck()

        If Label14.Text = "Update" Then
            label7.Visible = False
        Else
            Dim con As New SqlConnection(cs)
            con.Open()
            str = "select count(*)from Users where Username='" & txtUsername.Text & "'"
            com = New SqlCommand(str, con)
            Dim count As Integer = Convert.ToInt32(com.ExecuteScalar())
            con.Close()
            If count > 0 Then
                label7.Visible = True
                label7.Text = "Sorry! you can't take this username"

                label7.ForeColor = System.Drawing.Color.Red
                'label7.Text = "";
            Else
                label7.Text = ""

            End If
        End If


    End Sub
    Protected Sub button1_Click(sender As Object, e As EventArgs) Handles button1.Click
        update2()
    End Sub

    Protected Sub txtName_TextChanged(sender As Object, e As EventArgs) Handles txtName.TextChanged
        namecheck()
    End Sub

    Protected Sub txtPassAgain_TextChanged(sender As Object, e As EventArgs) Handles txtPassAgain.TextChanged
        If txtPass.Text = txtPassAgain.Text Then
            label8.Visible = True
            label8.Text = "Match"


            label8.ForeColor = System.Drawing.Color.DarkGreen
        Else
            label8.Visible = True
            label8.Text = "Not match"
            label8.ForeColor = System.Drawing.Color.Red

        End If
    End Sub
    Private Sub txtboxid()
        Try
            dbaccessconnection()
            con.Open()
            Dim num As New Integer
            cmd.CommandText = "SELECT MAX(U_ID) FROM Users "
            If (IsDBNull(cmd.ExecuteScalar)) Then
                num = 1
                Uid_txt.Text = num.ToString
            Else

                num = cmd.ExecuteScalar + 1
                Uid_txt.Text = num.ToString
            End If
            con.Close()
        Catch ex As Exception
            MsgBox("Failed:Autoincrement of Transaction ID " & ex.Message)
            Me.Dispose()
        End Try

    End Sub

    Protected Sub txtUsername_TextChanged(sender As Object, e As EventArgs) Handles txtUsername.TextChanged
        namecheck()
    End Sub
End Class