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
    Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"
    'Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
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
            txtboxid()
            getdata()
            search_txt_grid()
            txtboxid_reserve()
            getdata_reserve()
            getdata_roomsdetails()
        End If
    End Sub
    'insert data into database
    Private Sub insert()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = "insert into db_roomreg(roomnumber,roomtype,roomprice,roomregdate,Reservation_Status)values('" & roomnum_txt.Text & "','" & roomtype_txt.Text & "','" & roomrate_txt.Text & "','" & regdate_txt.SelectedDate & "','" & status_lbl.Text & "')"
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

        Try
            btnsave.Enabled = False
            btndel.Enabled = True
            btnupdate.Enabled = True
            roomnum_txt.Text = roomreg_Grid.SelectedRow.Cells(1).Text
            roomtype_txt.Text = roomreg_Grid.SelectedRow.Cells(2).Text
            roomrate_txt.Text = roomreg_Grid.SelectedRow.Cells(3).Text

            ' regdate_txt.Visible = False
            ' roomrdate_txt0.Visible = True


        Catch ex As Exception
            MsgBox("Failed:GridCick " & ex.Message)
            Me.Dispose()
        End Try

    End Sub

    Private Sub DeleteSelecedRows()
        Try
            dbaccessconnection()
            con.Open()
            If roomtype_txt.Text = "" Then
                MsgBox("Empty RoomType")

            Else
                cmd.CommandText = ("delete from db_roomreg where roomnumber= '" & roomnum_txt.Text & "'")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Room" & roomnum_txt.Text & "' delete successfully!"
                ' roomreg_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Deleted")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub
    Protected Sub btndel_Click(sender As Object, e As EventArgs) Handles btndel.Click
        DeleteSelecedRows()
        getdata()
    End Sub
    Private Sub RoomReg_Search()



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select roomnumber,roomtype,roomprice,roomregdate from db_roomreg where  roomnumber= '" & room_search.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@roomnumber", room_search.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    roomreg_Grid.DataSource = dt
                    roomreg_Grid.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Protected Sub SearchRoom_Click(sender As Object, e As EventArgs) Handles SearchRoom.Click
        RoomReg_Search()
    End Sub


    '''''''''Room Registration end'''''''''
    ''''''''Room Reservation Start''''''''
    Private Sub insert_reserve()

        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = "insert into db_reservation(EntryNumber,Customer_Name,Room_Number,Room_Type,Number_of_Customers,Check_In_Date,Address,Phone_Number,Price,Reservation_Status)values('" & entry_txt.Text & "','" & customer_txt.Text & "','" & customerRnumber_txt.Text & "','" & re_roomtype_txt.Text & "','" & re_customer_txt.Text & "','" & re_checkin_dte.SelectedDate & "','" & re_address_txt.Text & "','" & phonenumber_txt.Text & "','" & price_txt.Text & "','" & status_lbl.Text & "')"
            cmd.ExecuteNonQuery()
            welcomemsg.Text = "'" & customer_txt.Text & "' saved successfully!"
            welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
            con.Close()
            'getdata_reserve()
        Catch ex As Exception
            MsgBox("Data Inserted Failed because " & ex.Message)
            Me.Dispose()
        End Try


    End Sub
    'change the status of available to reserved
    Private Sub update_reserve_status()
        con.Close()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = ("UPDATE db_roomreg SET Reservation_Status= 'Reserved'  where roomnumber=" & customerRnumber_txt.Text & "")
            cmd.ExecuteNonQuery()
            ' MessageBox.Show("Status Updated")
            con.Close()
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
        End Try
    End Sub
    'for Cancellation of Reservation and set it to available
    Private Sub update_Cancell_status()
        con.Close()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = ("UPDATE db_roomreg SET Reservation_Status= 'Available'  where roomnumber=" & customerRnumber_txt.Text & "")
            cmd.ExecuteNonQuery()
            ' MessageBox.Show("Status Updated")
            con.Close()
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
        End Try
    End Sub
    'for Cancellation of Reservation 
    Private Sub update_Cancellreserved_status()
        con.Close()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = ("UPDATE db_reservation SET Reservation_Status= 'Cancell'  where EntryNumber=" & entry_txt.Text & "")
            cmd.ExecuteNonQuery()
            ' MessageBox.Show("Status Updated")
            con.Close()
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
        End Try
    End Sub
    Private Sub delete_Cancellreserved_status()
        con.Close()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = ("UPDATE db_reservation SET Reservation_Status= 'Available'  where EntryNumber=" & entry_txt.Text & "")
            cmd.ExecuteNonQuery()
            ' MessageBox.Show("Status Updated")
            con.Close()
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
        End Try
    End Sub
    'autoincrement of entry number of reservation
    Private Sub txtboxid_reserve()
        Try
            dbaccessconnection()
            con.Open()
            Dim num As New Integer
            cmd.CommandText = "SELECT MAX(EntryNumber) FROM db_reservation "
            If (IsDBNull(cmd.ExecuteScalar)) Then
                num = 1
                entry_txt.Text = num.ToString
            Else

                num = cmd.ExecuteScalar + 1
                entry_txt.Text = num.ToString
            End If
            con.Close()
        Catch ex As Exception
            MsgBox("Failed:Autoincrement of Entrynumber" & ex.Message)
            Me.Dispose()
        End Try

    End Sub
    'Show data of availabe rooms in grid
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

    'edit of reservation function
    Private Sub edit_reserve()
        Try
            dbaccessconnection()
            con.Open()
            If customer_txt.Text = "" Then
                MsgBox("Empty Customer Name")

            Else
                cmd.CommandText = ("UPDATE db_reservation SET EntryNumber='" & entry_txt.Text & "', Customer_Name='" & customer_txt.Text & "', Room_Number='" & customerRnumber_txt.Text & "',Room_Type= '" & re_roomtype_txt.Text & "',Number_of_Customers= '" & re_customer_txt.Text & "',Check_In_Date= '" & re_checkin_dte.SelectedDate & "',Address= '" & re_address_txt.Text & "',Phone_Number= '" & phonenumber_txt.Text & "',Price= '" & price_txt.Text & "' where EntryNumber=" & entry_txt.Text & "")

                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'" & customer_txt.Text & "' update successfully!"
                '  roomreg_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub
    Protected Sub btnupdate_rserv_Click(sender As Object, e As EventArgs) Handles btnupdate_rserv.Click
        MultiView1.SetActiveView(View3)
        edit_reserve()
        getdata_reserve()
        getdata_roomsdetails()
    End Sub

    Protected Sub reservedgrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles reservedgrid.SelectedIndexChanged







        Try
            ' re_checkin_dte.Visible = False
            '  roomredate_txt1.Visible = True
            btnsave_reser.Enabled = False
            btndelete_rserve.Enabled = True
            btnupdate_rserv.Enabled = True
            Button1.Enabled = True

       
            Me.entry_txt.Text = reservedgrid.SelectedRow.Cells(1).Text
            Me.customer_txt.Text = reservedgrid.SelectedRow.Cells(2).Text
            Me.customerRnumber_txt.Text = reservedgrid.SelectedRow.Cells(3).Text
            Me.re_roomtype_txt.Text = reservedgrid.SelectedRow.Cells(4).Text
            Me.re_customer_txt.Text = reservedgrid.SelectedRow.Cells(5).Text
            Me.re_checkin_dte.SelectedDate = reservedgrid.SelectedRow.Cells(6).Text
            Me.re_address_txt.Text = reservedgrid.SelectedRow.Cells(7).Text
            Me.phonenumber_txt.Text = reservedgrid.SelectedRow.Cells(8).Text
            Me.price_txt.Text = reservedgrid.SelectedRow.Cells(9).Text
            Label22.Text = reservedgrid.SelectedRow.Cells(1).Text



            MultiView1.SetActiveView(View2)

            Catch ex As Exception
            MsgBox("Failed:GridCick " & ex.Message)
            Me.Dispose()
            End Try




    End Sub
    'Tab 3 contains the data of customer who reserved the room with some rooms details.
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
    Private Sub addnew_reservation()



        Response.Redirect("frmroomsData.aspx")
    End Sub

    Protected Sub btnadd_res_Click(sender As Object, e As EventArgs) Handles btnadd_res.Click
        btnsave_reser.Enabled = True
        addnew_reservation()
        getdata_reserve()
        getdata_roomsdetails()
    End Sub

    Private Sub DeleteSelecedRows_reserve()

        Try
            dbaccessconnection()
            con.Open()
            If roomtype_txt.Text = "Label" Then
                MsgBox("Select Row")

            Else
                cmd.CommandText = ("delete from db_reservation where EntryNumber= '" & Label22.Text & "'")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Room Reservation" & roomnum_txt.Text & "' delete successfully!"
                ' roomreg_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Deleted")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub

    Protected Sub btndelete_rserve_Click(sender As Object, e As EventArgs) Handles btndelete_rserve.Click
        MultiView1.SetActiveView(View3)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        update_Cancell_status()
        update_Cancellreserved_status()
        getdata_reserve()
        getdata_roomsdetails()
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        ' Label22.Text = "Label"
        update_Cancell_status()
        DeleteSelecedRows_reserve()
        getdata_roomsdetails()
    End Sub

    Private Sub search_txt()
        Dim str As String
        Try
            con.Open()
            str = "Select * from db_reservation where Customer_Name like '" & TextBox3.Text & "%'"
            cmd = New SqlCommand(str, con)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "db_reservation")
            con.Close()
            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "db_reservation"
            DataGridView1.Visible = True
        Catch ex As Exception

            MsgBox("Customer Name Search")
            Me.Dispose()
        End Try
    End Sub


    Protected Sub reservation_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles reservation_Grid.SelectedIndexChanged
        customerRnumber_txt.Enabled = True
        btnsave.Enabled = False
        btndel.Enabled = True
        btnupdate.Enabled = True

        customerRnumber_txt.Text = reservation_Grid.SelectedRow.Cells(1).Text
        re_roomtype_txt.Text = reservation_Grid.SelectedRow.Cells(2).Text
        price_txt.Text = reservation_Grid.SelectedRow.Cells(3).Text
    End Sub

    Protected Sub btnsave_reser_Click(sender As Object, e As EventArgs) Handles btnsave_reser.Click
        If customerRnumber_txt.Text = String.Empty Then
            MsgBox("Select Available Room from List")
        Else
            status_lbl.Text = "Reserved"
            insert_reserve()
            update_reserve_status()
            getdata_reserve()
            getdata_roomsdetails()
            addnew_reservation()
        End If
    End Sub

    Protected Sub view3btn2_Click(sender As Object, e As EventArgs) Handles view3btn2.Click

    End Sub
    Private Sub RoomReg_forreservation_Search()



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select roomnumber,roomtype,roomprice,Reservation_Status,roomregdate from db_roomreg where  roomnumber= '" & room_search0.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@roomnumber", room_search0.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    reservation_Grid.DataSource = dt
                    reservation_Grid.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Protected Sub SearchRoom0_Click(sender As Object, e As EventArgs) Handles SearchRoom0.Click
        RoomReg_forreservation_Search()
    End Sub
    Private Sub Room_Reserved_Search()



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_reservation where  Reservation_Status='Reserved' AND  Customer_Name= '" & room_search1.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", room_search1.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    reservedgrid.DataSource = dt
                    reservedgrid.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Private Sub All_room_Search()



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_reservation where  Customer_Name= '" & TextBox3.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", TextBox3.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    DataGridView1.DataSource = dt
                    DataGridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Protected Sub SearchRoom1_Click(sender As Object, e As EventArgs) Handles SearchRoom1.Click
        Room_Reserved_Search()
    End Sub

    Protected Sub SearchRoom2_Click(sender As Object, e As EventArgs) Handles SearchRoom2.Click
        All_room_Search()
    End Sub

    Protected Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

    End Sub


    ''''''Room Reservation end'''''''''
End Class