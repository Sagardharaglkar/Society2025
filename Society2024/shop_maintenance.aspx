<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop_maintenance.aspx.cs" Inherits="Society.shop_maintenance" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type='text/javascript'>
        function openModal() {
            $('#edit').modal('show');
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

    </script>
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Shop Maintenance</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:HiddenField ID="shop_maint_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

                <div class="form-group">
                    <div class="row ">
                         <div class="col-12">
                        <div class="d-flex align-items-center">

                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="mrep_no">Recipt No</asp:ListItem>
                                <asp:ListItem Value="m_date"> Date</asp:ListItem>
                                <asp:ListItem Value="led_description">Ledger</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp; 
                      
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" Style="text-transform: capitalize;" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp; 
                        
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                       
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit">New Entry</button>
                       </div>
                       </div>
                    </div>
                  </div>
               
                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" EmptyDataText="No Records found" ShowHeaderWhenEmpty="true">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="m_id" SortExpression="name" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="shop_maint_id" runat="server" Text='<%# Bind("shop_maint_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Recipt No" Visible="true" SortExpression="mrep_no">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="mrep_no" Text='<%# Bind("mrep_no")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" Visible="true" SortExpression="m_date">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="m_date" Text='<%# Bind("m_date","{0:yyyy-MM-dd}")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ledger" Visible="true" SortExpression="led_id">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="led_id" Text='<%# Bind("led_description")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit1" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("shop_maint_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                        <ItemTemplate >
                                            <asp:LinkButton runat="server" ID="edit551" CommandName="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" ><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
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
                        <div class="modal-content" style="height: auto; width: 800px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystem"><strong>Shop Maintenance</strong></h4>
                            </div>
                            <d class="modal-body" id="invoice_data">
                                <asp:UpdatePanel ID="updatepnl" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label6" runat="server" Text="Receipt No:"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_recipt" Width="200px" Height="32px" placeholder="Enter Receipt No" OnTextChanged="txt_recipt_TextChanged" onkeypress="return digit(event);" runat="server" AutoPostBack="true" required Autofocus></asp:TextBox>
                                                    </br>
                                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label2" runat="server" Text="Date:"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_date" required Width="200px" Height="32px" TextMode="Date" runat="server"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label4" runat="server" Text="Ledger:"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_ledger" Width="200px" Height="32px" parsely-trigger="change" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_ledger" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select The Ledger" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label8" runat="server" Text="Payment Method"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_method" Width="200px" Height="32px" runat="server" parsely-trigger="change" OnSelectedIndexChanged="ddl_method_SelectedIndexChanged" AutoPostBack="true" required>
                                                        <asp:ListItem Value="select">Select</asp:ListItem>
                                                        <asp:ListItem>Cash</asp:ListItem>
                                                        <asp:ListItem>UPI Payment</asp:ListItem>
                                                        <asp:ListItem>Cheque No</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:CompareValidator ControlToValidate="ddl_method" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Payment Method" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>

                                            </div>
                                        </div>
                                        <asp:Panel ID="panel2" runat="server">
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="lbl_chqno" runat="server" Text="Cheque/Draft No"></asp:Label>
                                                        <asp:Label ID="lbl_chqno_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_chqno" runat="server" Width="200px" Height="32px" MaxLength="50" placeholder="Cheque/Draft No." required></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="lbl_chqdate" runat="server" Text="Cheque Details"></asp:Label>
                                                        <asp:Label ID="lbl_chqdate_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_chqdate" runat="server" Width="200px" Height="32px" TextMode="Date" required></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="panel3" runat="server">
                                            <div class="form-group">
                                                <div class="row ">


                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label12" runat="server" Text="Enter UPI:"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_upi" required Width="200px" Height="32px" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Button ID="Button2" runat="server" Height="30px" CssClass="btn btn-primary" Text="Verify & Proceed" />
                                                </div>

                                            </div>


                                        </asp:Panel>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label9" runat="server" Text=" Ledger Details"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_details" placeholder="Enter Ledger Details" Width="200px" Height="32px" runat="server" required></asp:TextBox>
                                                </div>


                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text=" Amount:"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_amt" placeholder="Enter The Amount" Width="200px" Height="32px" onkeypress="return digit(event);" runat="server" required></asp:TextBox>
                                                </div>


                                            </div>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>


                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_print" runat="server" Text="Print" class="btn btn-primary" OnClick="btn_print_Click" />
                                            <asp:Button ID="btn_close" class="btn btn-primary" runat="server" Text="Close" UseSubmitBehavior="False" OnClick="btn_close_Click" />
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

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
