Imports System.Data.SqlClient   'FOR SQL CONNECTION AND COMMAND.
Public Class FrmPayment
    Inherits System.Web.UI.Page

    Dim rdr As SqlDataReader
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As SqlConnection = New SqlConnection
    Dim ds As DataSet = New DataSet
    Dim da As SqlDataAdapter
    Dim tables As DataTableCollection = ds.Tables

    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim dt As New DataTable
    Dim cs As String = "Data Source=SQL8004.site4now.net;Initial Catalog=db_a8b904_dbhmsystem;User Id=db_a8b904_dbhmsystem_admin;Password=Bitlock12"
    '  Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
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
    'insert data into database
    Private Sub insert()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = "insert into db_payment(Transacion_ID,Customer_Name,Room_Number,Room_Type,Number_of_Customers,Check_In_Date,Address,Phone_Number,Price,Check_Out_Date,Service_Details,Total_Service_Rate,Status,Discount,Total_Bill)values('" & transactionid_txt.Text & "','" & Cname_txt.SelectedItem.Text & "','" & customerRnumber_txt.Text & "','" & re_roomtype_txt.Text & "','" & re_customer_txt.Text & "','" & re_checkin_dte.SelectedDate & "','" & re_address_txt.Text & "','" & phonenumber_txt.Text & "','" & price_txt.Text & "','" & transactiondte_txt.SelectedDate & "','" & RichTextBox2.Text & "','" & TextBox5.Text & "','" & Label18.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "')"
            cmd.ExecuteNonQuery()
            welcomemsg.Text = "'Payment" & transactionid_txt.Text & "' saved successfully!"
            welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
            con.Close()
            getdata()
        Catch ex As Exception
            MsgBox("Data Inserted Failed because " & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    'this function will autoincrement the TransactionID
    Private Sub txtboxid()
        Try
            dbaccessconnection()
            con.Open()
            Dim num As New Integer
            cmd.CommandText = "SELECT MAX(Transacion_ID) FROM db_payment "
            If (IsDBNull(cmd.ExecuteScalar)) Then
                num = 1
                transactionid_txt.Text = num.ToString
            Else

                num = cmd.ExecuteScalar + 1
                transactionid_txt.Text = num.ToString
            End If
            con.Close()
        Catch ex As Exception
            MsgBox("Failed:Autoincrement of Transaction ID " & ex.Message)
            Me.Dispose()
        End Try

    End Sub
    'edit function
    Private Sub edit()
        Try
            dbaccessconnection()
            con.Open()
            If Cname_txt.SelectedItem.Text = "" Then
                MsgBox("Empty Service Name")

            Else
                'Transacion_ID,Customer_Name,Room_Number,Room_Type,Number_of_Customers,Check_In_Date,Address,Phone_Number,Price,Check_Out_Date,Service_Details,Total_Service_Rate,Status,Discount,Total_Bill
                cmd.CommandText = ("UPDATE db_payment SET  Transacion_ID= '" & transactionid_txt.Text & "', Check_Out_Date= '" & transactiondte_txt.SelectedDate & "',Service_Details= '" & RichTextBox2.Text & "',Total_Service_Rate= '" & TextBox5.Text & "',Status= '" & Label18.Text & "',Discount= '" & TextBox2.Text & "',Total_Bill= '" & TextBox3.Text & "' where Transacion_ID=" & transactionid_txt.Text & "")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'" & transactionid_txt.Text & "' update successfully!"
                ' payment_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Updated")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub
    'Delete function
    Private Sub DeleteSelecedRows()


        Try
            dbaccessconnection()
            con.Open()
            If transactionid_txt.Text = "" Then
                MsgBox("Select the value from Grid")

            Else
                cmd.CommandText = ("delete from db_payment where Transacion_ID= '" & transactionid_txt.Text & "'")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Room" & transactionid_txt.Text & "' delete successfully!"
                ' roomreg_Grid.Refresh()

                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Deleted")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try


    End Sub
    'Show data of payments in grid

    Private Sub getdata()
        Try
            Using con As New SqlConnection(cs)
                Using cmd As New SqlCommand("Select * from db_payment")
                    Using sda As New SqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using dt As New DataTable()
                            sda.Fill(dt)
                            payment_Grid.DataSource = dt
                            payment_Grid.DataBind()
                        End Using
                    End Using
                End Using
            End Using
        Catch ex As Exception
            MsgBox("Failed:Retrieving Data" & ex.Message)
            Me.Dispose()
        End Try





    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        payment_Grid.PageIndex = e.NewPageIndex

        Me.getdata()

    End Sub

    'search the data of payments in records by textbox (GRIDVIEW)
    Private Sub search_txt()
        Try


            Using con As New SqlConnection(cs)

                Using cmd As New SqlCommand()
                    cmd.CommandText = ("Select * from db_payment where Customer_Name like '" & TextBox4.Text & "%'")
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@Customer_Name", TextBox4.Text.Trim())
                    Dim dt As New DataTable()
                    Using sda As New SqlDataAdapter(cmd)
                        sda.Fill(dt)
                        payment_Grid.DataSource = dt
                        payment_Grid.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            MsgBox("Failed: customer Name Search" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    'this function will empty the textboxes,auto increment transaction id and get updated data
    Private Sub fun_addnew()

        txtboxid()
        getdata()

        Cname_txt.Text = ""
        customerRnumber_txt.Text = ""
        re_roomtype_txt.Text = ""
        re_customer_txt.Text = ""
        re_address_txt.Text = ""
        phonenumber_txt.Text = ""
        price_txt.Text = "0"
        ComboBox1.Text = ""
        RichTextBox2.Text = ""
        TextBox1.Text = ""
        TextBox5.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        welcomemsg.Text = ""
        btnsave.Enabled = True
        btndel.Enabled = False
        btnupdate.Enabled = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dbaccessconnection()



        If Not Me.IsPostBack Then
            txtboxid()
            customer_FillCombo()
            services_FillCombo()
            getdata()
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        servRoom_pricetotal()
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        Response.Redirect("FrmPayment.aspx")
    End Sub
    'discount function
    Private Sub services_discount()
        Dim PercentageNumberResult As Double
        PercentageNumberResult = TextBox6.Text / 100 * TextBox2.Text
        TextBox7.Text = PercentageNumberResult
        Dim subtractdiscount As Double
        subtractdiscount = TextBox6.Text - TextBox7.Text
        TextBox3.Text = subtractdiscount
    End Sub
    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        insert()
        getdata()
        update_Cancell_status()
        update_reservation_status()
    End Sub

    Protected Sub btnupdate_Click(sender As Object, e As EventArgs) Handles btnupdate.Click
        edit()
        getdata()
    End Sub

    Protected Sub btndel_Click(sender As Object, e As EventArgs) Handles btndel.Click
        DeleteSelecedRows()
        getdata()
    End Sub

    Protected Sub payment_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles payment_Grid.SelectedIndexChanged
        Try
            btnsave.Enabled = False
            btndel.Enabled = True
            btnupdate.Enabled = True





            Me.transactionid_txt.Text = payment_Grid.SelectedRow.Cells(1).Text
            Me.Cname_txt.SelectedItem.Text = payment_Grid.SelectedRow.Cells(2).Text
            Me.customerRnumber_txt.Text = payment_Grid.SelectedRow.Cells(3).Text
            Me.re_roomtype_txt.Text = payment_Grid.SelectedRow.Cells(4).Text
            Me.re_customer_txt.Text = payment_Grid.SelectedRow.Cells(5).Text
            Me.re_checkin_dte.SelectedDate = payment_Grid.SelectedRow.Cells(6).Text
            Me.re_address_txt.Text = payment_Grid.SelectedRow.Cells(7).Text
            Me.phonenumber_txt.Text = payment_Grid.SelectedRow.Cells(8).Text
            Me.price_txt.Text = payment_Grid.SelectedRow.Cells(9).Text
            Me.transactiondte_txt.SelectedDate = payment_Grid.SelectedRow.Cells(10).Text
            Me.RichTextBox2.Text = payment_Grid.SelectedRow.Cells(11).Text
            Me.TextBox5.Text = payment_Grid.SelectedRow.Cells(12).Text
            Me.Label18.Text = payment_Grid.SelectedRow.Cells(13).Text
            Me.TextBox2.Text = payment_Grid.SelectedRow.Cells(14).Text
            Me.TextBox3.Text = payment_Grid.SelectedRow.Cells(15).Text
        Catch ex As Exception
            MsgBox("Failed:GridCick " & ex.Message)
            Me.Dispose()
        End Try
    End Sub

    Protected Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged
        search_txt()
    End Sub
    'fill the dropdown menu with customer name to get the customer details in respective textboxes
    Private Sub customer_FillCombo()





        If Not IsPostBack Then
            Cname_txt.Items.Add(New ListItem("--Select Customer--", ""))
            Cname_txt.AppendDataBoundItems = True

            dbaccessconnection()

            Dim strQuery As String = "select EntryNumber, Customer_Name from db_reservation"
            Dim con As New SqlConnection(cs)
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = strQuery
            cmd.Connection = con
            Try
                con.Open()
                Cname_txt.DataSource = cmd.ExecuteReader()
                Cname_txt.DataTextField = "Customer_Name"
                Cname_txt.DataValueField = "EntryNumber"
                Cname_txt.DataBind()
            Catch ex As Exception
                Throw ex
            Finally
                con.Close()
                con.Dispose()
            End Try
        End If





    End Sub

    Protected Sub customer_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        dbaccessconnection()
        Dim strQuery As String = "select * from db_reservation where" _
                           & " EntryNumber = @EntryNumber"
        Dim con As New SqlConnection(cs)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@EntryNumber", Cname_txt.SelectedItem.Value)
        cmd.CommandType = CommandType.Text
        cmd.CommandText = strQuery
        cmd.Connection = con
        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                ' Cname_txt.Text = sdr("").ToString()
                customerRnumber_txt.Text = sdr("Room_Number").ToString()



                re_roomtype_txt.Text = sdr("Room_Type").ToString
                re_customer_txt.Text = sdr("Number_of_Customers").ToString
                re_checkin_dte.SelectedDate = sdr("Check_In_Date").ToString
                re_address_txt.Text = sdr("Address").ToString
                phonenumber_txt.Text = sdr("Phone_Number").ToString
                price_txt.Text = sdr("Price").ToString
            End While
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub
    'fill the dropdown menu with services name to get the services details in respective textboxes
    Private Sub services_FillCombo()



        If Not IsPostBack Then
            ComboBox1.Items.Add(New ListItem("--Select Services--", ""))
            ComboBox1.AppendDataBoundItems = True

            dbaccessconnection()

            Dim strQuery As String = "SELECT * from db_services"
            Dim con As New SqlConnection(cs)
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = strQuery
            cmd.Connection = con
            Try
                con.Open()
                ComboBox1.DataSource = cmd.ExecuteReader()
                ComboBox1.DataTextField = "Service_Name"
                ComboBox1.DataValueField = "Service_ID"
                ComboBox1.DataBind()
            Catch ex As Exception
                Throw ex
            Finally
                con.Close()
                con.Dispose()
            End Try
        End If


    End Sub

    Protected Sub Cname_txt_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Cname_txt.SelectedIndexChanged
        Try
            Dim strsql As String = "select * from db_reservation where Customer_Name like('" + Cname_txt.SelectedItem.Text + "%')"
            Dim strcon As String = cs
            Dim odapre As New SqlDataAdapter(strsql, strcon)
            Dim datTable As New DataTable
            Dim incount As Integer
            odapre.Fill(datTable)
            For incount = 0 To datTable.Rows.Count - 1
                customerRnumber_txt.Text = datTable.Rows(incount)("Room_Number").ToString
                re_roomtype_txt.Text = datTable.Rows(incount)("Room_Type").ToString
                re_customer_txt.Text = datTable.Rows(incount)("Number_of_Customers").ToString
                re_checkin_dte.SelectedDate = datTable.Rows(incount)("Check_In_Date").ToString
                re_address_txt.Text = datTable.Rows(incount)("Address").ToString
                phonenumber_txt.Text = datTable.Rows(incount)("Phone_Number").ToString
                price_txt.Text = datTable.Rows(incount)("Price").ToString

            Next
        Catch ex As Exception


            MsgBox("Failed: Populating" & ex.Message)
            Me.Dispose()
        End Try
    End Sub

    Protected Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged



        dbaccessconnection()
        Dim strQuery As String = "select Service_Name,Service_Rate from db_services where" _
                           & " Service_ID = @Service_ID"
        Dim con As New SqlConnection(cs)
        Dim cmd As New SqlCommand()
        cmd.Parameters.AddWithValue("@Service_ID", ComboBox1.SelectedItem.Value)
        cmd.CommandType = CommandType.Text
        cmd.CommandText = strQuery
        cmd.Connection = con
        Try
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                ' Cname_txt.Text = sdr("").ToString()
                TextBox1.Text = sdr("Service_Rate").ToString()

            End While
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        p_nameadd()
        s_pricetotal()
    End Sub
    Private Sub p_nameadd()
        RichTextBox2.Text &= "Name" & ":" & ComboBox1.SelectedItem.Text & "," & "Price" & ":" + TextBox1.Text & vbNewLine
    End Sub
    'calculate the total price of services
    Private Sub s_pricetotal()
        Dim addd As Double
        addd = Double.Parse(TextBox1.Text) + Double.Parse(TextBox5.Text)
        TextBox5.Text = Convert.ToString(addd)
    End Sub
    'calculate the total of room and services charges
    Private Sub servRoom_pricetotal()
        Dim addd As Double
        addd = Double.Parse(price_txt.Text) + Double.Parse(TextBox5.Text)
        TextBox6.Text = Convert.ToString(addd)
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        services_discount()
    End Sub
    'it make the room available after checkout
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
    'it will change the reserved status in reservation table to CHECKOUT
    Private Sub update_reservation_status()
        con.Close()
        Try
            dbaccessconnection()
            con.Open()
            cmd.CommandText = ("UPDATE db_reservation SET Reservation_Status= 'CheckOut'  where Room_Number=" & customerRnumber_txt.Text & "")
            cmd.ExecuteNonQuery()
            ' MessageBox.Show("Status Updated")
            con.Close()
        Catch ex As Exception
            MsgBox("Data Not Updated" & ex.Message)
        End Try
    End Sub

    Protected Sub TextBox5_TextChanged(sender As Object, e As EventArgs) Handles TextBox5.TextChanged

    End Sub
End Class