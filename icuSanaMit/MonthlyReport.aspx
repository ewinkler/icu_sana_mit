<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MonthlyReport.aspx.cs" Inherits="icuSanaMit.MonthlyReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>ICU Monthly Report</h1> <br />
    <asp:Label ID="label1" runat="server" Text="Starting date:"></asp:Label>
    <asp:TextBox ID="fdate" runat="server" TextMode="Date"></asp:TextBox> &nbsp;
    <asp:Label ID="Label2" runat="server" Text="Finishing date:"></asp:Label>
    <asp:TextBox ID="ldate" runat="server" TextMode="Date"></asp:TextBox> &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Generate Report" 
        onclick="Button1_Click" />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="911px" 
        Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="568px">
        <LocalReport ReportPath="MonthlyReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM hospital_admission_view"></asp:SqlDataSource>
</asp:Content>
