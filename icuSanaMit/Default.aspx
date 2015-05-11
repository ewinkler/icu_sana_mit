<%@ Page Title="ICU SANA MIT" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="icuSanaMit._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to our database
    </h2>
    <p>
        The databse is protected and to access you need special permission for that.
    </p>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:icusanamitConnectionString %>" 
    SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    <p>
        &nbsp;</p>
</asp:Content>
