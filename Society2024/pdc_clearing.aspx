<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pdc_clearing.aspx.cs" Inherits="Society.pdc_clearing" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="id" runat="Server"></asp:HiddenField>
    <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
    <script type="text/javascript">  
        // for check all checkbox  
        function CheckAll(Checkbox) {
            var GridVwHeaderCheckbox = document.getElementById("<%=GridView1.ClientID %>");
            for (i = 1; i < GridVwHeaderCheckbox.rows.length; i++) {
                GridVwHeaderCheckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
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
                timer: 1400,
                timerProgressBar: true,

                didOpen: () => {
                    Swal.showLoading()
                },
                willClose: () => {
                    window.location.href = 'pdc_clearing.aspx';
                }
            });
        }
    </script>
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">PDC Clearing</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="search_button" CssClass="d-flex align-items-center me-2">
                                    <asp:Label ID="lbl_form_date" runat="server" Text="From Date:"></asp:Label>&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>&nbsp;&nbsp;
                   

                        <asp:TextBox ID="txt_form_date" runat="server" TextMode="Date" placeholder="Enter From Date" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask required></asp:TextBox>&nbsp;&nbsp;
                    
                        <asp:Label ID="Label1" runat="server" Text="To Date:"></asp:Label>&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>&nbsp;&nbsp;
                  
                        <asp:TextBox ID="txt_to_date" runat="server" placeholder="Enter To Date" TextMode="Date" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask required></asp:TextBox>&nbsp;&nbsp;
                    
                        <asp:Button ID="search_button" runat="server" Text="Search" class="btn btn-primary" OnClick="search_button_Click" />
                                </asp:Panel>
                                &nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" Visible="False" />
                            </div>
                        </div>
                    </div>
                </div>


                <div>
                    <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" Width="100%" runat="server" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" AllowSorting="true" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="No" SortExpression="no">
                                <ItemTemplate>
                                    <asp:Label ID="account_no" runat="server" Text='<%# Container.DisplayIndex + 1%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="pdc_rem_id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="pdc_rem_id" runat="server" Text='<%#Bind("pdc_rem_id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Owner Name" SortExpression="owner_name">
                                <ItemTemplate>
                                    <asp:Label ID="owner_name" runat="server" Text='<%#Bind("owner_name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cheque Date" SortExpression="che_date">
                                <ItemTemplate>
                                    <asp:Label ID="che_date" runat="server" Text='<%#Bind("che_date", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cheque No" SortExpression="chqno">
                                <ItemTemplate>
                                    <asp:Label ID="cheque_no" runat="server" Text='<%#Bind("chqno")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="che_amount">
                                <ItemTemplate>
                                    <asp:Label ID="che_amount" runat="server" Text='<%#Bind("che_amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Deposited">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_depo" runat="server" AutoPostBack="true" OnCheckedChanged="chk_depo_CheckedChanged" Checked='<%# Eval("che_dep").ToString() == "1" ? true : false %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Returned">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_ret" runat="server" AutoPostBack="true" OnCheckedChanged="chk_ret_CheckedChanged" Checked='<%# Eval("che_ret").ToString() == "1" ? true : false %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bounced">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_can" runat="server" AutoPostBack="true" OnCheckedChanged="chk_can_CheckedChanged" Checked='<%# Eval("che_can").ToString() == "1" ? true : false %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
                <br />
                <%--<div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div class="pull-center">
                            <asp:Button ID="Btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>--%>
            </div>
        </div>
    </div>

</asp:Content>
