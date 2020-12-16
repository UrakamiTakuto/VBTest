Imports System.Text
Imports System.Windows.Forms
Imports Microsoft.VisualStudio.TestTools.UnitTesting
Imports VBTest

<TestClass()> Public Class UnitTest1

    <TestMethod()> Public Sub TestMethod1()

        Dim form As New Form1()
        Dim pObj As New PrivateObject(form)

        Dim value As Integer

        value = pObj.Invoke("GetDouble", 2)
        Assert.AreEqual(value, 4)


    End Sub

    <TestMethod()> Public Sub TestMethod2()

        Dim form As New Form1()
        Dim pObj As New PrivateObject(form)

        Dim str As String

        CType(pObj.GetProperty("TextBox1"), TextBox).Text = "1"
        pObj.Invoke("Button1_Click", New Object() {Nothing, Nothing})
        str = CType(pObj.GetProperty("TextBox2"), TextBox).Text

        Assert.AreEqual(str, "2")


    End Sub

    <TestMethod()> Public Sub TestMethod3()

        Dim form As New Form1()
        Dim pObj As New PrivateObject(form)

        Dim str As String

        CType(pObj.GetProperty("TextBox1"), TextBox).Text = "a"
        pObj.Invoke("Button1_Click", New Object() {Nothing, Nothing})
        str = CType(pObj.GetProperty("TextBox2"), TextBox).Text

        Assert.AreEqual(str, "2")


    End Sub


End Class