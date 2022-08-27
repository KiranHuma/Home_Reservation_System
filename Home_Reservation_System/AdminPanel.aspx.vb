Imports System.Data.SqlClient   'FOR SQL CONNECTION AND COMMAND.

Public Class AdminPanel
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
    'Database Connection
    Private Sub dbaccessconnection()
        Try
            con.ConnectionString = cs
            cmd.Connection = con
        Catch ex As Exception
            Label3.Text = "DataBase not connected due to the reason because " & ex.Message
            Me.Dispose()
        End Try
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Me.IsPostBack Then
            usersdata()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("AddUsers.aspx")
    End Sub
    Private Sub usersdata()

        Using con As New SqlConnection(cs)
            Using cmd As New SqlCommand("Select U_ID,UserRole,Username,Name,Password,Gender,Contact_no,Email from Users ", con)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        DataGridViewAdmin.DataSource = dt
                        DataGridViewAdmin.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)

        DataGridViewAdmin.PageIndex = e.NewPageIndex
        Me.usersdata()

    End Sub
    Private Sub DeleteSelecedRows()



        Try
            dbaccessconnection()
            con.Open()
            If Label2.Text = "" Then
                Label3.Text = "Empty RoomType"

            Else
                cmd.CommandText = ("delete from Users where U_ID = '" & Label2.Text & "'")
                cmd.ExecuteNonQuery()

                welcomemsg.ForeColor = System.Drawing.Color.DarkGreen
                welcomemsg.Text = "'Room" & Label2.Text & "' delete successfully!"
                ' roomreg_Grid.Refresh()
                con.Close()
            End If
        Catch ex As Exception
            Label3.Text = "Data Not Deleted"
            welcomemsg.ForeColor = System.Drawing.Color.Red
            Me.Dispose()
        End Try
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Response.Redirect("frmdashboard.aspx")
    End Sub



    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        DeleteSelecedRows()

        Response.Redirect("AddUsers.aspx")


    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click


        Response.Redirect("AddUsers.aspx?idlabel=" + Label1.Text + "&updatelbel=" + Label2.Text)

    End Sub

    Protected Sub DataGridViewAdmin_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DataGridViewAdmin.SelectedIndexChanged
        Label2.Text = DataGridViewAdmin.SelectedRow.Cells(1).Text
    End Sub
End Class