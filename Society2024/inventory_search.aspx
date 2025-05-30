<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inventory_search.aspx.cs" Inherits="Society.inventory_search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function openModal() {
            $('#edit_model').modal('show');
        }
        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
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
                    window.location.href = 'inventory_search.aspx';
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
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Inventorys
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="inventory_id" runat="server"></asp:HiddenField>
<asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                        <div class="form-group">
                            <div class="col-12">
                                <div class="d-flex align-items-center">
                                    <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                        <asp:ListItem Value="in_name">Name</asp:ListItem>
                                        <asp:ListItem Value="qty">Quantity</asp:ListItem>
                                        <asp:ListItem Value="slot">Slot</asp:ListItem>
                                        <asp:ListItem Value="charges">Charges</asp:ListItem>
                                    </asp:DropDownList>&nbsp;&nbsp
                   
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" Style="text-transform: capitalize;" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp
                   
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp
                                    </asp:Panel>

                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>
                                </div>
                            </div>
                        </div>


                        <asp:GridView ID="GridView1" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" runat="server" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="inventory_id" SortExpression="inventory_id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="inventory_id" runat="server" Text='<%# Bind("inventory_id")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" SortExpression="in_name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="Hy" Text='<%# Bind("in_name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity" SortExpression="qty">
                                    <ItemTemplate>
                                        <asp:Label ID="w_name" runat="server" Text='<%# Bind("qty")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Slot No" SortExpression="slot">
                                    <ItemTemplate>
                                        <asp:Label ID="no_of_cheq" runat="server" Text='<%# Bind("slot")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Charges" SortExpression="charges">
                                    <ItemTemplate>
                                        <asp:Label ID="total_chq_amount" runat="server" Text='<%# Bind("charges")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("inventory_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 700px">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Inventory Details</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_name" runat="server" Text="Inventory Name"></asp:Label>
                                                    <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_name" runat="server" MaxLength="50" Style="text-transform: capitalize;" placeholder="Enter Name" required></asp:TextBox>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text=" Quantity"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_quantity" runat="server" MaxLength="50" onkeypress="return digit(event);" placeholder="Enter Quantity" required></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Slot"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_slot" runat="server" MaxLength="10" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Slot No" required></asp:TextBox>

                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label4" runat="server" Text="Charges (Per Unit)"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_charges" runat="server" MaxLength="10" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Charges" required></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>
                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                        </center>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>




