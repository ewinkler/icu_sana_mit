<%@ Page Title="Hospital Admission" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="hospitalAdmission.aspx.cs" Inherits="icuSanaMit.hospitalAdmission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Hospital Admission table</h1>
    <asp:Button ID="Button1" runat="server" Text="Add new admission" 
        onclick="Button1_Click" />&nbsp
    <asp:Button ID="Button3" runat="server" Text="ICU Admission 1" onclick="Button3_Click" 
         /> &nbsp
    <asp:Button ID="Button2" runat="server" Text="ICU Admission 2" 
        onclick="Button2_Click" /> &nbsp
    <asp:Button ID="stage3" runat="server" Text="Sepsis" 
        onclick="stage3_Click" /> &nbsp
    <asp:Button ID="stage4" runat="server" Text="Final" 
        onclick="stage4_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ha_id" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
          OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="#">
            <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ha_id" HeaderText="" InsertVisible="False" 
                ReadOnly="True" SortExpression="ha_id" ItemStyle-Width="1px" ItemStyle-ForeColor="Transparent" />
            <asp:BoundField DataField="ho_abbr" HeaderText="Hosp" 
                SortExpression="ho_abbr" />
            <asp:BoundField DataField="pa_fname" HeaderText="First name" 
                SortExpression="pa_fname" />
            <asp:BoundField DataField="pa_lname" HeaderText="Last Name" 
                SortExpression="pa_lname" />
            <asp:BoundField DataField="pa_gender" HeaderText="Gender" 
                SortExpression="pa_gender" />
            <asp:BoundField DataField="ha_patient_age" HeaderText="age" 
                SortExpression="ha_patient_age" />
            <asp:BoundField DataField="re_description" HeaderText="reason" 
                SortExpression="re_description" />
            <asp:BoundField DataField="em_fname" HeaderText="1st stage" 
                SortExpression="em_fname" />
            <asp:BoundField DataField="Expr1" HeaderText="2nd stage" 
                SortExpression="Expr1" />
            <asp:BoundField DataField="Expr2" HeaderText="3rd stage" 
                SortExpression="Expr2" />
            <asp:BoundField DataField="Expr3" HeaderText="4th stage" 
                SortExpression="Expr3" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM admissionview where ha_dis_date is null"></asp:SqlDataSource>
</asp:Content>
