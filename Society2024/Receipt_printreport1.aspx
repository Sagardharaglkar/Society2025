<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="Receipt_printreport1.aspx.cs" Inherits="Society.Receipt_printreport1" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <asp:HiddenField ID="society_id" runat="server" />
     <asp:HiddenField ID="receipt_id" runat="server" />


    <div style="padding:15px">
<div align="center" style="font-size: 30px;">Receipt Report</div>
        <%-- <div class="form-group">
                <div class="row ">
                    <div class="col-sm-3">
                        <asp:Label ID="Label13" runat="server" Text="Building  Name"></asp:Label>
                         <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddl_build" Height="32px" Width="150px" runat="server" required OnSelectedIndexChanged="ddl_build_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                
          
                    <div class="col-sm-3">
                        <asp:Label ID="Label16" runat="server" Text="owner Name"></asp:Label>
                         <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddl_owner" Height="32px" Width="150px" runat="server" ></asp:DropDownList>
                    </div>
                </div>
    </div>
         <div class="form-group">
                                <div class="row ">
         
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_date" runat="server" Text="From Date"></asp:Label>
                                        <asp:Label ID="lbl_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_from" TextMode="Date" runat="server" ></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="Label12" runat="server" Text="To Date"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_to" TextMode="Date" runat="server"></asp:TextBox>
                                    </div>
                                    </div>
              </div>--%>

  
<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click" Visible="false"
    class="btn btn-primary" Font-Bold="True" />
<br />
<br />

 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>