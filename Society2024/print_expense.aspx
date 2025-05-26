<%@ Page Title="Contact"  Language="C#" AutoEventWireup="true" CodeBehind="print_expense.aspx.cs" Inherits="Society.print_expense" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">
        <asp:HiddenField ID="society_id" runat="server" />
 <table width="100%">
                        <tr>
                            <th width="100%" class="">
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Expense Reports
                                </h1>
                            </th>s
                        </tr>
                    </table>
          <div class="form-group">
                        <div class="row ">
                         
                             <div class="col-sm-1">
                                <asp:Label ID="Label8" runat="server" Text="Expense Type"></asp:Label>
                              
                            </div>
                           <div class="col-sm-3">
                               
                                <asp:DropDownList ID="ddl_expense" width="130px" runat="server" OnSelectedIndexChanged="ddl_expense_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                              <div class="col-sm-1">
                                <asp:Label ID="Label2" runat="server" Text="Date:" ></asp:Label>
                                 
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txt_date" TextMode="Date" runat="server" OnTextChanged="txt_date_TextChanged" AutoPostBack="true"></asp:TextBox>
                          
                            </div>
                             <div class="col-sm-1">
                                        <asp:Label ID="Label12" runat="server" Text="To Date"></asp:Label>
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_to" TextMode="Date" runat="server" OnTextChanged="txt_to_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>

                        </div>
                    </div>
         <br />
        <br />
<div align="center">

<asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
   class="btn btn-primary" Font-Bold="True" />
<br />
 <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
</div>
</div>
   
</asp:Content>