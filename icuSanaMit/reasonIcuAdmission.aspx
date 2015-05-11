<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reasonIcuAdmission.aspx.cs" Inherits="icuSanaMit.reasonIcuAdmission" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Add new ICU admission Reason</h1>
        <asp:TextBox ID="TextBox1" runat="server" Width="500px"></asp:TextBox><br /><br />
        <asp:Label ID="Label1" runat="server" Text=" " Width="450px"></asp:Label>   
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
