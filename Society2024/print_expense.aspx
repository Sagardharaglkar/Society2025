<%@ Page Title="Contact" Language="C#" AutoEventWireup="true" CodeBehind="print_expense.aspx.cs" Inherits="Society.print_expense" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 15px">
        <asp:HiddenField ID="society_id" runat="server" />
        <table width="100%">
            <tr>
                <th width="100%" class="">
                    <h1 class=" font-weight-bold " style="color: #012970;">Expense Report</h1>
                </th>

            </tr>
        </table>
        <div class="form-group">
            <div class="d-flex align-items-center bg-white">

                <div class="col-sm-1">
                    <asp:Label ID="Label8" runat="server" Text="Expense Type"></asp:Label>

                </div>
                <div class="col-sm-3">

                    <div class="dropdown-container">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                            placeholder="Select" autocomplete="off" required="required" />
                        <div id="RepeaterContainer1" class="suggestion-list">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="CategoryRepeater_ItemCommand">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="lnkCategory"
                                        runat="server"
                                        CssClass="suggestion-item link-button category-link"
                                        Text='<%# Eval("flat_type") %>'
                                        CommandArgument='<%# Eval("flat_type_id") %>'
                                        CommandName="SelectCategory"
                                        OnClientClick="setTextBox1(this.innerText);" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                        Text="No items found." />
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label2" runat="server" Text="Date:"></asp:Label>

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
                <div>
                </div>


            </div>

        </div>
        <br />
        <br />
        <div align="center">

            <asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
                class="btn btn-primary" Font-Bold="True" />
            <br />
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="65%"></rsweb:ReportViewer>
        </div>
    </div>

</asp:Content>
