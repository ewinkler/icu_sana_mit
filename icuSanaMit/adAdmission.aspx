<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adAdmission.aspx.cs" Inherits="icuSanaMit.adAdmission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add New Admission Record</h1>
        

<h2 style="background-color: #0000FF; color: #FFFFFF; font-weight: bold; font-style: normal; font-size: medium;">Patient Information</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="pa_id" DataSourceID="SqlDataSource5" AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pa_id" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="pa_id" />
            <asp:BoundField DataField="pa_fname" HeaderText="First Name" 
                SortExpression="pa_fname" />
            <asp:BoundField DataField="pa_lname" HeaderText="Last Name" 
                SortExpression="pa_lname" />
            <asp:BoundField DataField="pa_gender" HeaderText="Gender" 
                SortExpression="pa_gender" />
            <asp:BoundField DataField="pa_birth" HeaderText="Birth Date" 
                SortExpression="pa_birth" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="pa_address" HeaderText="Address" 
                SortExpression="pa_address" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

<SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView> 
   
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT pa_id, pa_mhr, pa_fname, pa_lname, pa_gender, pa_birth, pa__address AS pa_address FROM patient">
        
        
    </asp:SqlDataSource>
          
          
    <asp:Table ID="Table3" runat="server" BorderStyle="Ridge">
    <asp:TableRow ><asp:TableCell>
    <asp:Table ID="Table2" runat="server">
    <asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    First Name:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="fname" runat="server" ontextchanged="fname_TextChanged" MaxLength="50"></asp:TextBox>
        <asp:RequiredFieldValidator id="rffname" ControlToValidate="fname" runat="server" ErrorMessage="First name is requred" ForeColor="Red" />
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    Last Name:
    </asp:TableCell><asp:TableCell>
    <asp:TextBox ID="lname" runat="server" MaxLength="50" AutoPostBack="true" 
        ontextchanged="lname_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="lname" runat="server" ErrorMessage="Last name is requred" ForeColor="Red" />

    </asp:TableCell></asp:TableRow>

    <asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    Medical record number:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="mhr" runat="server" AutoPostBack="true" ontextchanged="mhr_TextChanged"></asp:TextBox>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    gender:
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="DropDownList5" runat="server">
        <asp:ListItem Value="F">Female</asp:ListItem>
        <asp:ListItem Value="M">Male</asp:ListItem>
        </asp:DropDownList> 
    </asp:TableCell></asp:TableRow>

    <asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
    age:
    </asp:TableCell><asp:TableCell>
   
    <asp:TextBox ID="age" runat="server" Text="0" TextMode="Number" 
        ValidationGroup="\d+" Width="50"></asp:TextBox>
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" CausesValidation="false">Calc. birth date</asp:LinkButton>    

    <asp:RequiredFieldValidator ID="agevalid" runat="server" ControlToValidate="age" ErrorMessage="Emply box is not allowed" ForeColor="Red" />
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    Birth date:
    </asp:TableCell><asp:TableCell>
       <asp:TextBox ID="birth" runat="server" TextMode="Date" 
        ontextchanged="birth_TextChanged"></asp:TextBox>
            <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" CausesValidation="false">Calc. age</asp:LinkButton>

        <asp:RequiredFieldValidator ID="rebirth" runat="server" ControlToValidate="birth" ErrorMessage="Birth date is required!" ForeColor="Red" />
        </asp:TableCell></asp:TableRow>
    

    </asp:Table>
    </asp:TableCell><asp:TableCell>
        <asp:Table ID="Table4" runat="server">
        <asp:TableRow ><asp:TableCell>
        </asp:TableCell><asp:TableCell>
        
        </asp:TableCell></asp:TableRow>
        <asp:TableRow><asp:TableCell>
        Patient address:
        </asp:TableCell><asp:TableCell>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
        </asp:TableCell></asp:TableRow>
        <asp:TableRow BackColor="#CCFFCC"><asp:TableCell>
        Province:
        </asp:TableCell><asp:TableCell>
         <asp:DropDownList ID="DropDownList6" runat="server" 
        DataSourceID="SqlDataSource6" DataTextField="pr_name" 
        DataValueField="pr_id" AutoPostBack="true"
        onselectedindexchanged="DropDownList6_SelectedIndexChanged">
    </asp:DropDownList>
        </asp:TableCell></asp:TableRow>
        <asp:TableRow><asp:TableCell>
        District:
        </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="DropDownList3" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="di_district" 
        DataValueField="di_id">
    </asp:DropDownList>
        </asp:TableCell></asp:TableRow>
        </asp:Table>
    </asp:TableCell></asp:TableRow></asp:Table>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT di_id, di_district, di_province FROM district"
        >
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT pa_fname, pa_lname FROM patient"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT pr_id, pr_name FROM province"></asp:SqlDataSource>
      
    <p>
    <asp:Table ID="Table1" runat="server" BorderStyle="Ridge">
    <asp:TableRow BackColor="LightCyan"><asp:TableCell>
    Hospital:
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="hospitalBox" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="ho_name" DataValueField="ho_id">
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
   <asp:TableRow><asp:TableCell>
    ICU or HDU
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="icuHdu" runat="server">
        <asp:ListItem Value="1">ICU</asp:ListItem>
        <asp:ListItem Value="2">HDU</asp:ListItem>
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow BackColor="LightCyan"><asp:TableCell>
    Hospital admission date:
    </asp:TableCell><asp:TableCell>
    
        <asp:TextBox ID="adDate" runat="server" TextMode="Date" Text='<%# System.DateTime.Now.ToString("dd.MM.yyyy")%>'></asp:TextBox><asp:TextBox
            ID="adTime" runat="server" TextMode="Time"></asp:TextBox>
    </asp:TableCell></asp:TableRow>

    <asp:TableRow><asp:TableCell>
    ICU-HDU admission date:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="icuhdudatebox" runat="server" TextMode="Date"></asp:TextBox>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow BackColor="LightCyan"><asp:TableCell>
    What type of admission was this?
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="type" DataValueField="ty_id">
    </asp:DropDownList><%--<a href="admissionTypes.aspx" onclick="window.open('admissionTypes.aspx', 'newwindow', 'width=600, height=150'); return false;">if not in list click here</a>--%>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    Referred from a district hospital?
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="referDistrHosp" runat="server" AutoPostBack="true"
        onselectedindexchanged="referDistrHosp_SelectedIndexChanged">
        <asp:ListItem Value="N">No</asp:ListItem>
        <asp:ListItem Value="Y">Yes</asp:ListItem>
    </asp:DropDownList>
    
    </asp:TableCell></asp:TableRow>
    <asp:TableRow ID="which" BackColor="LightCyan"><asp:TableCell>
    -- If yes, which district hospital?
    </asp:TableCell><asp:TableCell>
        <asp:DropDownList ID="distrHospitals" runat="server" 
        DataSourceID="SqlDataSource10" DataTextField="di_hospName" 
        DataValueField="di_id">
    </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    <asp:TableRow><asp:TableCell>
    What insurance does the patient have?
    </asp:TableCell><asp:TableCell>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="in_name" DataValueField="in_id">
    </asp:DropDownList>&nbsp             <asp:LinkButton ID="LinkButton1" runat="server" 
        onclick="LinkButton1_Click1">Not in list, click here</asp:LinkButton>

