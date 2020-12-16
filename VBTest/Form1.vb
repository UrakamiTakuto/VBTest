Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim num As Integer = Integer.Parse(TextBox1.Text)

        TextBox2.Text = (num * 2).ToString()

    End Sub

    Private Function GetDouble(ByVal num As Integer)
        GetDouble = num * 2
    End Function

End Class
