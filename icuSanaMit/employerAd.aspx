<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employerAd.aspx.cs" Inherits="icuSanaMit.employerAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Add Employer</h1>
<p></p>
    <asp:Table ID="Table1" runat="server">
    <asp:TableRow><asp:TableCell>
    First Name: 
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="firstName" runat="server" Width="170px"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Last Name: 
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="lastName" runat="server" Width="170px"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Login name:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="loginName" runat="server" Width="170px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Login with this name already exists. Please, change the login" ForeColor="Red"></asp:Label>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Password
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="pwd" runat="server" Width="170px"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Job description 
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="jo_desc" DataValueField="jo_id">
        </asp:DropDownList>     
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Mobile phone number:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="mobile" runat="server" Width="170px"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    status
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem Value="false">non-active</asp:ListItem>
        <asp:ListItem Value="true">active</asp:ListItem>
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    group:
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="eg_desc" DataValueField="eg_id">
    </asp:DropDownList> 
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Hospital:
    </asp:TableCell><asp:TableCell>
     <asp:DropDownList ID="DropDownList4" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="ho_name" DataValueField="ho_id">
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow Height="30px"><asp:TableCell></asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
   
    </asp:TableCell><asp:TableCell>
         <asp:Button ID="Button1" runat="server" Text="Add Employee" onclick="Button1_Click" />
    </asp:TableCell></asp:TableRow>
    
    </asp:Table>
   

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM hospital"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM emplyee_group"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM job_tittle"></asp:SqlDataSource>
</asp:Content>
