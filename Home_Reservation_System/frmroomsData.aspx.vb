Imports System.Web
Imports System.Data.SqlClient
Imports Microsoft.AspNetCore.Mvc.ModelBinding
Imports System.Data
Imports System.Configuration
Public Class frmroomsData
    Inherits System.Web.UI.Page
    Dim rdr As SqlDataReader
    Dim qry As String
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
    ' Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"
    Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
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

            getdata()
            getdata_reserve()
            getdata_roomsdetails()
            search_txt_grid()
        End If
    End Sub
    'insert data into database
    Private Sub insert()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = "insert into db_roomreg(roomnumber,roomtype,roomprice,roomregdate,Reservation_Status)values('" & roomnum_txt.Text & "','" & roomtype_txt.Text & "','" & roomrate_txt.Text & "','" & regdate_txt.TodaysDate.ToString("yyyy-MM-dd") & "','" & status_lbl.Text & "')"
            cmd.ExecuteNonQuery()
            welcomemsg.Text = "'Room" & roomnum_txt.Text & "' saved successfully!"
            welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
            con.Close()

            getdata()
        Catch ex As Exception
            MsgBox("Failed:Selected Value of members" & ex.Message)


            'Response.Redirect("frmroomsData.aspx")
            Me.Dispose()
        End Try
    End Sub

    'room get data

    Private Sub getdata()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select roomnumber,roomtype,roomprice,roomregdate from db_roomreg")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        roomreg_Grid.DataSource = dt
                        roomreg_Grid.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    'room get available rooms

    Private Sub getdata_reserve()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select * from db_roomreg where Reservation_Status='Available'")
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
    'room get reserved rooms

    Private Sub getdata_roomsdetails()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select * from db_reservation where  Reservation_Status='Reserved'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        reservedgrid.DataSource = dt
                        reservedgrid.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    'get all reservation data
    Private Sub search_txt_grid()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select * from db_reservation")
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
        roomreg_Grid.PageIndex = e.NewPageIndex
        reservation_Grid.PageIndex = e.NewPageIndex
        reservedgrid.PageIndex = e.NewPageIndex
        DataGridView1.PageIndex = e.NewPageIndex
        Me.getdata()
        Me.getdata_reserve()
        Me.getdata_roomsdetails()
        Me.search_txt_grid()
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        insert()
        getdata_reserve()
        getdata_roomsdetails()
    End Sub
    'this function will autoincrement the rommnumber
    Private Sub txtboxid()
        Try
            dbaccessconnection()
            con.Open()
            Dim num As New Integer
            cmd.CommandText = "SELECT MAX(roomnumber) FROM db_roomreg "
            If (IsDBNull(cmd.ExecuteScalar)) Then
                num = 1
                roomnum_txt.Text = num.ToString
            Else

                num = cmd.ExecuteScalar + 1
                roomnum_txt.Text = num.ToString
            End If
            con.Close()
        Catch ex As Exception
            MsgBox("Failed:Autoincrement of Room Number Entry" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    Private Sub fun_addnew()
        txtboxid()
        getdata()
        status_lbl.Text = "Available"
        roomtype_txt.Text = ""
        roomrate_txt.Text = ""
        roomtype_txt.Enabled = True
        roomrate_txt.Enabled = True
        btnsave.Enabled = True

        btndel.Enabled = False
        btnupdate.Enabled = False
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click


        fun_addnew()
        welcomemsg.Text = ""
    End Sub
    Private Sub edit()
        Try
            dbaccessconnection()
            con.Open()
            If roomtype_txt.Text = "" Then
                MsgBox("Empty RoomType")

            Else
                cmd.CommandText = ("UPDATE db_roomreg SET  roomnumber= '" & roomnum_txt.Text & "', roomtype= '" & roomtype_txt.Text & "',roomprice= '" & roomrate_txt.Text & "',roomregdate= '" & regdate_txt.SelectedDate & "' where roomnumber=" & roomnum_txt.Text & "")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Room" & roomnum_txt.Text & "' update successfully!"
                ' roomreg_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Updated")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub
    Protected Sub btnupdate_Click(sender As Object, e As EventArgs) Handles btnupdate.Click
        edit()
        getdata()
    End Sub

    Protected Sub roomreg_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles roomreg_Grid.SelectedIndexChanged
        'roomrate_txt.Text = roomreg_Grid.Rows(0).Cells(0).Value.ToString




        '  txtid.Enabled = True
        '  roomnum_txt.Text = roomreg_Grid.Rows(e.NewEditIndex).Cells(0).Text.ToString()
        '  roomtype_txt.Text = roomreg_Grid.Rows(e.NewEditIndex).Cells(1).Text.ToString()
        '  roomrate_txt.Text = roomreg_Grid.Rows(e.NewEditIndex).Cells(2).Text.ToString()
        '  regdate_txt.SelectedDate = roomreg_Grid.Rows(e.NewEditIndex).Cells(3).Text.ToString()
        ' txtaddress.Text = GridView1.Rows(e.NewEditIndex).Cells(4).Text.ToString()

        roomnum_txt.Text = roomreg_Grid.SelectedRow.Cells(1).Text
        roomtype_txt.Text = roomreg_Grid.SelectedRow.Cells(2).Text
        roomrate_txt.Text = roomreg_Grid.SelectedRow.Cells(3).Text
        roomrdate_txt0.Text = roomreg_Grid.SelectedRow.Cells(4).Text
        regdate_txt.Visible = False
        roomrdate_txt0.Visible = True
    End Sub

    Protected Sub chk_CheckedChanged(sender As Object, e As EventArgs)


    End Sub



    Private Sub roomreg_Grid_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles roomreg_Grid.RowEditing


    End Sub
End Class