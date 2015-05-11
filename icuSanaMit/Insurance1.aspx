<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insurance1.aspx.cs" Inherits="icuSanaMit.Insurance1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add Insurance Company</h1><br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="in_id" 
            DataSourceID="SqlDataSource2" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="in_id" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="in_id" />
                <asp:BoundField DataField="in_name" HeaderText="Insurance Name" 
                    SortExpression="in_name" />
                <asp:BoundField DataField="co_id" HeaderText="Country id" 
                    SortExpression="co_id" />
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
        </asp:GridView><br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM insurance"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Insurance Name "></asp:Label>&nbsp
        <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" runat="server" Text="Country "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="co_name" DataValueField="co_id">
        </asp:DropDownList>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Add Insurance" onclick="Button1_Click" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM country"></asp:SqlDataSource>
    </div>


</asp:Content>
