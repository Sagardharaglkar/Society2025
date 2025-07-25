﻿    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parking_allotment_search.aspx.cs" Inherits="Society.parking_allotment_search" MasterPageFile="~/Site.Master" %>


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

        function openModal() {
            $('#edit_model').modal('show');
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }
        function FailedEntry() {
            Swal.fire({
                title: '❌ Failed!',
                text: 'Something went wrong. Please try again.',
                icon: 'error',
                showConfirmButton: true,
                confirmButtonColor: '#d33',
                confirmButtonText: 'Retry',
                timer: 3000,
                timerProgressBar: true,

                didOpen: () => {
                    Swal.showLoading()
                }


            });

        }
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
                    window.location.href = 'parking_allotment_search.aspx';
                }
            });
        }

        function disableSaveButtonIfValid() {
            validateVehicleNumber();
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
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Parking Allotment
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                   <asp:HiddenField ID="parking_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
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
                                onkeyup="removeFocusAfterTyping()"/>                    

                            <!-- Calendar and Search Buttons -->
                            <div class="input-buttons">
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
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">

                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="parking_id" Visible="false" SortExpression="parking_id">

                                                    <ItemTemplate>
                                                        <asp:Label ID="parking_id" runat="server" Text='<%# Bind("parking_id")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="HyperLink1" Text='<%# Bind("name")%>'></asp:Label>

                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("subject")%>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="250px" Visible="true" SortExpression="contact_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Vehical No" ItemStyle-Width="250px" Visible="true" SortExpression="vehicle_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="add1r" runat="server" Text='<%# Bind("vehicle_no")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("parking_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
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
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content resized-model">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Parking Allotment Details</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                 
                                        <asp:HiddenField ID="assign_id" runat="server" />
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_co_name" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" placeholder="Enter Name" required autofocus></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Name
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text="Parking For"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_park_for" runat="server" Height="32px" Width="200px" parsely-trigger="change" AutoPostBack="true" OnSelectedIndexChanged="ddl_park_for_SelectedIndexChanged">
                                                        <asp:ListItem Value="select">Select</asp:ListItem>
                                                        <asp:ListItem>2 Wheeler</asp:ListItem>
                                                        <asp:ListItem>3 Wheeler</asp:ListItem>
                                                        <asp:ListItem>4 Wheeler</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_park_for" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Parking For" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label2" runat="server" Text="Parking Type"></asp:Label>

                                                </div>

                                                <div class="col-sm-4">
                                                    <asp:DropDownList ID="ddl_type" runat="server" Height="32px" Width="200px" AutoPostBack="true" parsely-trigger="change" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged">
                                                        <asp:ListItem Value="select">Select</asp:ListItem>
                                                        <asp:ListItem>Permanent</asp:ListItem>
                                                        <asp:ListItem>Temporary</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_type" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Parking Type" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label3" runat="server" Text="Place Assigned"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox1" runat="server" style="width:84%;" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer1" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("parking_no") %>'
                                                                        CommandArgument='<%# Eval("place_id") %>'
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
                                            </div>
                                        </div>

                                        <asp:Panel ID="Panel1" runat="server">
                                            <div class="form-group">
                                                <div class="row ">

                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label4" runat="server" Text="From Date"></asp:Label>
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_fromdate" Height="32px" Width="200px" required TextMode="Date" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label5" runat="server" Text="To Date"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:TextBox ID="txt_todate" TextMode="Date" Height="32px" Width="200px" required runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                            </div>
                                        </asp:Panel>



                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label6" runat="server" Text="Contact No"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_contact_no" CssClass="form-control" runat= "server" Height="32px" Width="200px" MaxLength="10" placeholder="Enter Contact No" required="required" type="tel" TextMode="Phone"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Contact No
                                                    </div>

                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label7" runat="server" Text="Vehical No"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_vehical_no" type="text" data-type="vehicle" ClientIDMode="Static" CssClass="form-control" runat="server" Height="32px" Width="200px" Style="text-transform: uppercase" placeholder="MH-12-AB-1234" AutoPostBack="true" required autofocus OnTextChanged="txt_vehical_no_TextChanged" TextMode="SingleLine"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Vehical No
                                                    </div>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
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
                                            <asp:Button ID="btn_save" type="button-submit" runat="server" OnClientClick="disableSaveButtonIfValid();" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" />
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

                               
<script>

    function validateVehicleNumber() {
        const input = document.getElementById('txt_vehical_no');
    
        if (!input) return;

        const vehicleNumber = input.value.trim().toUpperCase();
        const regex = /^[A-Z]{2}\d{1,2}[A-Z]{1,2}\d{4}$/;

        if (regex.test(vehicleNumber)) {
            input.classList.remove('is-invalid');
            input.classList.add('is-valid');
        } else {
            input.classList.remove('is-valid');
            input.classList.add('is-invalid');
        }
    }


        function initDropdownEvents() {
            const textBox1 = document.getElementById("<%= TextBox1.ClientID %>");
            const repeaterContainer1 = document.getElementById("RepeaterContainer1");

            textBox1.addEventListener("focus", function () {
                repeaterContainer1.style.display = "block";
            });

            textBox1.addEventListener("input", function () {
                const input = textBox1.value.toLowerCase();
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
            document.getElementById("<%= TextBox1.ClientID %>").value = value; 0
            document.getElementById("RepeaterContainer1").style.display = "none";
        }

        Sys.Application.add_load(initDropdownEvents);



</script>
</asp:Content>