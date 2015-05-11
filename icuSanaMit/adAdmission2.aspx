<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adAdmission2.aspx.cs" Inherits="icuSanaMit.adAdmission2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Continue Adding Admission Record</h1>
<p>page 3</p>
    <h2><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>
<h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">Sepsis: Did the patient have any of the below within 24 hours of admission to the ICU/HDU?</h2>
<p><asp:Table ID="Table1" runat="server" BorderStyle="Ridge">
<asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
Body temperature >38.5°C or < 35.0°C
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="bodytemp" runat="server">
    <asp:ListItem Value="N">No</asp:ListItem>
    <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
</asp:TableCell></asp:TableRow>

<asp:TableRow><asp:TableCell>
Heart rate >90 bpm
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="heartRateSep" runat="server">
    <asp:ListItem Value="N">No</asp:ListItem>
    <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
</asp:TableCell></asp:TableRow>

<asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
Respiratory rate >20 bpm
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="respRateSep" runat="server">
    <asp:ListItem Value="N">No</asp:ListItem>
    <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
</asp:TableCell></asp:TableRow>

<asp:TableRow><asp:TableCell>
White blood cell count >12,000mm3 or < 4,000mm3<br />
or immature forms >10%
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="wbcSep" runat="server">
    <asp:ListItem Value="U">Unknown</asp:ListItem>
    <asp:ListItem Value="N">No</asp:ListItem>
    <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
</asp:TableCell></asp:TableRow>

<asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
Suspected or confirmed infection?
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="suspinfection" runat="server">
    <asp:ListItem Value="N">No</asp:ListItem>
    <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
</asp:TableCell></asp:TableRow>

<asp:TableRow><asp:TableCell>
If suspected or confirmed infection, please list <br /> the primary site of infection:
</asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="infection" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="is_desc" DataValueField="is_id">
    </asp:DropDownList>&nbsp
<%--<a href=Infection.aspx onclick="window.open('Infection.aspx', 'newwindow', 'width=600, height=250'); return false;">if not in list, click here</a>
--%>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">If not in list, click here</asp:LinkButton>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow Visible="false" BackColor="#660033" ForeColor="White"><asp:TableCell>
    Add site of infection:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="infsite" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Add" onclick="Button3_Click" />

    </asp:TableCell></asp:TableRow>
    </asp:Table></p> 
    <br />


    <asp:Table ID="table5555" runat="server" Width="667px">
    <asp:TableRow HorizontalAlign="Center"><asp:TableCell>
    <asp:Button ID="Button1" runat="server" Text="Save Only" Width="90px" 
        onclick="Button1_Click"  />
    </asp:TableCell><asp:TableCell>
    <a href="hospitalAdmission.aspx">Don't save</a>
    </asp:TableCell><asp:TableCell>
    <asp:Button ID="Button2" runat="server" Text="Save and go to next" Width="131px" 
        onclick="Button2_Click"  />
    </asp:TableCell></asp:TableRow>
    </asp:Table>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM infection_site"></asp:SqlDataSource>
</asp:Content>
