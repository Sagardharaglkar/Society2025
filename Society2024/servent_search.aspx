<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servent_search.aspx.cs" Inherits="Society.servent_search" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function SuccessEntry() {
            Swal.fire(
                'SUCCESS!',
                'Quotation Entry Successfully Registered!',
                'success'
            )
        }
        function Fail() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'You Missed Something Empty!',
            })
        }

    </script>

    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }
        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }

        }

        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }
    </script>

    <script type="text/javascript">
        function toggleTextbox(chkBox, txtBoxId) {
            var txtBox = document.getElementById(txtBoxId);
            if (txtBox) {
                txtBox.disabled = !chkBox.checked;
                if (!chkBox.checked) txtBox.value = '';
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
                                <center>Search Servent</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="servent_id" runat="Server"></asp:HiddenField>
                <div class="form-group">
                    <div class="col-12">
                        <div class="d-flex align-items-center">
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="s_name"> Name</asp:ListItem>
                                <asp:ListItem Value="s_address_1">Address</asp:ListItem>
                                <asp:ListItem Value="mobile_no1">Mobile No</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                       
                              <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp; 
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp; 
                       
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>
                     
                </div><br/>



                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="society_master_id" ItemStyle-Width="200" SortExpression="society_master_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="society_master_id" runat="server" Text='<%# Bind("servent_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name"  SortExpression="s_name">
                                            <ItemTemplate>
                                                <asp:Label ID="s_name" runat="server" Text='<%# Bind("s_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address"  SortExpression="s_address_1" >
                                            <ItemTemplate>
                                                <asp:Label ID="s_address_1" runat="server" Text='<%# Bind("s_address_1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile No" SortExpression="mobile_no1"  ItemStyle-Width="200">
                                            <ItemTemplate>
                                                <asp:Label ID="mobile_no1" runat="server" Text='<%# Bind("mobile_no1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("servent_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
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

                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4" style="right: 80px">
                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Servent</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">
                               
                                    <div class="form-group">
                                        <div class="alert alert-danger danger" style="display: none;"></div>
                                    </div>
                                    <asp:UpdatePanel ID="upnlCountry" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_acc_no" runat="server" Text="Person's Name :"></asp:Label>

                                                        <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_p_name" Style="text-transform: capitalize;" runat="server" placeholder="Enter Name" required></asp:TextBox>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="lbl_pre_addr1" runat="server" Text="Address"></asp:Label>
                                                        <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_org_addr1" Style="text-transform: capitalize;" runat="server" MaxLength="250" placeholder="Enter Address" required></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Contact No"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_mobile_no1" runat="server" MaxLength="10" placeholder="Enter contact No" AutoPostBack="True" onblur="checkLength(this)" onkeypress="return digit(event);" required OnTextChanged="txt_mobile_no1_TextChanged"></asp:TextBox>
                                                        <br />

                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_org_addr2" runat="server" Style="text-transform: capitalize;" MaxLength="250" placeholder="Enter Address" ></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label3" runat="server" Text="Alternate Contact No"></asp:Label>
                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                       
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_mobile_no2" runat="server" MaxLength="10" placeholder="Enter Alternate Contact No"  onblur="checkLength(this)" AutoPostBack="True" onkeypress="return digit(event);"></asp:TextBox><br />

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Remark"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_remark" runat="server" Style="text-transform: capitalize;" placeholder="Enter Remark"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4" style="left: 0px; top: 1px"></div>
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label7" runat="server" Text="Nature of Service" Font-Bold="True" Width="184px" BorderColor="Black" BorderWidth="2px"></asp:Label>

                                                        <%--<asp:TextBox ID="txt_col8_name" runat="server" Font-Bold="true"  placeholder="Nature of Service" enabled="false"   ></asp:TextBox>--%>
                                                        <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" font-bold="true" />
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Label ID="Label8" runat="server" Text="Amount Per Month" Font-Bold="True" Width="184px" BorderColor="Black" BorderWidth="2px"></asp:Label>
                                                        <%--  <asp:TextBox ID="txt_col8_value" runat="server" Font-Bold="true"  placeholder="Amount" enabled="false"></asp:TextBox>--%>
                                                        <hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-width: 1px;" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4"></div>
                                                    <div class="col-sm-3">
                                                        <%--<asp:CheckBox ID="chk_meal" runat="server" Text="Preparing Meal" OnCheckedChanged="chk_meal_CheckedChanged" AutoPostBack="true" />--%>
                                                        <asp:CheckBox ID="chk_meal" runat="server" Text="Preparing Meal" OnCheckedChanged="chk_meal_CheckedChanged" AutoPostBack="true" onclick="toggleTextbox(this, 'txt_meal')" />

                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_meal" runat="server" placeholder="Enter Amount" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4"></div>
                                                    <div class="col-sm-3">
                                                        <asp:CheckBox ID="chk_c_wash" runat="server" Text="Cloth Washing" OnCheckedChanged="chk_c_wash_CheckedChanged" AutoPostBack="true" onclick="toggleTextbox(this, 'txt_c_wash')" />
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_c_wash" runat="server" placeholder="Enter Amount" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4"></div>
                                                    <div class="col-sm-3">
                                                        <asp:CheckBox ID="chk_p_wash" runat="server" Text="Pot Washing" OnCheckedChanged="chk_p_wash_CheckedChanged" AutoPostBack="true" onclick="toggleTextbox(this, 'txt_p_wash')" />
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_p_wash" runat="server" placeholder="Enter Amount" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4"></div>
                                                    <div class="col-sm-3">
                                                        <asp:CheckBox ID="chk_f_wash" runat="server" Text="Floor Washing" OnCheckedChanged="chk_f_wash_CheckedChanged" AutoPostBack="true" onclick="toggleTextbox(this, 'txt_f_wash')" />
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_f_wash" runat="server" placeholder="Enter Amount" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4"></div>
                                                    <div class="col-sm-3">
                                                        <asp:CheckBox ID="chk_b_set" runat="server" Text="Baby Sitting" OnCheckedChanged="chk_b_set_CheckedChanged" AutoPostBack="true" onclick="toggleTextbox(this, 'txt_b_set')" />
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:TextBox ID="txt_b_set" runat="server" placeholder="Enter Amount" autofocus></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                               
                            </div>

                            <div class="modal-footer">

                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="g1" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
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
       </div>
   </div>
    <br />




    <br />


</asp:Content>
