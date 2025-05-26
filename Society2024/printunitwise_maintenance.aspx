<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="printunitwise_maintenance.aspx.cs" Inherits="Society.printunitwise_maintenance" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="society_id" runat="server" />

    <div style="padding:15px">
        <div align="center" style="font-size: 30px;">Unitwise Maintenance Report</div>
        <br />
       <%-- <div class="form-group">
                                <div class="row ">
          <div class="col-sm-2">
                                        <asp:Label ID="Label7" runat="server" Text="Building Name"></asp:Label>
                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddl_build" runat="server" AutoPostBack="true" width="150px"></asp:DropDownList>
                                    </div>
                                      <div class="col-sm-2">
                                        <asp:Label ID="Label1" runat="server" Text="Type"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:DropDownList ID="ddl_type" runat="server" AutoPostBack="true" width="150px"></asp:DropDownList>
                                    </div>
                                    </div>
            </div>--%>
                </div>
          <div class="form-group">
                                <div class="row ">
         
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_date" runat="server" Text="From Date"></asp:Label>
                                        <asp:Label ID="lbl_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_from" TextMode="Date" runat="server" SelectedDate="<%# DateTime.Today %>"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="Label12" runat="server" Text="To Date"></asp:Label>
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_to" TextMode="Date" runat="server"></asp:TextBox>
                                    </div>
                                    </div>
              </div>


<div align="center">
<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
   class="btn btn-primary" Font-Bold="True" />
<br />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px" ShowRefreshButton="true" ShowPrintButton="True" PromptAreaCollapsed="True" SizeToReportContent="True"></rsweb:ReportViewer>
</div>

   
</asp:Content>