Imports System.Data.SqlClient   'FOR SQL CONNECTION AND COMMAND.
Public Class FrmCheckin_out
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


    'Dim cs As String = "Data Source=ANIRUDH;Initial Catalog=db_hmsystem;Integrated Security=True"
    'Database Connection
    Private Sub dbaccessconnection()
        Try
            con.ConnectionString = cs
            cmd.Connection = con
        Catch ex As Exception
            Label22.Text = "DataBase not connected due to the reason because " & ex.Message
            Me.Dispose()
        End Try
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dbaccessconnection()


        If Not Me.IsPostBack Then
            customer_checkindata()
            customer_checkoutdata()
        End If
    End Sub
    Private Sub customer_checkindata()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select * from db_reservation")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        payment_Gridd.DataSource = dt
                        payment_Gridd.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    'search get checkin data in checkOUTTAB(GRIDVIEW)
    Private Sub customer_checkoutdata()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select * from db_payment")
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
        payment_Gridd.PageIndex = e.NewPageIndex
        DataGridView1.PageIndex = e.NewPageIndex
        Me.checkout_searchdate()
        Me.customer_checkindata()
        Me.checkin_searchdate()
        Me.customer_checkoutdata()
    End Sub
    'filter the checkout data of customer  by date 
    Private Sub checkout_searchdate()
        con.Close()


        Dim dfrom As DateTime = DateTimePicker2.SelectedDate
        Dim dto As DateTime = DateTimePicker1.SelectedDate



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_payment where Check_Out_Date >= '" & Format(dfrom, "MM-dd-yyyy") & "' and Check_Out_Date <='" & Format(dto, "MM-dd-yyyy") & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Check_Out_Date", DateTimePicker2.SelectedDate)
                cmd.Parameters.AddWithValue("@Check_Out_Datee", DateTimePicker1.SelectedDate)
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    DataGridView1.DataSource = dt
                    DataGridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub



    'filter the checkin data of customer  by date 
    Private Sub checkin_searchdate()
        con.Close()



        Dim dfrom As DateTime = trandtefrom_txt.SelectedDate
        Dim dto As DateTime = trandteto_txt.SelectedDate


        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_reservation where Check_In_Date >= '" & Format(dfrom, "MM-dd-yyyy") & "' and Check_In_Date <='" & Format(dto, "MM-dd-yyyy") & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Check_In_Date", trandtefrom_txt.SelectedDate)
                cmd.Parameters.AddWithValue("@Check_In_Datee", trandteto_txt.SelectedDate)
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    payment_Gridd.DataSource = dt
                    payment_Gridd.DataBind()
                End Using
            End Using
        End Using
    End Sub

    'search the customer name by textbox in checkin TAB
    Private Sub searchcustomer_checkin()


        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_reservation where Customer_Name like '" & TextBox1.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", TextBox1.Text.Trim())
                Dim dt As New DataTable()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    payment_Gridd.DataSource = dt
                    payment_Gridd.DataBind()
                End Using
            End Using
        End Using

    End Sub

    'search the customer name by textbox in checkout TAB
    Private Sub searchcustomer_checkout()



        Using con As New SqlConnection(cs)

            Using cmd As New SqlCommand()
                cmd.CommandText = ("Select * from db_payment where Customer_Name like '" & TextBox2.Text & "'")
                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Customer_Name", TextBox2.Text.Trim())
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
        searchcustomer_checkout()
    End Sub

    Protected Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        checkout_searchdate()
        RadioButton1.Checked = False
    End Sub

    Protected Sub transactioncheck_CheckedChanged(sender As Object, e As EventArgs) Handles transactioncheck.CheckedChanged
        checkin_searchdate()
        transactioncheck.Checked = False
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        searchcustomer_checkin()
    End Sub
End Class