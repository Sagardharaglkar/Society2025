<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_charges_monthwise.aspx.cs" Inherits="Society.society_charges_monthwise" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />

    <style>
        .resized-model{
        width: 529px;
    height: auto;
    right: 82px;
}

@media(max-width: 431px){
   .resized-model{
       height: auto;
    margin: auto;
    width: 292px;
    margin-top: 168px;
    right: 1px;
   }
}
    </style>
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
                    window.location.href = ' society_charges_monthwise.aspx';
                }
            });
        }

        function openModal() {
            $('#edit_model').modal('show');
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="font-weight-bold" style="color: #012970;">Monthwise Charges</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="mon_charge_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="server" />
                        <%--<div class="form-group" style="display:none;">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <asp:DropDownList Visible="false" ID="search_field" runat="server" Width="200px" Height="32px">
                                            <asp:ListItem Value="amount">Amount</asp:ListItem>
                                            <asp:ListItem Value="pending_amount">Pending Amount</asp:ListItem>
                                            <asp:ListItem Value="date">Date</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;

                                        <asp:Panel Visible="false" ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                            <asp:TextBox ID="txt_search1" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" Text="Search" OnClick="btn_search_Click" UseSubmitBehavior="False" />
                                        </asp:Panel>

                                        <div class="position-relative" style="width: 209px;">
                                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeHolder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                            <button style="position: absolute; right: 0px; padding: 0 6px; border-radius: 0 7px 7px 0; background-color: #0D6EFD; height: 32px;" onclick="btn_search_Click">
                                                <span class="material-symbols-outlined" style="color: white; margin-top: 1px;">search</span>
                                            </button>
                                        </div>
                                        &nbsp;&nbsp;
                                        <asp:Button runat="server" CssClass="btn btn-primary" data-toggle="modal" data-target="#edit_model" Text="Add" />
                                    </div>
                                </div>
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <div class="search-container">
                                            <asp:TextBox
                                                ID="txt_search"
                                                CssClass="aspNetTextBox"
                                                placeHolder="Search here"
                                                runat="server" TextMode="Search" />

                                            <button
                                                id="btn_search"
                                                type="submit"
                                                class="search-button"
                                                runat="server"
                                                onserverclick="btn_search_Click">
                                                <span class="material-symbols-outlined">search</span>
                                            </button>
                                        </div>
                                        &nbsp;&nbsp;

                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="id" ItemStyle-Width="100" SortExpression="id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="mon_charge_id" runat="server" Text='<%# Bind("mon_charge_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="300" SortExpression="amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Pending Amount" ItemStyle-Width="150" SortExpression="pending_amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="pending_amount" runat="server" Text='<%# Bind("pending_amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Date" ItemStyle-Width="150" SortExpression="date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="date" runat="server" Text='<%# Bind("date","{0:dd-MMM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-Width="50" HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("mon_charge_id")%>'><img src="Images/123.png" /></asp:LinkButton>
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
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="modal fade bs-example-modal-sm" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content resized-model">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>New Charges Monthwise</strong></h4>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="alert alert-danger danger" style="display: none;"></div>
                                </div>

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="Label2" runat="server" Text="Amount :"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txt_amt" runat="server" Width="200px" Height="32px" Enabled="false" placeholder="Enter Amount" required autofocus></asp:TextBox>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="Label5" runat="server" Text="Due Amount :"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txt_pen_amt" runat="server" Width="200px" Height="32px" Enabled="false" placeholder="Enter pending Amount" required autofocus></asp:TextBox>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="Label8" runat="server" Text="Total Amount  :"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txt_total" CssClass="form-control" runat="server" Width="200px" Height="32px" required="required"></asp:TextBox>
                                                    <div class="invalid-feedback">Please Enter Total Amount</div>
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
                                            <asp:Button ID="btn_save" OnClientClick="disableSaveButtonIfValid();" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" runat="server" Visible="false" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" Text="Delete" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function disableSaveButtonIfValid() {
            console.log("Button Clicked");
            var btn = document.getElementById('<%= btn_save.ClientID %>');
            var modal = document.getElementById('edit_model');
            var inputs = modal.querySelectorAll('input[required], select[required]');
            var allValid = true;

            inputs.forEach(function (input) {
                if (!input.checkValidity()) {
                    allValid = false;
                }
            });

            if (allValid && btn) {
                btn.disabled = true;
                btn.value = "Saving...";
                __doPostBack('<%= btn_save.UniqueID %>', '');
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
