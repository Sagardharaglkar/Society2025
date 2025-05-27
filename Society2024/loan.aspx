<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loan.aspx.cs" Inherits="Society.loan" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function openModal() {
            $('#edit_model').modal('show');
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
                    window.location.href = 'loan.aspx';
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
                        <asp:HiddenField ID="loan_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="bank">Bank Name</asp:ListItem>
                                            <asp:ListItem Value="loan_clearance">Loan Clearance</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp
                        
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">

                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp
                    
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp
                        </asp:Panel>

                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>

                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageIndex="15" ID="GridView1"  runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="50px" SortExpression="No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="loan_id" SortExpression="loan_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="loan_id" runat="server" Text='<%# Bind("loan_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bank Name" SortExpression="bank">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblff" runat="server" Text='<%# Bind("bank")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Loan Clearance" ItemStyle-Width="250px" SortExpression="loan_clearance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lfhf" runat="server" Text='<%# Bind("loan_clearance","{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("loan_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50px">
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
                        <div class="modal-content" style="height: auto; width: auto">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Add Loan & Lien</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <div class="form-group">
                                            <div class="alert alert-danger danger" style="display: none;"></div>
                                        </div>

                                        <label>Flat Number:<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddl_flat" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required></asp:DropDownList>
                                            <asp:CompareValidator ControlToValidate="ddl_flat" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                        </div>

                                        <label>Name of the Bank:<asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:TextBox ID="txt_bank" Font-Bold="true" Style="text-transform: capitalize;" placeholder="Enter Bank Name" runat="server" required class="form-control"></asp:TextBox>
                                        </div>

                                        <label>Type of Loan:<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddl_loan" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_loan_SelectedIndexChanged" parsley-trigger="change" BackColor="WhiteSmoke"></asp:DropDownList>
                                            <asp:CompareValidator ControlToValidate="ddl_loan" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Type of Loan" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                        </div>

                                        <asp:Panel ID="Panel2" Visible="false" runat="server">
                                            <label class="specifyOthers">Specify Other:</label>
                                            <div class="form-group">
                                                <asp:TextBox ID="txt_other" Font-Bold="true" runat="server" Style="text-transform: capitalize;" class="form-control" required></asp:TextBox>
                                            </div>
                                        </asp:Panel>

                                        <label>First NOC Issue By:<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddl_noc" runat="server" class="form-control" parsely-trigger="change" BackColor="WhiteSmoke" required>
                                                <asp:ListItem>select</asp:ListItem>
                                                <asp:ListItem>Society</asp:ListItem>
                                                <asp:ListItem>Builder</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:CompareValidator ControlToValidate="ddl_noc" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select First NOC Issued By" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                        </div>

                                        <label>Society NOC Date:<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:TextBox ID="txt_noc_society" Font-Bold="true" runat="server" TextMode="Date" class="form-control" required></asp:TextBox>
                                        </div>

                                        <asp:Panel ID="Panel1" Visible="false" runat="server">
                                            <div class="form-group">
                                                <label>Date of Loan Clearance:<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                                <asp:TextBox ID="txt_loan_clear" Font-Bold="true" TextMode="Date" runat="server" class="form-control" required></asp:TextBox>
                                            </div>
                                        </asp:Panel>

                                        <label>Share Certificate With:<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label></label>
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddl_certificate" runat="server" class="form-control" BackColor="WhiteSmoke" parsley-trigger="change" required></asp:DropDownList>
                                            <asp:CompareValidator ControlToValidate="ddl_certificate" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select NOC" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
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
                                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" ValidationGroup="g1" class="btn btn-primary" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="close_Click" UseSubmitBehavior="False" />
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
</asp:Content>
