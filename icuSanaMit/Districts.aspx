<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Districts.aspx.cs" Inherits="icuSanaMit.Districts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Districts</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
        AllowSorting="True">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="di_id" HeaderText="di_id" InsertVisible="False" 
                SortExpression="di_id" />
            <asp:BoundField DataField="di_district" HeaderText="di_district" 
                SortExpression="di_district" />
            <asp:BoundField DataField="pr_id" HeaderText="pr_id" InsertVisible="False" 
                SortExpression="pr_id" />
            <asp:BoundField DataField="pr_name" HeaderText="pr_name" 
                SortExpression="pr_name" />
            <asp:BoundField DataField="co_id" HeaderText="co_id" InsertVisible="False" 
                SortExpression="co_id" />
            <asp:BoundField DataField="co_name" HeaderText="co_name" 
                SortExpression="co_name" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <br />
    
   
    
    
    <asp:Table ID="Table1" runat="server" Width="292px"><asp:TableRow><asp:TableCell>
    <asp:Label ID="Label1" runat="server" Text="Country: "></asp:Label>
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="co_name" 
        DataValueField="co_id" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
     <asp:Label ID="Label2" runat="server" Text="Province: "></asp:Label>
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="pr_name" DataValueField="pr_id">
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    <asp:Label ID="Label3" runat="server" Text="District: "></asp:Label>
    </asp:TableCell><asp:TableCell>
    <asp:TextBox ID="distr" runat="server" Width="200px"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    </asp:Table><br />
    <asp:Button ID="Button1" runat="server" Text="Add District" 
        onclick="Button1_Click" />

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM province"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM country"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM district_view"></asp:SqlDataSource>
</asp:Content>
