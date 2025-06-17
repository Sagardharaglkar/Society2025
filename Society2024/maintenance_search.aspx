<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maintenance_search.aspx.cs" Inherits="Society.maintenance_search" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">

        function openModal() {
            $('#edit_model').modal('show');
        }

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
                    window.location.href = 'maintenance_search.aspx';
                }
            });
        }

        function disableSaveButtonIfValid() {
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

                return false; // prevent default to avoid double postback
            }

            return false; // prevent postback if not valid
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Society Maintenance Bills
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="n_m_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="m_bill_status" runat="Server"></asp:HiddenField>

                        <asp:HiddenField ID="building_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="wing_id" runat="Server"></asp:HiddenField>

                        <div class="form-group">
                            <div class="col-12">
                                <div class="d-flex align-items-center">
                                    <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" AutoPostBack="true" OnSelectedIndexChanged="search_field_SelectedIndexChanged">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem Value="build_name">Building Name</asp:ListItem>
                                        <asp:ListItem Value="year">Year</asp:ListItem>
                                        <asp:ListItem Value="month_name">Month</asp:ListItem>
                                    </asp:DropDownList>&nbsp;&nbsp;
                    
                        <asp:DropDownList ID="drop_build" runat="server" Width="200px" Height="32px"></asp:DropDownList>&nbsp;&nbsp;

                      <asp:Button ID="btn_search" runat="server" Text="Search" Class="btn btn-primary" OnClick="btn_search_Click" UseSubmitBehavior="False" />&nbsp;&nbsp;
                   
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">


                                        <%--<asp:GridView ID="GridView1" Width="100%" runat="server" SkinID="gvSkin" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" AllowPaging="false" OnRowDeleting="GridView1_RowDeleting">--%>
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowDeleting="GridView1_RowDeleting">

                                            <Columns>
                                                <asp:TemplateField HeaderText="No" Visible="true" ItemStyle-Width="80">
                                                    <ItemTemplate>
                                                        <asp:Label ID="No" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="n_m_id" runat="server" Text='<%# Bind("n_m_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Month" ItemStyle-Width="100" SortExpression="month_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="month" runat="server" Text='<%#Bind("month_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Year" ItemStyle-Width="100" SortExpression="year">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Year" runat="server" Text='<%# Bind("year")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building" ItemStyle-Width="350" SortExpression="building_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="building_name" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Wing" ItemStyle-Width="350" SortExpression="wings">
                                                    <ItemTemplate>
                                                        <asp:Label ID="w_name" runat="server" Text='<%# Bind("wings")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bill Date" ItemStyle-Width="200" SortExpression="m_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="m_date" runat="server" Text='<%# Bind("m_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="200" SortExpression="due_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="due_date" runat="server" Text='<%# Bind("due_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="120" SortExpression="m_total">
                                                    <ItemTemplate>
                                                        <asp:Label ID="m_total" runat="server" Text='<%# Bind("m_total")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="100" HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("n_m_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="50" HeaderText="Delete" Visible="false">
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

                <div class="modal fade bs-example-modal-sm" tabindex="-1" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4" style="right: 150px">
                        <div class="modal-content" style="height: auto; width: 1000px;">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>New Maintainance</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel1" runat="server">
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="Medium" Text="Building Name"></asp:Label>
                                                        <asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="dropdown-container">
                                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="input-box form-control"
                                                                placeholder="Select" autocomplete="off" required="required" />
                                                            <div id="RepeaterContainer1" class="suggestion-list" style="width: 306px">
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
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date"></asp:Label>
                                                        <asp:Label ID="Label43" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_date" CssClass="form-control" runat="server" placeholder="Enter Date" required TextMode="Date"></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Date
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Wing"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="dropdown-container">
                                                            <asp:TextBox ID="TextBox6" runat="server" CssClass="input-box form-control"
                                                                placeholder="Select" autocomplete="off" required="required" />
                                                            <div id="RepeaterContainer2" class="suggestion-list" style="width: 306px">
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
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">

                                                    <div class="col-sm-2">

                                                        <asp:Label ID="TextBox2" runat="server" Text="Nature Of Charge" Font-Bold="true" required autofocus></asp:Label>

                                                        <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                    </div>
                                                    <div class="col-sm-2"></div>
                                                    <div class="col-sm-2">

                                                        <asp:Label ID="TextBox3" runat="server" Text="Total Amount" Font-Bold="true" required autofocus></asp:Label>

                                                        <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                    </div>
                                                    <div class="col-sm-1"></div>
                                                    <div class="col-sm-2">

                                                        <asp:Label ID="Label3" runat="server" Text="Amount Per Flat" Font-Bold="true" required autofocus></asp:Label>

                                                        <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div>
                                                <div class="col-sm-2"></div>
                                                <asp:PlaceHolder runat="server" ID="TextBoxPlaceHolder" />
                                                <asp:Panel ID="pnlTextBoxes" runat="server" ClientIDMode="Static"></asp:Panel>
                                            </div>
                                            <hr />
                                            <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="btnAdd_Click" />



                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-2"></div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="TextBox1" runat="server" Text="Total Amount" required autofocus Font-Bold></asp:Label>
                                                        <asp:Label ID="Label45" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_amount" runat="server" placeholder="Amount" Enabled="false" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </asp:Panel>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <div class="pull-center">
                                            <asp:Button ID="btn_save" OnClientClick="disableSaveButtonIfValid();" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_bill" runat="server" Text="Generate Bill" class="btn btn-primary" OnClick="btn_bill_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" Visible="False" />
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailmodal">Email</button>
                                            <asp:Button ID="btn_print" runat="server" Text="Print" class="btn btn-primary" OnClick="btn_print_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>


    <div class="modal fade bs-example-modal-sm" id="emailmodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="height: auto; width: 300px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel1"><strong>Select Customer</strong></h4>
                </div>

                <div class="modal-body">
                    <asp:UpdatePanel ID="assd" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <label>
                                            Select all</label>
                                        <asp:CheckBox ID="CheckAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckAll_CheckedChanged"></asp:CheckBox>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:Panel ID="Panel21" runat="server" ScrollBars="Auto" Height="400px">

                                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" Font-Bold="true"></asp:CheckBoxList>
                                        </asp:Panel>
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
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="pull-left">
                                <asp:Button ID="Button1" runat="server" Text="Close" class="btn btn-default" data-dismiss="modal" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="pull-right">
                                <asp:Button ID="btn_email_send" runat="server" Text="Email" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>



                </div>
            </div>

        </div>
        <!-- /.modal-dialog -->


    </div>


    <script>

        function initDropdownEvents() {

            const textBox1 = document.getElementById("<%= TextBox5.ClientID %>");

            const repeaterContainer1 = document.getElementById("RepeaterContainer1");

            textBox1.addEventListener("focus", function () {

                repeaterContainer1.style.display = "block";
                repeaterContainer2.style.display = "none";

            });

            textBox1.addEventListener("input", function () {

                const input = textBox1.value.toLowerCase();

                filterSuggestions("category-link", input);

            });
            const textBox2 = document.getElementById("<%= TextBox6.ClientID %>");

            const repeaterContainer2 = document.getElementById("RepeaterContainer2");

            textBox2.addEventListener("focus", function () {

                repeaterContainer2.style.display = "block";

            });

            textBox2.addEventListener("input", function () {

                const input = textBox2.value.toLowerCase();

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

            document.getElementById("<%= TextBox5.ClientID %>").value = value;
            document.getElementById("RepeaterContainer1").style.display = "none";
            document.getElementById("<%= TextBox6.ClientID %>").value = "";

        }
        function setTextBox2(value) {

            document.getElementById("<%= TextBox6.ClientID %>").value = value;
            document.getElementById("RepeaterContainer2").style.display = "none";

        }


        Sys.Application.add_load(initDropdownEvents);


    </script>


</asp:Content>
