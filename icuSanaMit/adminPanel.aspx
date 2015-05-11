<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminPanel.aspx.cs" Inherits="icuSanaMit.adminPanel" EnableSessionState="True" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Employers panel</h1>
<p><asp:Button ID="Button1" runat="server" Text="Add Record" 
        onclick="Button1_Click" /></p>
    

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="em_id" 
        DataSourceID="SqlDataSource1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="#">
            <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
             </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="em_fname" HeaderText="First Name" 
                SortExpression="em_fname" />
            <asp:BoundField DataField="em_lname" HeaderText="Last Name" 
                SortExpression="em_lname" />
            <asp:BoundField DataField="em_login" HeaderText="Login name" 
                SortExpression="em_login" />
            <asp:BoundField DataField="em_pwd" HeaderText="password" 
                SortExpression="em_pwd" />
            <asp:BoundField DataField="jo_desc" HeaderText="job description" 
                SortExpression="jo_desc" />
            <asp:BoundField DataField="em_mobile" HeaderText="mobile phone" 
                SortExpression="em_mobile" />
            <asp:BoundField DataField="em_status" HeaderText="status" 
                SortExpression="em_status" />
            <asp:BoundField DataField="eg_id" HeaderText="group id" 
                SortExpression="eg_id" />
            <asp:BoundField DataField="eg_desc" HeaderText="group description" 
                SortExpression="eg_desc" />
                <asp:BoundField DataField="hospName" HeaderText="Hospital" 
                SortExpression="hospName" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM employoee_view"></asp:SqlDataSource>
</asp:Content>
