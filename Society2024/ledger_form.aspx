<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ledger_form.aspx.cs" Inherits="Society.ledger" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type='text/javascript'>
        function openModal() {
            $('#edit').modal('show');
        }
    </script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function SuccessEntry() {
            Swal.fire({
                title: '✅ Success!',
                text: 'Saved Successfully',
                icon: 'success',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK',
                timer: 3000,
                timerProgressBar: true,

                didOpen: () => {
                    Swal.showLoading()
                },
                willClose: () => {
                    window.location.href = 'ledger_form.aspx';
                }
            });
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                 <table width="100%">
                        <tr>
                            <th width="100%" class="">
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Events
                                </h1>
                            </th>
                        </tr>
                    </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
  <ContentTemplate>
                <asp:HiddenField ID="led_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                  
                <div class="form-group">
                   <div class="col-12">
                   <div class="d-flex align-items-center">
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="led_description">Name</asp:ListItem>
                                <asp:ListItem Value="date">Ledger Date</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp
                   
                            
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" runat="server" Style="text-transform: capitalize;" placeholder="Search Here"></asp:TextBox>&nbsp;&nbsp
                   
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit">Add</button>
                      </div>
                       </div>
                </div>
                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageIndex="15" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnSorting="GridView1_Sorting">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="led_id" ItemStyle-Width="50" SortExpression="name" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="led_id" runat="server" Text='<%# Bind("led_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description" Visible="true" SortExpression="led_description">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="led_description" Text='<%# Bind("led_description")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" Visible="true" SortExpression="led_status">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="led_status" Text='<%# Bind("led_status")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ledger Date" Visible="true" SortExpression="date">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="led_date" Text='<%# Bind("date","{0:dd-MMM-yyyy}")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit1" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("led_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="Delete" ItemStyle-Width="50">
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
                        </ContentTemplate></asp:UpdatePanel>
                <div class="modal fade bs-example-modal-sm" id="edit" role="form" aria-labelledby="mymodel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: auto">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystem"><strong>New Ledger</strong></h4>
                            </div>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <div class="modal-body" id="invoice_data">
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label1" runat="server" Text="Description:"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_des" Width="200px" Height="32px" placeholder="Enter Description" runat="server" TextMode="MultiLine" required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label3" runat="server" Text="Status:"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:RadioButton ID="radiobtn1" runat="server" Text="Active" GroupName="led_status" ToolTip="Ledger Active Status" Checked="true"></asp:RadioButton>&nbsp;&nbsp;
                                            <asp:RadioButton ID="radiobtn2" runat="server" Text="Inactive" GroupName="led_status" ToolTip="Ledger Inactive Status"></asp:RadioButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <center>
                                                    <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                                                    <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" OnClientClick="return confirm('Are you sure want to delete?');" runat="server" Text="Delete" OnClick="btn_delete_Click" />
                                                    <asp:Button ID="btn_close" class="btn btn-primary" runat="server" Text="Close" UseSubmitBehavior="False" OnClick="btn_close_Click" />
                                                </center>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>

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
