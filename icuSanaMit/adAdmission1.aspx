<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adAdmission1.aspx.cs" Inherits="icuSanaMit.adAdmission1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Continue Adding Admission Record</h1>
<p>Stage 2</p>
    <h2><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>

<h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">ICU/HDU Admission</h2>
    <asp:Table ID="Table2" runat="server">
    <asp:TableRow BackColor="LightCyan"><asp:TableCell>
    Where was the patient immediately before <br />
    he/she was transferred to the ICU/HDU?
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="befoicu" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="be_desc" DataValueField="be_id">
    </asp:DropDownList>&nbsp 
<%--    <a href="beicu.aspx" onclick="window.open('beicu.aspx', 'newwindow', 'width=600, height=250'); return false;">if not in list click here</a>
--%>                <asp:LinkButton ID="LinkButton1" runat="server" 
        onclick="LinkButton1_Click">If not in list, click here</asp:LinkButton>

    </asp:TableCell></asp:TableRow>
    <asp:TableRow Visible="false" BackColor="#660033"><asp:TableCell ForeColor="White">
    Add place:
    </asp:TableCell><asp:TableCell>
            <asp:TextBox ID="beicutext" runat="server"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="Add" onclick="Button3_Click" />
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Reason for ICU/HDU admission (choose ALL that apply):
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="reason" runat="server" 
        DataSourceID="SqlDataSource5" DataTextField="re_description" 
        DataValueField="re_id">
    </asp:DropDownList> 
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">If not in list, click here</asp:LinkButton>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow Visible="false" BackColor="#660033" ForeColor="White"><asp:TableCell>
    Add Reason in list:
    </asp:TableCell><asp:TableCell>
    <asp:TextBox ID="reasonText" runat="server" Width="300px"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="Add" onclick="Button4_Click" />
    </asp:TableCell></asp:TableRow>
    </asp:Table>
   
    <panel>
    <b style="padding: 2px; margin: 2px; background-color: #000099; color: #FFFFFF; line-height: 9px;">First set of vital signs in ICU/HDU (These are the first set of vital signs for the ICU/HDU admission.)</b></panel>
   <p> <asp:Table ID="Table1" runat="server" BorderStyle="Ridge">
   
    <asp:TableRow><asp:TableCell>
    Temperature:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="temperatureBox" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="tempvalidator"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="temperatureBox"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    Heart Rate (beats per minute):
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="heartRate" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="heartRate"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    Blood pressure (Systolic, mmHg):
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="systolic" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="systolic"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    Blood pressure (Diastolic, mmHg):
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="diastolic" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="diastolic"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    Respiratory rate (breaths per minute):
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="respRate" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="respRate"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    Oxygen saturation (%):
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="oxigen" runat="server" style="text-align:right;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
    runat="server" ValidationExpression="^[+-]?\d+(\.\d+)?$"
    ErrorMessage="Only numbers are allowed" ControlToValidate="oxigen"
    Display="Dynamic" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    Receiving oxygen at time of vital signs?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="oxydrop" runat="server">
        <asp:ListItem Value="U">Unknown</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    -- If yes, was patient on ventilator support <br />
    &nbsp &nbsp or just receiving oxygen as flow?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="OxyVent" runat="server">
        <asp:ListItem Value="Nothing">  </asp:ListItem>
        <asp:ListItem Value="vent support">Vent Support</asp:ListItem>
        <asp:ListItem Value="flow">flow (L/min, including T-piece, nasal cannula, and face mask)</asp:ListItem> 
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    Glasgow coma scale score (Check only one box. <br />If you check the first box, also circle the number <br /> and circle "T" if
the patient is intubated.)
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="glasgow" runat="server">
        <asp:ListItem Value="Unknown">Unknown</asp:ListItem>
        <asp:ListItem Value="patient sedated">Patient sedated</asp:ListItem>
        <asp:ListItem Value="GCS">GCS</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    GCS value
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="gcs" runat="server">
        <asp:ListItem Value="0"></asp:ListItem>
        <asp:ListItem Value="3">3</asp:ListItem>
        <asp:ListItem Value="4">4</asp:ListItem>
        <asp:ListItem Value="5">5</asp:ListItem>
        <asp:ListItem Value="6">6</asp:ListItem>
        <asp:ListItem Value="7">7</asp:ListItem>
        <asp:ListItem Value="8">8</asp:ListItem>
        <asp:ListItem Value="9">9</asp:ListItem>
        <asp:ListItem Value="10">10</asp:ListItem>
        <asp:ListItem Value="11">11</asp:ListItem>
        <asp:ListItem Value="12">12</asp:ListItem>
        <asp:ListItem Value="13">13</asp:ListItem>
        <asp:ListItem Value="14">14</asp:ListItem>
        <asp:ListItem Value="15">15</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    GCS T?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="gcst" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow></asp:Table></p><asp:Table ID="table4443" 
        runat="server" Width="674px"><asp:TableRow HorizontalAlign="Center"><asp:TableCell>
<asp:Button ID="Button2" runat="server" Text="Save only" 
        onclick="Button2_Click" />
</asp:TableCell><asp:TableCell>
<a href="hospitalAdmission.aspx">Don't save</a>
</asp:TableCell><asp:TableCell>
<asp:Button ID="Button1" runat="server" Text="Save and go to next page" Width="171px" 
        onclick="Button1_Click" />
</asp:TableCell></asp:TableRow></asp:Table><asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM before_icu"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM reason_icuadmission"></asp:SqlDataSource>
    
</asp:Content>
