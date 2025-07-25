﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="owner_search.aspx.cs" Inherits="Society.owner_search" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="True" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .resized-model {
            width: 900px;
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
    <!-- jQuery (required by Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>

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
                    window.location.href = 'owner_search.aspx';
                }
            });
        }



        //$('#edit_model').on('hidden.bs.modal', function () {
        //    $(this).find('form').trigger('reset');
        //})


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

                return false;
            }

            return false;
        }


    </script>
    <style>
        .overflow-div {
            width: 200px;
            height: 25px;
            word-wrap: break-word;
            overflow: hidden;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>


    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Flat Owners 
                            </h1>
                        </th>
                    </tr>
                </table>
 


                        <%--                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">

                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                            <asp:ListItem Value="name">Name</asp:ListItem>
                                            <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                            <asp:ListItem Value="build_name">Building</asp:ListItem>
                                            <asp:ListItem Value="w_name">Wing</asp:ListItem>
                                            <%-- <asp:ListItem Value="usage">Flat Type</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;
                       
                               
                                   <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                            
                                        &nbsp;&nbsp;
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
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
                                    <button type="button"
        class="btn btn-success ms-2"
        onclick="exportSelectedColumnsToExcel('<%= OwnerGrid.ClientID %>', [0,1,3],)">
    Export to Excel
</button>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView ID="OwnerGrid" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="OwnerGrid_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="OwnerGrid_RowUpdating" OnSorting="OwnerGrid_Sorting" OnRowDeleting="OwnerGrid_RowDeleting">
                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="owner_id" SortExpression="owner_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="owner_id" Text='<%# Bind("owner_id")%>'></asp:Label>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="name" Text='<%# Bind("name")%>'></asp:Label>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Building" Visible="true" SortExpression="build_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr2" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Unit" Visible="true" SortExpression="unit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr1" runat="server" Text='<%# Bind("unit")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Type" Visible="true" SortExpression="flat_type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("owner_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" Visible="false" ItemStyle-Width="50">
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
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Owner Details</strong></h4>
                            </div>

                            <div class="modal-body" id="invoice_data">
                                <asp:UpdatePanel ID="modalpanel" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="owner_id" runat="server" />
                                        <asp:HiddenField ID="o_ex_id" runat="server"></asp:HiddenField>
                                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                                        <asp:HiddenField ID="flat_id" runat="server" />

                                        <asp:HiddenField ID="flat_no_id" runat="server" />
                                        <asp:HiddenField ID="Buildling_wing_id" runat="server" />
                                        <asp:HiddenField ID="type_id" runat="server" />
                                        <asp:HiddenField ID="married_id" runat="server" />
                                        <asp:HiddenField ID="doc_id_id" runat="server" />
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_acc_no" runat="server" Text="  Build & Wing :"></asp:Label>
                                                    <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">

                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer1" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="CategoryRepeater_ItemCommand1" OnItemDataBound="Repeater1_ItemDataBound">
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

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_date" runat="server" Text="Poss Date :"></asp:Label>

                                                    <asp:Label ID="lbl_date_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_poss_date" CssClass="form-control" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Select Date
                                                    </div>
                                                    <%--                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" TargetControlID="txt_poss_date" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label5" runat="server" Text="Type"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer2" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="CategoryRepeater_ItemCommand2" OnItemDataBound="Repeater2_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
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


                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label8" runat="server" Text="Flat No"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer3" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="CategoryRepeater_ItemCommand3" OnItemDataBound="Repeater3_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("flat_type") %>'
                                                                        CommandArgument='<%# Eval("flat_id") %>'
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
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Name" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Name
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_email" CssClass="form-control" Height="32px" Width="200px" TextMode="Email" placeholder="Enter Email" required runat="server"></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Valid Email ID
                                                    </div>

                                                </div>


                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Mobile No."></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_pre_mob" CssClass="form-control" runat="server" MaxLength="10" Height="32px" TextMode="Phone" Width="200px" placeholder="Enter Mobile No." AutoPostBack="true" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Mobile No
                                                    </div>
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_add_mob" runat="server" Text="Alternate Mobile No."></asp:Label>
                                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_add_mob" CssClass="not-required" Height="32px" Width="200px" runat="server" MaxLength="10" placeholder="Enter Alternate Mobile No."></asp:TextBox>





                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_married" runat="server" Text="Married"></asp:Label>
                                                    <asp:Label ID="lbl_married_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select" autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer4" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand4">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("married_name") %>'
                                                                        CommandArgument='<%# Eval("married_id") %>'
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

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label27" runat="server" Text="DOB"></asp:Label>
                                                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_dob" CssClass="form-control" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Select Date
                                                    </div>
                                                    <%--                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_dob" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label3" runat="server" Text="ID Proof"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select " autocomplete="off" required="required" />
                                                        <div id="RepeaterContainer5" class="suggestion-list">
                                                            <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand5">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("doc_name") %>'
                                                                        CommandArgument='<%# Eval("doc_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setTextBox5(this.innerText);" />
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
                                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                                </div>

                                                <div class="col-sm-2">
                                                    <asp:Button ID="btnotice_id_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btnotice_id_upload_Click" UseSubmitBehavior="False" />
                                                    <div class="overflow-div">
                                                        <asp:Label ID="listofuploadedfiles1" runat="server" />
                                                    </div>
                                                    <asp:Label ID="uploadidproof" runat="server" Visible="false" />
                                                </div>
                                            </div>


                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label1" runat="server" Text="Photo Proof"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,jpeg" />
                                                    <asp:Button ID="btn_photo_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btn_photo_upload_Click" UseSubmitBehavior="False" />
                                                    <div class="overflow-div">
                                                        <asp:Label ID="listofuploadedfiles" runat="server" />
                                                    </div>
                                                    <asp:Label ID="uploadphotopath" runat="server" Visible="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <hr />


                                        <div class="box-header">
                                            <div class="row ">
                                                <div class="col-sm-12">
                                                    <h3 class="box-title"><b>Occupation Details</b></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_occup" runat="server" Text="Occupation"></asp:Label>
                                                    <asp:Label ID="lbl_occup_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_occup" CssClass="not-required" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Occupation"></asp:TextBox>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_mon_inc" runat="server" Text="Monthly Income"></asp:Label>
                                                    <asp:Label ID="lbl_mon_inc_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_monthly_income" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Monthly Income"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_off_addr1" runat="server" Text="Office Address"></asp:Label>
                                                    <asp:Label ID="lbl_off_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_off_addr1" CssClass="not-required" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Office Address"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_off_tel" runat="server" Text="Office Tel."></asp:Label>
                                                    <asp:Label ID="lbl_off_tel_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_off_tel" runat="server" Height="32px" Width="200px" MaxLength="10" onkeypress="return digit(event);" placeholder="Enter Office Tel."></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_off_tel" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="box-header">
                                            <div class="row ">
                                                <div class="col-sm-12">
                                                    <h3 class="box-title"><b>Family Members Name</b></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_tof_acc" runat="server" Text="Family Member"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_fam_mem_name" Style="text-transform: capitalize;" runat="server" Height="32px" Width="200px" placeholder="Enter family member"></asp:TextBox>
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_bank_acc" runat="server" Text="Relation"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_owner_rel" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Relation"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_bank" runat="server" Text="Occupaation"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_f_occu" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Occupation"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_bank_addr1" runat="server" Text="DOB"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox CssClass="not-required" ID="txt_f_dob" runat="server" MaxLength="50" Height="32px" Width="200px" placeholder="Enter Dob" TextMode="Date"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <center>
                                                    <asp:Button ID="add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_add_Click" />
                                                </center>
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-12">
                                                    <asp:GridView ID="FamilyGrid" runat="server" Width="100%" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="false" OnRowUpdating="FamilyGrid_RowUpdating" OnRowDeleting="FamilyGrid_RowDeleting" OnSorting="FamilyGrid_Sorting" AllowSorting="True" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">

                                                        <Columns>
                                                            <asp:TemplateField HeaderText="detail_id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="o_ex_id" runat="server" Text='<%# Bind("o_ex_id")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="owner_id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="owner_id" runat="server" Text='<%# Bind("owner_id")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Name" SortExpression="f_name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="f_name" runat="server" Text='<%# Bind("f_name")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Relation" SortExpression="relation">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="relation" runat="server" Text='<%# Bind("relation")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Occupation" SortExpression="f_occu">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="f_occu" runat="server" Text='<%# Bind("f_occu")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DOB" SortExpression="f_dob">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="f_dob" runat="server" Text='<%# Bind("f_dob", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="50">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label runat="server" ID="lbl_Building" Visible="false"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="OwnerGrid" EventName="RowCommand" />
                                     

                                    </Triggers>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_photo_upload" />
                                        <asp:PostBackTrigger ControlID="btnotice_id_upload" />
                                        <asp:PostBackTrigger ControlID="add" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="btn_save" OnClientClick="disableSaveButtonIfValid();" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click1" ValidationGroup="g1" class="btn btn-primary" />
                                            <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />
                                 
                                            <!-- Export Modal -->
<div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exportModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
        
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exportModalLabel">Export Owner Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        
            <div class="modal-body">
                <asp:GridView ID="ExportGrid" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="true" />
            </div>

            <div class="modal-footer">
                <asp:Button ID="Button1" runat="server" Text="Export to Excel" CssClass="btn btn-success" OnClick="btnExportToExcel_Click" />
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>


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

     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <script>

        function openModal() {
            $('#edit_model').modal('show');
            console.log("Modal opened (Bootstrap 4)");
        }

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

            const textBox5 = document.getElementById("<%= TextBox5.ClientID %>");
            const repeaterContainer5 = document.getElementById("RepeaterContainer5");

            textBox5.addEventListener("focus", function () {
                repeaterContainer5.style.display = "block";
            });

            textBox5.addEventListener("input", function () {
                const input = textBox5.value.toLowerCase();
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
            document.getElementById("RepeaterContainer1").style.display = "none";
            document.getElementById("<%= TextBox2.ClientID %>").value = "";
            document.getElementById("<%= TextBox3.ClientID %>").value = "";
        }

        function setTextBox2(value) {
            document.getElementById("<%= TextBox2.ClientID %>").value = value;
            document.getElementById("RepeaterContainer2").style.display = "none";
            document.getElementById("<%= TextBox3.ClientID %>").value = "";
        }

        function setTextBox3(value) {
            document.getElementById("<%= TextBox3.ClientID %>").value = value;
            document.getElementById("RepeaterContainer3").style.display = "none";
        }

        function setTextBox4(value) {
            document.getElementById("<%= TextBox4.ClientID %>").value = value;
            document.getElementById("RepeaterContainer4").style.display = "none";
        }

        function setTextBox5(value) {
            document.getElementById("<%= TextBox5.ClientID %>").value = value;
            document.getElementById("RepeaterContainer5").style.display = "none";
        }


        Sys.Application.add_load(initDropdownEvents);


       function exportSelectedColumnsToExcel(gridId, selectedColumns = [0, 1, 3], fileName = 'SelectedData.csv', title = "Owner Information") {
           const table = document.getElementById(gridId);
           if (!table) {
               alert("Grid not found!");
               return;
           }

           let csv = '';

           // ➕ Add Title
           csv += `${title}\n\n`;

           // ➕ Get GridView Headers (row 0)
           const headerRow = table.rows[0];
           let headerData = [];

           selectedColumns.forEach(index => {
               if (headerRow.cells[index]) {
                   let text = headerRow.cells[index].innerText.trim().replace(/,/g, " ");
                   headerData.push(`"${text}"`);
               }
           });
           csv += headerData.join(",") + "\n";

           // ➕ Loop through data rows
           for (let i = 1; i < table.rows.length; i++) {
               const row = table.rows[i];
               let rowData = [];

               selectedColumns.forEach(index => {
                   if (row.cells[index]) {
                       let text = row.cells[index].innerText
                           .replace(/,/g, " ")
                           .replace(/\n/g, " ")
                           .trim();
                       rowData.push(`"${text}"`);
                   }
               });

               csv += rowData.join(",") + "\n";
           }

           // ➕ Download as CSV
           const encodedUri = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv);
           const link = document.createElement("a");
           link.setAttribute("href", encodedUri);
           link.setAttribute("download", fileName);
           document.body.appendChild(link);
           link.click();
           document.body.removeChild(link);
       }
   </script>


</asp:Content>