<%--    <a href="insurance.aspx" onclick="window.open('insurance.aspx', 'newwindow', 'width=600, height=250'); return false;"> add insurance</a>
--%>    </asp:TableCell></asp:TableRow>
    <asp:TableRow ID="addINsurance" Visible="false" BackColor="#660033"><asp:TableCell ForeColor="White">
    Add Insurance name:
    </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><asp:Button ID="Button2"
            runat="server" Text="Add" onclick="Button2_Click2" /><br />
        <asp:DropDownList ID="DropDownList4" runat="server" 
        DataSourceID="SqlDataSource9" DataTextField="co_name" DataValueField="co_id">
        </asp:DropDownList>
    </asp:TableCell></asp:TableRow>
    </asp:Table></p>
    
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM distr_hospitals"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM country"></asp:SqlDataSource>
<%-- <a href="Default.aspx" onclick="window.open('Default.aspx', 'newwindow', 'width=300, height=250'); return false;">sdfsfds</a>
--%>    <br />
    
    
    <asp:Table ID="table44" runat="server" Width="778px"><asp:TableRow HorizontalAlign="Center"><asp:TableCell HorizontalAlign="Center">
    <asp:Button ID="Button1" runat="server" Text="Add only this Record" onclick="Button1_Click" />
    </asp:TableCell><asp:TableCell>
<a href="hospitalAdmission.aspx">Don't add</a>    
    </asp:TableCell><asp:TableCell>
        <asp:Button ID="Button3" runat="server" Text="Add record & go to the Next Page" onclick="Button3_Click" Width="236px" />    
    </asp:TableCell></asp:TableRow></asp:Table>
      <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM infection_site"></asp:SqlDataSource>
    

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT in_id, in_name FROM insurance"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM types"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:icu_sana_mitConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:icu_sana_mitConnectionString.ProviderName %>" 
        SelectCommand="SELECT ho_id, ho_name FROM hospital"></asp:SqlDataSource>

</asp:Content>
