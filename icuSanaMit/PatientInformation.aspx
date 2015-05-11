<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientInformation.aspx.cs" Inherits="icuSanaMit.PatientInformation" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Retreive patient Information</h1>
    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
    <asp:TextBox ID="fname" runat="server"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
    <asp:TextBox ID="lname" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
    <br />
<br />
<asp:Label ID="Label3" runat="server" Text="Medical Record Number"></asp:Label>
    <asp:TextBox ID="mhr" runat="server"></asp:TextBox>
    <asp:Button ID="Button2" runat="server"
        Text="Search" onclick="Button2_Click1" />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="ha_id" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="3" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ha_id" HeaderText="ha_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="ha_id" />
            <asp:BoundField DataField="ho_abbr" HeaderText="ho_abbr" 
                SortExpression="ho_abbr" />
            <asp:BoundField DataField="ha_date" HeaderText="ha_date" 
                SortExpression="ha_date" />
            <asp:BoundField DataField="pa_fname" HeaderText="pa_fname" 
                SortExpression="pa_fname" />
            <asp:BoundField DataField="pa_lname" HeaderText="pa_lname" 
                SortExpression="pa_lname" />
            <asp:BoundField DataField="pa_gender" HeaderText="pa_gender" 
                SortExpression="pa_gender" />
            <asp:BoundField DataField="ha_patient_age" HeaderText="ha_patient_age" 
                SortExpression="ha_patient_age" />
            <asp:BoundField DataField="re_description" HeaderText="re_description" 
                SortExpression="re_description" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT ha_id, ho_id, ho_abbr, ha_date, pa_mhr, pa_fname, pa_lname, pa_gender, ha_patient_age, re_description FROM admissionview">
        <%--filterexpression="pa_fname like '%{0}%' AND pa_lname like '%{1}%'"--%>
        <%--<FilterParameters> 
    <asp:ControlParameter  
     Name="countryparam2"  
     ControlID="fname"/> 
     <asp:ControlParameter Name="blabla" ControlID="lname" />
  </FilterParameters>--%>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana"
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" 
        style="margin-right: 0px" Width="701px" Height="684px" HasPrintButton="True">
        <LocalReport ReportPath="Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetData" 
        TypeName="icuSanaMit.icu_sana_mitDataSetTableAdapters.hospital_admission_viewTableAdapter">
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM hospital_admission_view"></asp:SqlDataSource>

</asp:Content>
