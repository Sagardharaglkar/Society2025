<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_charges_monthwise.aspx.cs" Inherits="Society2024.society_charges" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
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
    </script>


    <script type='text/javascript'>
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


                            <h1 class=" font-weight-bold " style="color: #012970;">Monthwise Charges</h1>

                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="mon_charge_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                <div class="form-group">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">

                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                            <asp:ListItem Value="amount">Amount</asp:ListItem>
                                            <asp:ListItem Value="pending_amount">Pending Amount</asp:ListItem>
                                            <asp:ListItem Value="date">Date</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;
                    
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" Text="Search" OnClick="btn_search_Click" UseSubmitBehavior="False" />
                        </asp:Panel>
                                        &nbsp;&nbsp;
                        <%--<asp:Button runat="server" type="button" class="btn btn-primary" OnClick="Unnamed_Click">New Entry</asp:Button>--%>
                                        <asp:Button runat="server" OnClick="Unnamed_Click" CssClass="btn btn-primary" Text="Add" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <div style="width: 80%; overflow: auto;">
                                            <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageIndex="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">

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
                                                            <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-Width="50" HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                    <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
       
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content" style="height: auto; width: 500px;">
                            <div class="modal-header">
                              
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Charges Monthwise</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                         <ContentTemplate>
                                                 
        <div class="form-group">
            <div class="row ">
                <div class="col-sm-5">
                   
<asp:Label ID="Label2" runat="server" Text="Amount :"></asp:Label>
                    
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                </div>
                <div class="col-sm-7">
                    <asp:TextBox ID="txt_amt"  runat="server" class="form-control" Width="200px" Height="32px" Enabled="false" placeholder="Enter Amount" required autofocus ></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </div>

            </div>
        </div>

         <div class="form-group">
            <div class="row ">
                <div class="col-sm-5">
                   
<asp:Label ID="Label5" runat="server" Text="Due Amount :"></asp:Label>
                    
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                </div>
                <div class="col-sm-7">
                    <asp:TextBox ID="txt_pen_amt"  runat="server" class="form-control" Width="200px" Height="32px" Enabled="false" placeholder="Enter pending Amount" required autofocus ></asp:TextBox>
                    <asp:Label ID="Label7" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </div>

            </div>
        </div>

         <div class="form-group">
            <div class="row ">
                <div class="col-sm-5">
                   
<asp:Label ID="Label8" runat="server" Text="Total Amount  :"></asp:Label>
                    
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                </div>
                <div class="col-sm-7">
                    <asp:TextBox ID="txt_total" CssClass="Form-control"  runat="server" class="form-control" Width="200px" Height="32px"  required ></asp:TextBox>
                    <asp:Label ID="Label10" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                    <div class="invalid-feedback">
                        Please Enter Total Amount
                    </div>
                    
                </div>

            </div>
        </div>
    </ContentTemplate>
                                    </asp:UpdatePanel>





                                    <div class="modal-footer">
                                        <div class="form-group">
                                            <div class="row ">
                                                <center>
                                                    <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                                    <asp:Button ID="btn_delete" class="btn btn-primary" runat="server" Visible="false" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" Text="Delete" />
                                                    <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-body -->
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </div>
    </div>
</asp:Content>
