<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adAdmission3.aspx.cs" Inherits="icuSanaMit.adAdmission3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Continue Adding Admission Record</h1>
<p>page 4</p>
    <h2><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>

    <h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">Intervensions</h2>
    <asp:Table ID="Table3" runat="server" BorderStyle="Ridge">
    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    Surgery: Did the patient have an operative procedure during this hospitalisation?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="surgery" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    Did the patient receive mechanical ventilation during ICU/HDU stay?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="ventilation" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    Vasopressors: Did the patient receive vasopressor medications during ICU/HDU stay?<br /> (dopamine,
epinephrine/adrenaline, dobutamine, norepinephrine)
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="vasopressor" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
   Invasive monitoring: Did the patient receive a central line or arterial line?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="invmonitoring" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    Hemodialysis: Did the patient receive renal replacement therapy (RRT)?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="hemodyalisis" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow ><asp:TableCell>
    TPN: Did the patient receive parenteral nutrition?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="tpn" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    </asp:Table> <br />
  

<h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">Quality indicators</h2>
    <asp:Table ID="Table1" runat="server" BorderStyle="Ridge">
    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    Did the patient acquire a new bed sore after ICU/HDU admission?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="newbed" runat="server">
        <asp:ListItem Value="U">Unknown</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    Did the patient have a bed sore that progressed to a worse stage?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="havebed" runat="server">
        <asp:ListItem Value="U">Unknown</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
     Did the patient have a fever that started on day 3 of ICU/HDU stay or later?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="fever" runat="server">
        <asp:ListItem Value="U">Unknown</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
     Did the patient have a first positive culture (urine / blood / sputum) <br />taken day 3 of ICU/HDU admission or later?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="culture" runat="server">
        <asp:ListItem Value="U">Unknown</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>

    </asp:Table>

    <h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">Discharge / Causes of illness and death</h2>
    <asp:Table ID="Table2" runat="server" BorderStyle="Ridge">
    <asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    What day was the patient's final discharge from <br />
    the ICU/HDU? (DD/MM/YY)
    </asp:TableCell><asp:TableCell VerticalAlign="Middle">
        <asp:TextBox ID="disDate" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqdisdate" runat="server" ControlToValidate="disDate" ErrorMessage="Required to fill!" ForeColor="Red" />
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    Did the patient die during this ICU/HDU stay?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="die" runat="server">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        </asp:DropDownList>  
    </asp:TableCell></asp:TableRow><asp:TableRow BackColor="#C5FCFC"><asp:TableCell>
    Was the patient referred to a higher level of care?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="referred" runat="server">
        <asp:ListItem Value="No">No</asp:ListItem>
        <asp:ListItem Value="yes - referral hospital in Rwanda">Yes - referral hospital in Rwanda</asp:ListItem>
        <asp:ListItem Value="yes - referral hospital outside the country">yes - referral hospital outside the country</asp:ListItem>
        </asp:DropDownList>  
    </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell>
    What were the patient's diagnoses as understood at the<br /> time of discharge or death?
    </asp:TableCell><asp:TableCell>
    <asp:TextBox ID="diagnosis" 
            runat="server" Width="259px" AutoPostBack="true" 
        ontextchanged="diagnosis_TextChanged"></asp:TextBox> <asp:Button ID="Button2" 
            runat="server" Text="Search in codes" onclick="Button2_Click" />
    </asp:TableCell></asp:TableRow></asp:Table><p>
       <asp:GridView ID="GridView1" 
            runat="server" AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged"><Columns><asp:CommandField 
                ShowSelectButton="True" /><asp:BoundField DataField="icd10code" 
                HeaderText="icd10code" SortExpression="icd10code" /><asp:BoundField 
                DataField="icd10Desc" HeaderText="icd10Desc" SortExpression="icd10Desc" /><asp:BoundField 
                DataField="ccsCode" HeaderText="ccsCode" SortExpression="ccsCode" /><asp:BoundField 
                DataField="ccsDesc" HeaderText="ccsDesc" SortExpression="ccsDesc" /><asp:BoundField 
                DataField="MULTI_CCS_LVL_1" HeaderText="MULTI_CCS_LVL_1" 
                SortExpression="MULTI_CCS_LVL_1" /><asp:BoundField 
                DataField="MULTI_CCS_LVL_1_LABEL" HeaderText="MULTI_CCS_LVL_1_LABEL" 
                SortExpression="MULTI_CCS_LVL_1_LABEL" /><asp:BoundField 
                DataField="MULTI_CCS_LVL_2" HeaderText="MULTI_CCS_LVL_2" 
                SortExpression="MULTI_CCS_LVL_2" /><asp:BoundField 
                DataField="MULTI_CCS_LVL_2_LABEL" HeaderText="MULTI_CCS_LVL_2_LABEL" 
                SortExpression="MULTI_CCS_LVL_2_LABEL" /></Columns></asp:GridView>  
        <asp:SqlDataSource 
            ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM diagnosesview"></asp:SqlDataSource><asp:Label ID="Label1" runat="server" Text="" Width="440px"></asp:Label><asp:Button 
            ID="Button1" runat="server" Text="Finish" Width="158px" 
            onclick="Button1_Click" />&nbsp&nbsp <a href="hospitalAdmission.aspx">Don't save</a> </p></asp:Content>