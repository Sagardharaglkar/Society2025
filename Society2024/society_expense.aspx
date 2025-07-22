<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="society_expense.aspx.cs" Inherits="Society.society_expense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .resized-model {
            width: 950px;
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

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Expenses
                            </h1>
                        </th>
                    </tr>
                </table>
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

                                            <ajaxToolkit:CalendarExtender
                                                ID="CalendarExtender1"
                                                runat="server"
                                                TargetControlID="txt_search"
                                                PopupButtonID="btn_calendar"
                                                Format="yyyy-MM-dd" />

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
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue"
                                            ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">

                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="expense_id" SortExpression="expense_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="expense_id" Text='<%# Bind("expense_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Vendor Name" SortExpression="ex_name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="v_name" Text='<%# Bind("ex_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Expense Details" SortExpression="ex_details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ex_details" runat="server" Text='<%# Bind("ex_details")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building Name" SortExpression="build_name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="b_id" Text='<%# Bind("build_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date" SortExpression="date" ItemStyle-Width="150">
                                                    <ItemTemplate>
                                                        <asp:Label ID="date" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" SortExpression="f_amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="f_amount" runat="server" Text='<%# Bind("f_amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type" SortExpression="expense_status">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="invoice" Text='<%# Bind("type")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status" SortExpression="expense_status">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="invoice" Text='<%# Bind("expense_status")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="editrwr" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("expense_id")%>'><img src="Images/123.png"/></asp:LinkButton>
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
                    <Triggers>

                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content resized-model">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Society Expense</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="expense_id" runat="server"></asp:HiddenField>
                                        <asp:HiddenField ID="approvar_id" runat="server"></asp:HiddenField>
                                        <asp:HiddenField ID="mem_id" runat="server"></asp:HiddenField>
                                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

                                        <asp:HiddenField runat="server" ID="vendor_name_id" />
                                        <asp:HiddenField runat="server" ID="building_id" />
                                        <asp:Panel ID="expense_panel" runat="server">


                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_name" runat="server" Text="Invoice No"></asp:Label>
                                                        <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_no" CssClass="from-control" runat="server" Height="32px" Width="200px" placeholder="Enter Invoice No" Enabled="false" required> </asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Invoice No
                                                        </div>
                                                        <br />

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_date" CssClass="form-control" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Date
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_pre_mob" runat="server" Text="Expense Types"></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:RadioButton ID="vendor" selected="true" runat="server" Text="Vendor" GroupName="g1" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="vendor_CheckedChanged" />
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <asp:RadioButton ID="cash" runat="server" Text="Cash" AutoPostBack="true" GroupName="g1" Font-Bold="true" OnCheckedChanged="cash_CheckedChanged" />
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Vendor Name "></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <%-- <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Height="32px" Width="200px" placeholder="Enter Name" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Name
                                                        </div>--%>
                                                        <div class="dropdown-container">
                                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                                                                placeholder="Select" autocomplete="off" required="required" Style="width: 200px;" />
                                                            <asp:Panel ID="drp_Container" runat="server">
                                                                <div id="RepeaterContainer1" class="suggestion-list">
                                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand1">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton
                                                                                ID="lnkCategory"
                                                                                runat="server"
                                                                                CssClass="suggestion-item link-button category-link"
                                                                                Text='<%# Eval("v_name") %>'
                                                                                CommandArgument='<%# Eval("vendor_id") %>'
                                                                                CommandName="SelectCategory"
                                                                                OnClientClick="setCategoryBox1(this.innerText);" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                                Text="No items found." />
                                                                        </FooterTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label23" runat="server" Text="Building name"></asp:Label>
                                                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="dropdown-container">
                                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box form-control"
                                                                placeholder="Select" autocomplete="off" required="required" Style="width: 200px;" />
                                                            <div id="RepeaterContainer2" class="suggestion-list">
                                                                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="CategoryRepeater_ItemCommand2">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton
                                                                            ID="lnkCategory"
                                                                            runat="server"
                                                                            CssClass="suggestion-item link-button category-link"
                                                                            Text='<%# Eval("name") %>'
                                                                            CommandArgument='<%# Eval("wing_id") %>'
                                                                            CommandName="SelectCategory"
                                                                            OnClientClick="setCategoryBox2(this.innerText);" />
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
                                                        <asp:Label ID="lbl_pre_addr1" runat="server" Text="Expense Details"></asp:Label>
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_details" CssClass="form-control" runat="server" Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter details" TextMode="MultiLine" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Expense Details
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label7" runat="server" Text="Comments"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_comment" CssClass="not-required" runat="server" Height="32px" Width="200px" placeholder="Enter comments" Style="text-transform: capitalize;" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label15" runat="server" Text="Amount"></asp:Label>
                                                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_amount" CssClass="form-control" runat="server" Height="32px" Width="200px" placeholder="Enter Amount" onkeypress="return digit(event);" OnTextChanged="txt_amount_TextChanged" AutoPostBack="True" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Amount
                                                        </div>
                                                        <br />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-6">
                                                        <asp:CheckBox Visible="false" ID="add_chk" runat="server" Text="Adding Maintanance" Width="200px" />
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label10" runat="server" Text="Tax"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_tax" CssClass="form-control" runat="server" Height="32px" Width="200px" placeholder="Tax" onkeypress="return digit(event);" OnTextChanged="txt_tax_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Tax
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-6">
                                                        <asp:CheckBox ID="regular_chk" runat="server" Text="Regular Expense" Width="200px" />

                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label26" runat="server" Text="TDS"></asp:Label>
                                                        <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_tds" CssClass="form-control" runat="server" Height="32px" Width="200px" onkeypress="return digit(event);" placeholder="TDS"></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter TDS
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="row">

                                                    <div class="col-sm-3">
                                                        <asp:LinkButton ID="btn_add" runat="server" Text="Add Approver" data-toggle="modal" data-target="#emailmodal"></asp:LinkButton>
                                                    </div>


                                                    <div class="col-sm-3">
                                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView3_RowDeleting" OnRowDataBound="GridView3_RowDataBound" GridLines="None">

                                                            <Columns>

                                                                <asp:TemplateField HeaderText="user_id" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="user_id" Text='<%# Bind("user_id")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Approvers">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="name1" Text='<%# Bind("name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="status" Text='<%#  Eval("status").ToString()=="0"?"No Action":"Approved <br/>" +Eval("date","{0:dd-MMM-yyyy}")%>'></asp:Label>
                                                                        <asp:Button runat="server" ID="btn_approved" OnClick="btn_approved_Click" OnClientClick="return confirm('Are you sure want to approve this expense?');" Text="Not Approved" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="20">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton runat="server" ID="edit551" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>

                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label20" runat="server" Text="Final Amount"></asp:Label>
                                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_famount" CssClass="form-control" runat="server" Height="32px" Width="200px" onkeypress="return digit(event);" placeholder="Final Amount" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Final Amount
                                                        </div>

                                                    </div>


                                                </div>
                                            </div>


                                        </asp:Panel>
                                    </ContentTemplate>

                                    <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btn_confirm" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>


                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" ValidationGroup="g1" class="btn btn-primary" />
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


                <div class="modal fade bs-example-modal-sm" id="emailmodal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content" style="height: auto; width: 300px;">
                            <div class="modal-header">

                                <h4 class="modal-title" id="gridSystemModalLabel1"><strong>Select Customer</strong></h4>
                            </div>
                            <asp:UpdatePanel ID="assd" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <label>
                                                        Select all</label>
                                                    <asp:CheckBox ID="CheckAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckAll_CheckedChanged"></asp:CheckBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-sm-12">
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView2_RowDataBound" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeader="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" GridLines="None">

                                                <Columns>

                                                    <asp:TemplateField HeaderText="user_id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="user_id" Text='<%# Bind("user_id")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="name" Text='<%# Bind("name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk" AutoPostBack="true" OnCheckedChanged="name_CheckedChanged"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>


                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="pull-left">
                                            <asp:Button ID="Button1" runat="server" Text="Close" class="btn btn-default" data-dismiss="modal" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="pull-right">
                                            <asp:Button ID="btn_confirm" runat="server" Text="Confirm" OnClick="btn_confirm_Click" data-dismiss="modal" UseSubmitBehavior="false" class="btn btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-body -->
                    </div>
                    <!-- /.modal-content -->
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">

        function initDropdownEvents() {

            const categoryBox = document.getElementById("<%= TextBox1.ClientID %>");

            const categorySuggestions = document.getElementById("RepeaterContainer1");

            categoryBox.addEventListener("focus", function () {
                console.log("focused")
                categorySuggestions.style.display = "block";
            });

            categoryBox.addEventListener("input", function () {

                const input = categoryBox.value.toLowerCase();

                filterSuggestions("category-link", input);

            });

            const categoryBox2 = document.getElementById("<%= TextBox2.ClientID %>");

            const categorySuggestions2 = document.getElementById("RepeaterContainer2");

            categoryBox2.addEventListener("focus", function () {

                categorySuggestions2.style.display = "block";


            });

            categoryBox2.addEventListener("input", function () {

                const input = categoryBox2.value.toLowerCase();

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


        function setCategoryBox1(value) {

            document.getElementById("<%= TextBox1.ClientID %>").value = value;

            document.getElementById("RepeaterContainer1").style.display = "none";

        }
        function setCategoryBox2(value) {

            document.getElementById("<%= TextBox2.ClientID %>").value = value;

            document.getElementById("RepeaterContainer2").style.display = "none";

        }

        Sys.Application.add_load(initDropdownEvents);

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
                    window.location.href = 'society_expense.aspx';
                }
            });
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

                //openModal();
            });
        }

        function openModal() {
            $('#edit_model').modal('show');


        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }


    </script>
</asp:Content>



