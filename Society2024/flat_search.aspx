<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flat_search.aspx.cs" Inherits="Society.flat_search" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        .not-required.valid-field {
            border-color: #1cc88a !important;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%231cc88a' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(.375em + .1875rem) center;
            background-size: calc(.75em + .375rem) calc(.75em + .375rem);
        }

        .not-required.invalid-field {
            border-color: #e74a3b !important;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='none' stroke='%23e74a3b' viewBox='0 0 12 12'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23e74a3b' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(.375em + .1875rem) center;
            background-size: calc(.75em + .375rem) calc(.75em + .375rem);
        }
    </style>
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
                    window.location.href = 'flat_search.aspx';
                }
            });
        }

        function disableSaveButtonIfValid() {
            validateIFSC();
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

                return false;
            }

            return false;
        }

    </script>


    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Flats
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="flat_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="server" />
                        <asp:HiddenField ID="Building_id" runat="server" />
                        <asp:HiddenField ID="flat_type_id" runat="server" />
                        <asp:HiddenField ID="usage_id" runat="server" />
                        <asp:HiddenField ID="Bedroom_id" runat="server" />

                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">

                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged">
                                            <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                            <asp:ListItem Value="bed">Bedrooms</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;
                      
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                 <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" runat="server" placeholder="Search here"></asp:TextBox>&nbsp;&nbsp;
                        
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                             </asp:Panel>
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
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="facility_id" ItemStyle-Width="150px" SortExpression="flat_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="flat_id" runat="server" Text='<%# Bind("flat_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building & Wing Name" ItemStyle-Width="500px" SortExpression="build_wing">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl5" runat="server" Text='<%# Bind("build_wing")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Flat No" ItemStyle-Width="180px" SortExpression="flat_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl2" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bedrooms" ItemStyle-Width="180px" SortExpression="bed">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl4" runat="server" Text='<%# Bind("bed")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Sq.Ft" ItemStyle-Width="180px" SortExpression="sq_ft">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl1" runat="server" Text='<%# Bind("sq_ft")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Types" ItemStyle-Width="180px" SortExpression="flat_type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl8" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Usege" ItemStyle-Width="180px" SortExpression="usage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl12" runat="server" Text='<%# Bind("usage")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("flat_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" Visible="false" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="delete" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
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
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 750px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Add Flat</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label5" runat="server" Text="Building & Wing :"></asp:Label>

                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select Building/Wing" autocomplete="off" Style="width:150px;" required="required"/>
                                                        <div id="RepeaterContainer1" class="suggestion-list" style="width:150px;">
                                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("name") %>'
                                                                        CommandArgument='<%# Eval("wing_id") %>'
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
                                                    <asp:Label ID="lbl_co_name" runat="server" Text="Flat Type :"></asp:Label>

                                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                        <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox2" runat="server" Style="width:150px" CssClass="input-box form-control"
                                                            placeholder="Select " required="required" autocomplete="off" />
                                                        <div id="RepeaterContainer2" class="suggestion-list" style="width:150px;">
                                                            <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand2">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link link2"
                                                                        Text='<%# Eval("flat_type") %>'
                                                                        CommandArgument='<%# Eval("flat_type_id") %>'
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

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label11" runat="server" Text="Flat No "></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_no" CssClass="form-control" Width="150px" Height="30px" Style="text-transform: capitalize;" parsely="trigger" AutoPostBack="true" required OnTextChanged="txt_no_TextChanged" PlaceHolder="Enter Flat Number" runat="server"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Flat No
                                                    </div>
                                                    <br />
                                                    <asp:Label ID="Label20" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label2" runat="server" Text="Usage"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox3" runat="server" Style="width: 150px" CssClass="input-box form-control"
                                                            placeholder="Select Bedroom" required="required" autocomplete="off" />
                                                        <div id="RepeaterContainer3" class="suggestion-list" style="width: 150px;">
                                                            <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand3">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link link3"
                                                                        Text='<%# Eval("usage") %>'
                                                                        CommandArgument='<%# Eval("usage_id") %>'
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
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text="Bedrooms"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox4" runat="server" Style="width: 150px" CssClass="input-box form-control"
                                                            placeholder="Select Usage" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer4" class="suggestion-list" style="width: 150px;">
                                                            <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand4">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link link4"
                                                                        Text='<%# Eval("bed") %>'
                                                                        CommandArgument='<%# Eval("bed_id") %>'
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
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label6" runat="server" Text="Size(Sq.Ft)"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_feet" CssClass="form-control" runat="server" Width="150px" Height="30px" placeholder="Enter size" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Size
                                                    </div>




                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label14" runat="server" Text="Open Terraced(Sq.Ft)"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_terrace" CssClass="not-required" runat="server" Width="150px" Height="30px" placeholder="Enter size"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Size
                                                    </div>

                                                </div>


                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label18" runat="server" Text="InterCom No"></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_intercom" CssClass="not-required" runat="server" Width="150px" Height="30px" placeholder="Enter Number"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter No 
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        <asp:Label runat="server" Visible="false" ID="building_lbl"></asp:Label>
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
                                            <asp:Button ID="btn_save" OnClientClick="disableSaveButtonIfValid();" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />
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

    <br />




    <br />

    <script>
        let formSubmitted = false;


    </script>

   <script type="text/javascript">

       function initDropdownEvents() {
           const textBox1 = document.getElementById("<%= TextBox1.ClientID %>");
           const repeaterContainer1 = document.getElementById("RepeaterContainer1");

           const textBox2 = document.getElementById("<%= TextBox2.ClientID %>");
           const repeaterContainer2 = document.getElementById("RepeaterContainer2");

           const textBox3 = document.getElementById("<%= TextBox3.ClientID %>");
           const repeaterContainer3 = document.getElementById("RepeaterContainer3");


           const textBox4 = document.getElementById("<%= TextBox4.ClientID %>");
           const repeaterContainer4 = document.getElementById("RepeaterContainer4");

           textBox1.addEventListener("focus", function () {
               repeaterContainer1.style.display = "block";
               repeaterContainer2.style.display = "none";
           });

           textBox1.addEventListener("input", function () {
               const input = textBox1.value.toLowerCase();
               filterSuggestions("category-link", input);
           });

           textBox2.addEventListener("focus", function () {
               repeaterContainer2.style.display = "block";
           });

           textBox2.addEventListener("input", function () {
               const input = textBox2.value.toLowerCase();
               filterSuggestions("link2", input);
           });

           textBox3.addEventListener("focus", function () {
               repeaterContainer3.style.display = "block";
           });

           textBox3.addEventListener("input", function () {
               const input = textBox3.value.toLowerCase();
               filterSuggestions("link3", input);
           });

           textBox4.addEventListener("focus", function () {
               repeaterContainer4.style.display = "block";
           });

           textBox4.addEventListener("input", function () {
               const input = textBox4.value.toLowerCase();
               filterSuggestions("link4", input);
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
           document.getElementById("RepeaterContainer1").style.display = "none";
       }

       function setTextBox2(value) {
           document.getElementById("<%= TextBox2.ClientID %>").value = value;
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
