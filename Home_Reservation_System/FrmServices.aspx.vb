Imports System.Data.SqlClient   'FOR SQL CONNECTION AND COMMAND.
Public Class FrmServices
    Inherits System.Web.UI.Page

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
            cmd.CommandText = "insert into db_services(Service_ID,Service_Name,Service_Rate,Service_Reg_Date)values('" & service_txt.Text & "','" & serviceName_txt.Text & "','" & serviceRate_txt.Text & "','" & serviceDate_txt.SelectedDate & "')"
            cmd.ExecuteNonQuery()
            welcomemsg.Text = "'Service" & service_txt.Text & "' saved successfully!"
            welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
            con.Close()
            MsgBox("Data Save succesfully")
            getdata()
        Catch ex As Exception
            MsgBox("Data Inserted Failed because " & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    'this function will autoincrement the ServiceID
    Private Sub txtboxid()
        Try
            dbaccessconnection()
            con.Open()
            Dim num As New Integer
            cmd.CommandText = "SELECT MAX(Service_ID) FROM db_services "
            If (IsDBNull(cmd.ExecuteScalar)) Then
                num = 1
                service_txt.Text = num.ToString
            Else

                num = cmd.ExecuteScalar + 1
                service_txt.Text = num.ToString
            End If
            con.Close()
        Catch ex As Exception
            MsgBox("Failed:Autoincrement of Service ID Entry" & ex.Message)
            Me.Dispose()
        End Try

    End Sub
    'edit function
    Private Sub edit()
        Try
            dbaccessconnection()
            con.Open()
            If serviceName_txt.Text = "" Then
                MsgBox("Empty Service Name")

            Else
                cmd.CommandText = ("UPDATE db_services SET  Service_ID= '" & service_txt.Text & "', Service_Name= '" & serviceName_txt.Text & "',Service_Rate= '" & serviceRate_txt.Text & "',Service_Reg_Date= '" & serviceDate_txt.SelectedDate & "' where Service_ID=" & service_txt.Text & "")
                cmd.ExecuteNonQuery()
                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Service" & serviceName_txt.Text & "' update successfully!"
                ' servicereg_Grid.Refresh()
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
            If service_txt.Text = "" Then
                MsgBox("Select the value from Grid")

            Else
                cmd.CommandText = ("delete from db_services where Service_ID= '" & service_txt.Text & "'")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Service" & service_txt.Text & "' delete successfully!"
                ' roomreg_Grid.Refresh()

                con.Close()
            End If
        Catch ex As Exception
            MsgBox("Data Not Deleted")
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub
    'Show data of services in grid
    Private Sub getdata()





        Try
                Using con As New SqlConnection(cs)
                    Using cmd As New SqlCommand("Select * from db_services")
                        Using sda As New SqlDataAdapter()
                            cmd.Connection = con
                            sda.SelectCommand = cmd
                            Using dt As New DataTable()
                                sda.Fill(dt)
                                servicereg_Grid.DataSource = dt
                                servicereg_Grid.DataBind()
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
        servicereg_Grid.PageIndex = e.NewPageIndex

        Me.getdata()

    End Sub
    'search service name textbox
    Private Sub search_txt()


        Try


            Using con As New SqlConnection(cs)

                Using cmd As New SqlCommand()
                    cmd.CommandText = ("Select * from db_services where Service_Name like '" & TextBox1.Text & "%'")
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@Service_Name", TextBox1.Text)
                    Dim dt As New DataTable()
                    Using sda As New SqlDataAdapter(cmd)
                        sda.Fill(dt)
                        servicereg_Grid.DataSource = dt
                        servicereg_Grid.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            MsgBox("Failed: Service Name Search" & ex.Message)
            Me.Dispose()
        End Try
    End Sub
    'this function will empty the textboxes,auto increment service id and get updated data
    Private Sub fun_addnew()
        Response.Redirect("FrmServices.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dbaccessconnection()



        If Not Me.IsPostBack Then
            txtboxid()
            getdata()
        End If
    End Sub

    Protected Sub btndel_Click(sender As Object, e As EventArgs) Handles btndel.Click
        DeleteSelecedRows()
        getdata()
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        fun_addnew()
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        insert()
        getdata()
    End Sub

    Protected Sub btnupdate_Click(sender As Object, e As EventArgs) Handles btnupdate.Click
        edit()
        getdata()
    End Sub

    Protected Sub servicereg_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles servicereg_Grid.SelectedIndexChanged
        btnsave.Enabled = False
        btndel.Enabled = True
        btnupdate.Enabled = True




        Try
            btnsave.Enabled = False
            btndel.Enabled = True
            btnupdate.Enabled = True
            Me.service_txt.Text = servicereg_Grid.SelectedRow.Cells(1).Text
            Me.serviceName_txt.Text = servicereg_Grid.SelectedRow.Cells(2).Text
            Me.serviceRate_txt.Text = servicereg_Grid.SelectedRow.Cells(3).Text
            Me.serviceDate_txt.SelectedDate = servicereg_Grid.SelectedRow.Cells(4).Text
        Catch ex As Exception
            MsgBox("Failed:GridCick " & ex.Message)
            Me.Dispose()
        End Try
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        search_txt()
    End Sub
End Class