<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt_search_form.aspx.cs" Inherits="Society.receipt_search_form" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .resized-model {
            width: 800px;
            height: auto;
            right: 82px;
        }

        @media(max-width: 431px) {
            .resized-model {
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
                    window.location.href = 'receipt_search_form.aspx';
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
                            <h1 class=" font-weight-bold " style="color: #012970;">Receipts🧾</h1>
                        </th>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                        <asp:HiddenField ID="receipt_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="build_id" runat="server" />
                        <asp:HiddenField ID="n_m_id" runat="server" />

                        <asp:HiddenField ID="shop_maint_id" runat="server" />
                        <asp:HiddenField ID="wing_id" runat="server" />
                        <asp:HiddenField ID="owner_id" runat="server" />

                        <div class="form-group">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">
                                        <div class="search-container">

                                            <asp:TextBox
                                                ID="txt_search"
                                                CssClass="aspNetTextBox"
                                                placeHolder="Search here"
                                                runat="server"
                                                TextMode="Search"
                                                AutoPostBack="true"
                                                OnTextChanged="btn_search_Click"
                                                onkeyup="removeFocusAfterTyping()" />

                                            <ajaxToolkit:CalendarExtender
                                                ID="CalendarExtender1"
                                                runat="server"
                                                TargetControlID="txt_search"
                                                PopupButtonID="btn_calendar"
                                                Format="dd-MMM-yyyy" />

                                            <!-- Calendar and Search Buttons -->
                                            <div class="input-buttons">
                                                <img
                                                    id="btn_calendar"
                                                    src="img/calendar.png"
                                                    alt="Pick Date"
                                                    class="calendar-icon"
                                                    style="cursor: pointer;" />

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
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">


                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">


                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receipt" SortExpression="receipt_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="receipt_no" runat="server" Text='<%# Bind("receipt_no")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building Name" SortExpression="build_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="b_id" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Wing" SortExpression="w_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name1" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Received Amount" SortExpression="received_amt">
                                                    <ItemTemplate>
                                                        <asp:Label ID="received_amt" runat="server" Text='<%# Bind("received_amt")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payment Mode" SortExpression="pay_mode_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="pay_mode_name" runat="server" Text='<%# Bind("pay_mode_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date" SortExpression="date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="date" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Print" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" ID="save" OnCommand="print_save_Command" Text="Print" Visible="true" UseSubmitBehavior="false" CommandName="Update" CommandArgument='<%# Bind("receipt_id")%>'></asp:Button>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("receipt_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>


                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>


                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content resized-model">
                            <div class="modal-header">

                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Receipt</strong></h4>
                                <asp:Label ID="receipt_no" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                            </div>


                            <div class="modal-body" id="invoice_data">

                                <div class="form-group">
                                    <div class="alert alert-danger danger" style="display: none;"></div>
                                </div>
                                <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <asp:HiddenField ID="building_id" runat="server" />
                                        <asp:HiddenField ID="wing_name_id" runat="server" />
                                        <asp:HiddenField ID="owner_name_id" runat="server" />
                                        <asp:HiddenField ID="pay_mode_id" runat="server" />

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label13" runat="server" Text="Building  Name"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer1" class="suggestion-list" style="width: 100%;">
                                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand1">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("name") %>'
                                                                        CommandArgument='<%# Eval("build_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setTextBox1(this.innerText);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                        Text="No items found." />
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_date" runat="server" Text="Date :"></asp:Label>
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_date" CssClass="form-control" runat="server" Height="32px" Width="150px" TextMode="Date" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Date
                                                    </div>


                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label16" runat="server" Text="Wing Name"></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer2" class="suggestion-list" style="width: 100%;">
                                                            <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("w_name") %>'
                                                                        CommandArgument='<%# Eval("wing_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setTextBox2(this.innerText);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                        Text="No items found." />
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_cust_name" runat="server" Text="Owner Name"></asp:Label>
                                                    <asp:Label ID="lbl_cust_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer3" class="suggestion-list" style="width: 100%;">
                                                            <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand3">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("name") %>'
                                                                        CommandArgument='<%# Eval("owner_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setTextBox3(this.innerText);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                        Text="No items found." />
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-6 d-flex" style="align-items: center; justify-content: space-evenly;">
                                                    <asp:CheckBox Checked="true" ID="CheckBox1" runat="server" Text="Regular" AutoPostBack="true" OnCheckedChanged="CheckBoxes_CheckedChanged" />

                                                    <asp:CheckBox ID="CheckBox2" runat="server" Text="Add on" AutoPostBack="true" OnCheckedChanged="CheckBoxes_CheckedChanged" />

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">


                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label6" runat="server" Text="Receivable Amount"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_amount" runat="server" Height="32px" Width="150px" placeholder="Enter Amount" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_pay_status" runat="server" Text="Pay Mode"></asp:Label>
                                                    <asp:Label ID="lbl_pay_status_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer4" class="suggestion-list" style="width: 100%;">
                                                            <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand4">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("pay_mode") %>'
                                                                        CommandArgument='<%# Eval("pay_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setTextBox4(this.innerText);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                        Text="No items found." />
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <asp:Panel ID="panel3" runat="server" Visible="false">
                                            <div class="form-group">
                                             <div class="row">
    <!-- Label -->
    <div class="col-sm-2">
        <asp:Label ID="Label21" runat="server" Text="Enter UPI:"></asp:Label>
        <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red"></asp:Label>
    </div>

    <!-- Input -->
    <div class="col-sm-4">
        <asp:TextBox ID="txt_upi" CssClass="form-control" required Width="200px" Height="32px" runat="server"></asp:TextBox>
        <div class="invalid-feedback">
            Please Enter UPI
        </div>
    </div>

    <!-- Small Blank Column -->
    <div class="col-sm-1">
        <!-- Blank spacing -->
    </div>

    <!-- Button -->
    <div class="col-sm-2">
        <asp:Button ID="Button2" runat="server" Height="30px" CssClass="btn btn-primary" Text="Verify & Proceed" />
    </div>
</div>



                                        </asp:Panel>



                                        <asp:Panel ID="panel2" runat="server">
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_chqno" runat="server" Text="Cheque/Draft No"></asp:Label>
                                                        <asp:Label ID="lbl_chqno_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_chq" runat="server" Height="32px" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="txt_chqno_SelectedIndexChanged" />
                                                        <asp:TextBox ID="txt_chqno" runat="server" Height="32px" Width="150px" placeholder="Cheque No"></asp:TextBox>
                                                    </div>


                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_chqdate" runat="server" Text="Cheque Date"></asp:Label>
                                                        <asp:Label ID="lbl_chqdate_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_chqdate" runat="server" Enabled="false" Height="32px" Width="150px" TextMode="Date"></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-6"></div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label17" runat="server" Text="Cheque Amount"></asp:Label>
                                                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="che_amount" runat="server" Enabled="false" Height="32px" Width="150px" placeholder="Cheque Amount"></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ID="panel1" runat="server">
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Received Amount"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_received_amt" CssClass="form-control" Height="32px" Width="150px" runat="server" MaxLength="50" placeholder="Received Amount" onkeypress="return digit(event);" required OnTextChanged="txt_received_amt_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Received Amount
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label9" runat="server" Text="Balance"></asp:Label>
                                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_pdc_balance" Height="32px" Width="150px" runat="server" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_remarks" runat="server" Text="Remark"></asp:Label>

                                                    <asp:Label ID="lbl_remarks_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_remarks" runat="server" Style="text-transform: capitalize;" Height="32px" Width="150px" MaxLength="250" placeholder="Enter Remark"></asp:TextBox>
                                                </div>



                                            </div>
                                        </div>

                                        <asp:Label runat="server" ID="building_lbl" Visible="false"></asp:Label>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>


                            <div class="modal-footer">

                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />

                                            <asp:Button ID="btn_print" runat="server" Text="Print" class="btn btn-primary" OnClick="btn_print_Click" CausesValidation="false" />
                                            <asp:Button ID="btn_email" runat="server" Text="Email" class="btn btn-primary" OnClick="btn_email_Click" CausesValidation="false" />
                                        </center>
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





    <script>

        function initDropdownEvents() {

            const textBox1 = document.getElementById("<%= TextBox1.ClientID %>");

        const repeaterContainer1 = document.getElementById("RepeaterContainer1");

        textBox1.addEventListener("focus", function () {

            repeaterContainer1.style.display = "block";
            repeaterContainer2.style.display = "none";
            repeaterContainer3.style.display = "none";

        });

        textBox1.addEventListener("input", function () {

            const input = textBox1.value.toLowerCase();

            filterSuggestions("category-link", input);

        });
        const textBox2 = document.getElementById("<%= TextBox2.ClientID %>");

        const repeaterContainer2 = document.getElementById("RepeaterContainer2");

        textBox2.addEventListener("focus", function () {

            repeaterContainer2.style.display = "block";
            repeaterContainer3.style.display = "none";

        });

        textBox2.addEventListener("input", function () {

            const input = textBox2.value.toLowerCase();

            filterSuggestions("category-link", input);

        });
        const textBox3 = document.getElementById("<%= TextBox3.ClientID %>");

        const repeaterContainer3 = document.getElementById("RepeaterContainer3");

        textBox3.addEventListener("focus", function () {

            repeaterContainer3.style.display = "block";

        });

        textBox3.addEventListener("input", function () {

            const input = textBox3.value.toLowerCase();

            filterSuggestions("category-link", input);

        });
        const textBox4 = document.getElementById("<%= TextBox4.ClientID %>");

            const repeaterContainer4 = document.getElementById("RepeaterContainer4");

            textBox4.addEventListener("focus", function () {

                repeaterContainer4.style.display = "block";

            });

            textBox4.addEventListener("input", function () {

                const input = textBox4.value.toLowerCase();

                filterSuggestions("category-link", input);

            });

        }




        function filterSuggestions(className, value) {

            const items = document.querySelectorAll("." + className);

            let matchFound = false;

            items.forEach(item => {

                if (item.innerText.toLowerCase().includes(value.toLowerCase())) {

                    item.style.display = "block";

                    matchFound = true;

                } else {

                    item.style.display = "none";

                }

            });

            let noMatchMessage = document.getElementById("no-match-message");

            if (!matchFound) {

                if (!noMatchMessage) {

                    noMatchMessage = document.createElement("div");

                    noMatchMessage.id = "no-match-message";

                    noMatchMessage.innerText = "No matching suggestions.";

                    items[0]?.parentNode?.appendChild(noMatchMessage);

                }

                noMatchMessage.style.display = "block";

            } else {

                if (noMatchMessage) {

                    noMatchMessage.style.display = "none";

                }

            }

        }

        function setTextBox1(value) {

            document.getElementById("<%= TextBox1.ClientID %>").value = value;
    document.getElementById("<%= TextBox2.ClientID %>").value = "";
    document.getElementById("<%= TextBox3.ClientID %>").value = "";

            document.getElementById("RepeaterContainer1").style.display = "none";

        }
        function setTextBox2(value) {

            document.getElementById("<%= TextBox2.ClientID %>").value = value;
    document.getElementById("<%= TextBox3.ClientID %>").value = "";

            document.getElementById("RepeaterContainer2").style.display = "none";

        }
        function setTextBox3(value) {

            document.getElementById("<%= TextBox3.ClientID %>").value = value;

            document.getElementById("RepeaterContainer3").style.display = "none";

        }
        function setTextBox4(value) {

            document.getElementById("<%= TextBox4.ClientID %>").value = value;

            document.getElementById("RepeaterContainer4").style.display = "none";

        }


        Sys.Application.add_load(initDropdownEvents);


    </script>

</asp:Content>
