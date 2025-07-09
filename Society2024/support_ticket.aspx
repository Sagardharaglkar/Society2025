<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="support_ticket.aspx.cs" Inherits="Society.support_ticket" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function openModal() {
            console.log("clicked");
            $('#commentsModal').modal('show');
        }

    </script>

    <div class="box-primary">
        <table width="100%">
            <tr>
                <th width="100%">
                    <h1 class="font-weight-bold" style="color: #012970;">HelpDesk</h1>
                </th>
            </tr>
        </table>

        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:HiddenField ID="society_id" runat="server" />

                <div class="form-group">
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex align-items-center">
                                <div class="search-container">
                                    <asp:TextBox
                                        ID="txt_search"
                                        CssClass="aspNetTextBox"
                                        PlaceHolder="Search here"
                                        runat="server"
                                        TextMode="Search"
                                        AutoPostBack="true"
                                        OnTextChanged="btn_search_Click"
                                        onkeyup="removeFocusAfterTyping()" />

                                    <div class="input-buttons">
                                        <button
                                            id="btn_search"
                                            type="submit"
                                            class="search-button2"
                                            runat="server"
                                            onserverclick="btn_search_Click">
                                            <span class="material-symbols-outlined">search</span>
                                        </button>
                                    </div>
                                </div>

                                &nbsp;&nbsp;
                                <asp:CheckBox runat="server" Text="Urgent" CssClass="mr-2" />
                            </div>
                        </div>
                    </div>
                </div>

                <br /><br />

                <div class="form-group">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView
                                ID="GridView1"
                                runat="server"
                                AllowPaging="true"
                                AllowSorting="true"
                                PageSize="15"
                                AutoGenerateColumns="false"
                                OnPageIndexChanging="GridView1_PageIndexChanging"
                                OnRowCommand="GridView1_RowCommand"
                                CssClass="table table-bordered table-hover table-striped"
                                HeaderStyle-BackColor="lightblue"
                                ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Record Found">

                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Helpdesk_id" ItemStyle-Width="30" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHelpdeskId" Text='<%# Bind("helpdesk_id") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Building Name" ItemStyle-Width="100" SortExpression="name">
                                        <ItemTemplate>
                                            <asp:Label ID="build_id" runat="server" Text='<%# Bind("build_name") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Unit" ItemStyle-Width="200" SortExpression="print_name">
                                        <ItemTemplate>
                                            <asp:Label ID="unit" runat="server" Text='<%# Bind("unit") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Type" ItemStyle-Width="200" SortExpression="print_name">
                                        <ItemTemplate>
                                            <asp:Label ID="type" runat="server" Text='<%# Bind("p_type_name") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Query" ItemStyle-Width="100" SortExpression="no_of_floore">
                                        <ItemTemplate>
                                            <asp:Label ID="query" runat="server" Text='<%# Bind("query") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Requested Service Date" ItemStyle-Width="200" SortExpression="address1">
                                        <ItemTemplate>
                                            <asp:Label ID="reqServiceDate" runat="server" Text='<%# Bind("req_service_date", "{0:yyyy-MM-dd}") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="200" SortExpression="address1">
                                        <ItemTemplate>
                                            <asp:Label ID="status" runat="server" Text='<%# Bind("status") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Comments" ItemStyle-Width="80">
                                        <ItemTemplate>
                                            <asp:Button
                                                ID="btnComments"
                                                runat="server"
                                                Text="View"
                                                CssClass="btn btn-info btn-sm"
                                                CommandName="ShowComments"
                                                CommandArgument='<%# Eval("helpdesk_id") %>'
                                                OnClientClick="openModal();" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Urgency" ItemStyle-Width="200" SortExpression="address1">
                                        <ItemTemplate>
                                            <asp:Label ID="urgency" runat="server" Text='<%# (Eval("urgency").ToString() == "0" ? "Minor" : "Urgent") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Comments Modal -->
<%--        <div class="modal fade" id="commentsModal" tabindex="-1" role="dialog" aria-labelledby="commentsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="commentsModalLabel">Comments</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server" ID="upComments">
                            <ContentTemplate>
                                <asp:HiddenField ID="hfHelpdeskId" runat="server" />
                                <div id="chatBox" style="max-height: 300px; overflow-y: auto;">
                                    <asp:Repeater ID="rptComments" runat="server">
                                        <ItemTemplate>
                                            <div class="mb-2">
                                                <span class="badge badge-secondary"><%# Eval("UserName") %></span>
                                                <span class="text-muted" style="font-size: smaller;"><%# Eval("CommentDate", "{0:yyyy-MM-dd HH:mm}") %></span>
                                                <div><%# Eval("CommentText") %></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="input-group mt-3">
                                    <asp:TextBox ID="txtNewComment" runat="server" CssClass="form-control" placeholder="Type your comment..."></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="btnAddComment" runat="server" Text="Send" CssClass="btn btn-primary" OnClick="btnAddComment_Click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
