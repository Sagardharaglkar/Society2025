<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff_role.aspx.cs" Inherits="Society2024.staff_role" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type='text/javascript'>
        function openModal() {
            $('#edit').modal('show');
        }
    </script>



    <input type="hidden" name="confirm_value" id="confirm_value" />

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Staff Role</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:HiddenField ID="role_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <div class="form-group">
                    <div class="col-12">
                           <div class="d-flex align-items-center">

                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="role">Role</asp:ListItem>

                        </asp:DropDownList>&nbsp;&nbsp;

                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="search" CssClass="d-flex align-items-center me-2">
                       
                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" Style="text-transform: capitalize;" runat="server" placeholder="Search Here"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="search" runat="server" class="btn btn-primary" Text="Search" OnClick="search_Click" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                       
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit">New Entry</button>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" ShowHeaderWhenEmpty="true" AllowSorting="true" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" HeaderStyle-BackColor="lightblue">

                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="led_id" SortExpression="name" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="role_id" runat="server" Text='<%# Bind("role_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Role" Visible="true" SortExpression="role">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="led_description" Text='<%# Bind("role")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">                                          
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit1" OnCommand="edit1_Command" CommandName="Update" CommandArgument='<%# Bind("role_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade bs-example-modal-sm" id="edit" role="form" aria-labelledby="mymodel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: auto">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystem"><strong>New Role</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label2" runat="server" Text="Role:"></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txt_role" Width="200px" Height="32px" Style="text-transform: capitalize;" OnTextChanged="txt_role_TextChanged" placeholder="Enter Role" AutoPostBack="true" runat="server" required></asp:TextBox>
                                             <asp:Label ID="Label4" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <center>
                                        <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                                        <%--  <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClick="btn_delete_Click" />--%>
                                        <asp:Button ID="btn_close" class="btn btn-primary" runat="server" Text="Close" OnClick="btn_close_Click" UseSubmitBehavior="false" OnClientClick="if (confirm('Are you sure you want to Close?')) { __doPostBack('<%= btn_close.UniqueID %>', ''); } return true;" />
                                    </center>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
