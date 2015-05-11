<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Discharged.aspx.cs" Inherits="icuSanaMit.Discharged" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Generate Patient report" 
        onclick="Button1_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
    CellPadding="3" CellSpacing="1" DataKeyNames="ha_id" 
    DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" 
        AllowSorting="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" AlternatingRowStyle-BackColor="#999999">
<AlternatingRowStyle BackColor="#CFD1CF"></AlternatingRowStyle>
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ha_id" HeaderText="ha_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="ha_id" />
            <asp:BoundField DataField="pa_fname" HeaderText="pa_fname" 
                SortExpression="pa_fname" />
            <asp:BoundField DataField="pa_lname" HeaderText="pa_lname" 
                SortExpression="pa_lname" />
            <asp:BoundField DataField="pa_age" HeaderText="pa_age" 
                SortExpression="pa_age" />
            <asp:BoundField DataField="re_description" HeaderText="re_description" 
                SortExpression="re_description" />
            <asp:BoundField DataField="ha_dis_date" HeaderText="ha_dis_date" 
                SortExpression="ha_dis_date" />
            <asp:BoundField DataField="ha_dis_die" HeaderText="ha_dis_die" 
                SortExpression="ha_dis_die" />
            <asp:BoundField DataField="ha_dis_referred" HeaderText="ha_dis_referred" 
                SortExpression="ha_dis_referred" />
            <asp:BoundField DataField="icd10Desc" HeaderText="icd10Desc" 
                SortExpression="icd10Desc" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
    SelectCommand="SELECT ha_id, ho_id, pa_fname, pa_lname, pa_age, re_description, ha_dis_date, ha_dis_die, ha_dis_referred, icd10Desc FROM hospital_admission_view where ha_dis_date is not null order by ha_dis_date desc">
</asp:SqlDataSource>

</asp:Content>
