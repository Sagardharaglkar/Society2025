<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="support_ticket.aspx.cs" Inherits="Society.support_ticket" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="fa-box box-primary">


        <table width="100%">
            <tr>
                <th width="100%">
                    <h1 class=" font-weight-bold " style="color: #012970;">HelpDesk</h1>
                </th>
            </tr>
        </table>
        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:HiddenField ID="society_id" runat="server" />
                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                    <asp:ListItem Value="name">Building Name</asp:ListItem>
                                    <asp:ListItem Value="no_of_floore">Floor</asp:ListItem>

                                </asp:DropDownList>&nbsp;&nbsp;
                       
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeHolder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                            <asp:CheckBox runat="server" Text="Urgent" CssClass="mr-2" />
                                <asp:Button ID="btn_search" runat="server" class="btn btn-primary" CausesValidation="False" Text="Search" UseSubmitBehavior="False" />
                            </asp:Panel>
                                &nbsp;&nbsp;
                            </div>

                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <div style="width: 100%; overflow: auto;">
                                            <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageIndex="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Helpdesk_id" ItemStyle-Width="30" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Bind("helpdesk_id") %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="100" SortExpression="name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="build_id" runat="server" Text='<%# Bind("build_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit" ItemStyle-Width="200" SortExpression="print_name">
                                                        <ItemTemplate>

                                                            <asp:Label ID="address1" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Type" ItemStyle-Width="200" SortExpression="print_name">
                                                        <ItemTemplate>

                                                            <asp:Label ID="address1" runat="server" Text="p_type_name"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Query" ItemStyle-Width="100" SortExpression="no_of_floore">
                                                        <ItemTemplate>
                                                            <asp:Label ID="c_address" runat="server" Text='<%# Bind("query") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Requested Service Date" ItemStyle-Width="200" SortExpression="address1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="mobile_no" runat="server" Text='<%# Bind("req_service_date", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="200" SortExpression="address1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="status" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Comments" ItemStyle-Width="200" SortExpression="address1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="comments" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Urgency" ItemStyle-Width="200" SortExpression="address1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="urgency" runat="server" Text='<%# (Eval("urgency").ToString() == "0" ? "Minor" : "Urgent") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
