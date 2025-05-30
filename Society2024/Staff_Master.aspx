<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff_Master.aspx.cs" Inherits="Society2024.Staff_Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
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
                window.location.href = 'Staff_Master.aspx';
            }
        });
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
                            <h1 class=" font-weight-bold " style="color: #012970;">Staff</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>

                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="staff_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="build_id" runat="server" />
                <asp:HiddenField ID="role_id" runat="server" />
                <div class="form-group">
                    <div class="col-12">
                           <div class="d-flex align-items-center">
                   
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <%--<asp:ListItem Value="build_name">Building Name</asp:ListItem>--%>
                                <asp:ListItem Value="name">Name</asp:ListItem>
                                <asp:ListItem Value="contact_no">Contact No</asp:ListItem>
                                <asp:ListItem Value="Role">Role</asp:ListItem>

                            </asp:DropDownList>&nbsp;&nbsp;
                       
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                      
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>

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
        </ContentTemplate></asp:UpdatePanel>
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

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="lbl_co_name" runat="server" Text="Name"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_name" runat="server" Height="32px" Width="200px" placeholder="Enter Name" required autofocus></asp:TextBox>
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
                                                       <asp:DropDownList ID="ddl_role" AutoPostBack="true" runat="server" Width="200px" Height="32px" BackColor="WhiteSmoke">
                                                        </asp:DropDownList>
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
                                                        <asp:TextBox ID="txt_address" runat="server" Height="32px" Style="text-transform: capitalize;" placeholder="Enter Address" Width="200px" required></asp:TextBox>

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
                                                        <asp:TextBox ID="txt_contact" runat="server" MaxLength="10" Height="32px" Width="200px" onblur="checkLength(this)" OnTextChanged="txt_contact_TextChanged" onkeypress="return digit(event);" placeholder="Enter Contact No" required autofocus AutoPostBack="true"></asp:TextBox>
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
                                                        <asp:TextBox ID="txt_email" runat="server" Height="32px" Width="200px" placeholder="Enter Email" required autofocus></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="true" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
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
                                                        <asp:TextBox ID="txt_doj" runat="server" Height="32px" placeholder="Enter Address" Width="200px" TextMode="Date" required></asp:TextBox>

                                                        <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_valid_to" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                    </div>
                                                </div>
                                            </div>

                                        <    </ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand"  />
</Triggers>
</asp:UpdatePanel>


                                
                            </div>

                            <div class="modal-footer">

                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure want to delete?');" class="btn btn-primary" Visible="False" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" OnClick="btn_close_Click" class="btn btn-primary" UseSubmitBehavior="False" />
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

</asp:Content>
