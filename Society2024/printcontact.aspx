<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printcontact.aspx.cs" Inherits="Society.printcontact" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <asp:HiddenField ID="society_id" runat="server" />
    <div style="padding:15px">
<h1 class=" tex0 font-weight-bold " style="color: #012970;">Helper Contacts
</h1>
           <div class="form-group">
                <div class="row ">
                 
                    <div class="col-sm-2">
                        <asp:Label ID="Label7" runat="server" Text="Person's Type"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddl_per_type" OnSelectedIndexChanged="ddl_per_type_SelectedIndexChanged" runat="server" AutoPostBack="True" Width="200px" ></asp:DropDownList> <br />
                       
                    </div>
                </div>
            </div>
              
<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
   class="btn btn-primary" Font-Bold="True" Visible="false" />
<br />
<br />
   
<%-- <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px" AsyncRendering="false"></rsweb:ReportViewer>--%>
     <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="800px" ProcessingMode="Local" >
        </rsweb:ReportViewer>
   
</div>
</div>
   
</asp:Content>