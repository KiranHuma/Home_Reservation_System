
Imports System.Web
Imports System.Data.SqlClient
Imports Microsoft.AspNetCore.Mvc.ModelBinding
Imports System.Data
Imports System.Configuration
Public Class frmdashboard
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
    'Dim source1 As New BindingSource()
    'Dim source2 As New BindingSource()
    Dim con As New SqlClient.SqlConnection
    Dim cmd As New SqlClient.SqlCommand
    Dim dt As New DataTable
    Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"

    ' Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid1()
            Me.BindGrid2()
        End If
        username_lbl.Text = Request.QueryString("name")
        Me.Label16.Text = Format(Now, "yyyy-MM-dd")

        occupied_rooms()
        total_rooms()
        checkin_rooms()

        checkout_rooms()
    End Sub
    'room data
    Private Sub BindGrid1()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select roomnumber,roomtype,roomprice from db_roomreg where  Reservation_Status='Available'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        reservation_Grid.DataSource = dt
                        reservation_Grid.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    'customer data
    Private Sub BindGrid2()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select EntryNumber,Customer_Name,Room_Number,Room_Type from db_reservation")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        DataGridView1.DataSource = dt
                        DataGridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        reservation_Grid.PageIndex = e.NewPageIndex
        DataGridView1.PageIndex = e.NewPageIndex
        Me.BindGrid1()
        Me.BindGrid2()
    End Sub
    Private Sub total_rooms()
        Dim str As String = cs
        Dim con As SqlConnection = New SqlConnection(str)
        Dim query As String = "select COUNT(roomnumber) from db_roomreg "
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dbr As SqlDataReader
        Try
            con.Open()
            dbr = cmd.ExecuteReader()
            If dbr.Read() Then
                Label10.Text = dbr.GetValue(0)
            End If
        Catch ex As Exception
            errormessage.Text = ("Failed:Selected Value of members" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Private Sub occupied_rooms()
        Dim str As String = cs
        Dim con As SqlConnection = New SqlConnection(str)
        Dim query As String = "select COUNT(EntryNumber) from db_reservation WHERE Reservation_Status = 'Reserved'"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dbr As SqlDataReader
        Try
            con.Open()
            dbr = cmd.ExecuteReader()
            If dbr.Read() Then
                Label4.Text = dbr.GetValue(0)
            End If
        Catch ex As Exception
            errormessage.Text = ("Failed:Selected Value of members" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Private Sub checkin_rooms()
        Dim str As String = cs
        Dim con As SqlConnection = New SqlConnection(str)
        Dim query As String = "select COUNT(EntryNumber) from db_reservation  where Reservation_Status = 'Reserved' And Check_In_Date = '" & Label16.Text & "'"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dbr As SqlDataReader
        Try
            con.Open()
            dbr = cmd.ExecuteReader()
            If dbr.Read() Then
                Label11.Text = dbr.GetValue(0)

            End If

        Catch ex As Exception
            errormessage.Text = ("Failed:Selected Value of members" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Private Sub checkout_rooms()
        Dim str As String = cs
        Dim con As SqlConnection = New SqlConnection(str)
        Dim query As String = "select COUNT(Transacion_ID) from db_payment  where Status = 'CheckOut' And Check_Out_Date = '" & Label16.Text & "'"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dbr As SqlDataReader
        Try
            con.Open()
            dbr = cmd.ExecuteReader()
            If dbr.Read() Then
                Label12.Text = dbr.GetValue(0)

            End If


        Catch ex As Exception
            errormessage.Text = ("Failed:Selected Value of members" & ex.Message)
            Me.Dispose()
        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        '  Dim constr As String = ConfigurationManager.ConnectionStrings("con").ConnectionString
        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select roomnumber,roomtype,roomprice from db_roomreg where  Reservation_Status='Available' And  roomtype LIKE '%' + @roomtype + '%'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@roomtype", TextBox2.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    reservation_Grid.DataSource = dt
                    reservation_Grid.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select  EntryNumber,Customer_Name,Room_Number,Room_Type from db_reservation where Customer_Name LIKE '%' + @Customer_Name + '%'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", TextBox1.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    DataGridView1.DataSource = dt
                    DataGridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged
        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select roomnumber,roomtype,roomprice from db_roomreg where  Reservation_Status='Available' And  roomtype LIKE '%' + @roomtype + '%'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@roomtype", TextBox2.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    reservation_Grid.DataSource = dt
                    reservation_Grid.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select  EntryNumber,Customer_Name,Room_Number,Room_Type from db_reservation where Customer_Name LIKE '%' + @Customer_Name + '%'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", TextBox1.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    DataGridView1.DataSource = dt
                    DataGridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub
End Class