<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Provinces.aspx.cs" Inherits="icuSanaMit.Provinces" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="pr_id" 
            DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="co_id" HeaderText="co_id" SortExpression="co_id" />
                <asp:BoundField DataField="co_name" HeaderText="co_name" 
                    SortExpression="co_name" />
                <asp:BoundField DataField="pr_id" HeaderText="pr_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="pr_id" />
                <asp:BoundField DataField="pr_name" HeaderText="pr_name" 
                    SortExpression="pr_name" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM province_view"></asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server" Text="Country: "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="co_name" DataValueField="co_name">
    </asp:DropDownList>
    </p><p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="select co_name from country"></asp:SqlDataSource>

    <asp:Label ID="Label1" runat="server" Text="Province"></asp:Label>&nbsp
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></p>
    <asp:Button ID="Button1" runat="server" Text="Add" 
    onclick="Button1_Click" />
    <p></p>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="select * from province"></asp:SqlDataSource>
</asp:Content>
