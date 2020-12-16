Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim num As Integer

        If Integer.TryParse(TextBox1.Text, num) Then
            TextBox2.Text = GetDouble(num).ToString()
        Else
            TextBox2.Text = "*"
        End If

    End Sub

    Private Function GetDouble(ByVal num As Integer)
        GetDouble = num * 2
    End Function

End Class
