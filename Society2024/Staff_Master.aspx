﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff_Master.aspx.cs" Inherits="Society2024.Staff_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
                .resized-model{
        width: 529px;
    height: auto;
    right: 82px;
}

.resized-input{
    width:200px;
}

@media(max-width: 431px){
   .resized-model{
       height: auto;
    margin: auto;
    width: 292px;
    margin-top: 168px;
    right: 1px;
   }

   .resized-input{
    width:100%;
}
}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
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
                    window.location.href = 'Staff_Master.aspx';
                }
            });
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function openModal() {
            $('#edit_model').modal('show');
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
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">Staff</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                       
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

                                        <ajaxtoolkit:calendarextender
                                            id="CalendarExtender1"
                                            runat="server"
                                            targetcontrolid="txt_search"
                                            popupbuttonid="btn_calendar"
                                            format="yyyy-MM-dd" />

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
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">

                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="staff_id" runat="server" Text='<%# Bind("staff_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="400" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Address" ItemStyle-Width="200" SortExpression="address">
                                                    <ItemTemplate>
                                                        <asp:Label ID="address" runat="server" Text='<%# Bind("address")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="200" SortExpression="contact_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email" ItemStyle-Width="200" SortExpression="email">
                                                    <ItemTemplate>
                                                        <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date of Join" ItemStyle-Width="400" SortExpression="date_of_join">
                                                    <ItemTemplate>
                                                        <asp:Label ID="date_of_join" runat="server" Text='<%# Bind("date_of_join","{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Role" ItemStyle-Width="200" SortExpression="role">
                                                    <ItemTemplate>
                                                        <asp:Label ID="role" runat="server" Text='<%# Bind("Role")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField ItemStyle-Width="100" HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("staff_id")%>'> <img src="Images/123.png"  /></asp:LinkButton>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
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
                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-6">
                        <div class="modal-content" style="height: auto; width: 400px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Staff_Search</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">


                                <div class="form-group">
                                    <div class="alert alert-danger danger" style="display: none;"></div>
                                </div>
                                <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                         <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="staff_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="build_id" runat="server" />
                        <asp:HiddenField ID="role_id" runat="server" />

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="lbl_co_name" runat="server" Text="Name"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_name" CssClass="form-control resized-input" runat="server" Height="32px"  placeholder="Enter Name" required autofocus></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Name
                                                        </div>
                                                        <br />


                                                </div>
                                            </div>
                                        </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label14" runat="server" Text="Role"></asp:Label>
                                                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="dropdown-container">
                                                            <asp:TextBox ID="categoryBox"  runat="server" CssClass="input-box resized-input form-control"
                                                                placeholder="Select" autocomplete="off" required="required" />
                                                            <div id="categoryRepeaterContainer" class="suggestion-list">
                                                                <asp:Repeater ID="categoryRepeater" runat="server" OnItemDataBound="categoryRepeater_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton
                                                                            ID="lnkCategory"
                                                                            runat="server"
                                                                            CssClass="suggestion-item link-button category-link"
                                                                            Text='<%# Eval("role") %>'
                                                                            CommandArgument='<%# Eval("role_id") %>'
                                                                            CommandName="SelectCategory"
                                                                            OnClientClick="setCategoryBox(this.innerText);" />
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
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label7" runat="server" Text=" Address"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_address" CssClass="form-control resized-input" runat="server" Height="32px" Style="text-transform: capitalize;" placeholder="Enter Address"  required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Adress
                                                        </div>

                                                    <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_valid_to" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                </div>
                                            </div>
                                        </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label4" runat="server" Text="Contact No"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_contact" CssClass="form-control resized-input" runat="server" MaxLength="10" Height="32px" TextMode="Phone" placeholder="Enter Contact No" required autofocus AutoPostBack="true"></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Contact No
                                                        </div>
                                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_contact" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>--%>
                                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div>

                                            </div>
                                        </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_email" CssClass="form-control resized-input" runat="server" TextMode="Email" Height="32px" placeholder="Enter Email" required autofocus></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Valid Email
                                                        </div>
                                                       </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label10" runat="server" Text="Date of Join"></asp:Label>
                                                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_doj" CssClass="form-control resized-input" runat="server" Height="32px" placeholder="Enter Address" TextMode="Date" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Date
                                                        </div>

                                                        <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_valid_to" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
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
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" OnClientClick="disableSaveButtonIfValid();" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" class="btn btn-primary" Visible="False" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss ="modal" />
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

        const categoryBox = document.getElementById("<%= categoryBox.ClientID %>");

        const categorySuggestions = document.getElementById("categoryRepeaterContainer");

        categoryBox.addEventListener("focus", function () {

            categorySuggestions.style.display = "block";

            itemSuggestions.style.display = "none";

        });

        categoryBox.addEventListener("input", function () {

            const input = categoryBox.value.toLowerCase();

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


    function setCategoryBox(value) {

        document.getElementById("<%= categoryBox.ClientID %>").value = value;

        document.getElementById("categoryRepeaterContainer").style.display = "none";

    }


    Sys.Application.add_load(initDropdownEvents);


</script>
 
</asp:Content>
