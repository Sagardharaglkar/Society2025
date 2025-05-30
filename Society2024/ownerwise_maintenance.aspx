<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ownerwise_maintenance.aspx.cs" Inherits="Society.ownerwise_maintenance" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">
                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Ownerwise Maintenance Bill Reports
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-1">
                                    <asp:Label ID="Label1" runat="server" Text="Building Name :"></asp:Label>

                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="ddl_build" runat="server" AutoPostBack="true" Width="150px" OnSelectedIndexChanged="ddl_build_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddl_build" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Building" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                </div>
                                <div class="col-sm-1">
                                    <asp:Label ID="Label2" runat="server" Text="Owner Name :"></asp:Label>

                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="ddl_owner" runat="server" AutoPostBack="true" Width="150px"></asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddl_owner" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Owner" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />


                                </div>
                                <div class="col-sm-1">
                                    <asp:Label ID="lbl_date" runat="server" Text="From Date:"></asp:Label>

                                </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txt_from" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-1">
                                    <asp:Label ID="Label12" runat="server" Text="To Date:"></asp:Label>

                                </div>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txt_to" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <center>
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Width="150px" Text="Search" UseSubmitBehavior="False" ValidationGroup="g1" />

                            &nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                        <asp:Button ID="btn_print" runat="server" class="btn btn-primary" OnClick="btn_print_Click" Text="Print" Width="100px" UseSubmitBehavior="False" ValidationGroup="g1" />

                        </center>


                        <br />
                        <asp:Panel ID="Panel1" runat="server" Visible="false">

                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px"></rsweb:ReportViewer>
                        </asp:Panel>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView PageSize="15" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <%-- <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Date" ItemStyle-Width="200" SortExpression="M_Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="receipt_no" runat="server" Text='<%# Bind("Date")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Particular" ItemStyle-Width="450" SortExpression="Particular">
                                                    <ItemTemplate>
                                                        <asp:Label ID="b_id" runat="server" Text='<%# Bind("Particular")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payment" ItemStyle-Width="300" SortExpression="Payment">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("Payment")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Maintenance" ItemStyle-Width="150" SortExpression="Maintenance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name1" runat="server" Text='<%# Bind("Maintenance")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>

</asp:Content>
