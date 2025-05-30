<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_search.aspx.cs" Inherits="Society.society_search" MasterPageFile="~/Site.Master" %>


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
                    window.location.href = 'society_search.aspx';
                }
            });
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function checkLength(el) {



            alert("length must be exactly 10 digits")
            if (el.value.length != 10) {
                return false;
            }

        }

        function openModal() {
            $('#edit_model').modal('show');

        }

        function confirmDelete() {
            return confirm("Are you sure you want to delete this record?");
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <%-- <div class="box-header with-border">
              <h2 class="box-title"></h2>
            </div>--%>
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">Society</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:HiddenField ID="society_master_id" runat="server" />
                        <asp:HiddenField ID="user_id" runat="server" />
                        <asp:HiddenField ID="society_id" runat="server" />
                        <div class="form-group">
                            <div class="row ">

                                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="name">Name</asp:ListItem>
                                    <asp:ListItem Value="establish_date">Establish Date</asp:ListItem>
                                    <asp:ListItem Value="registration_no">Registration No</asp:ListItem>
                                    <asp:ListItem Value="off_address1">Address</asp:ListItem>
                                    <asp:ListItem Value="contact_no1">Contact No</asp:ListItem>



                                </asp:DropDownList>&nbsp;&nbsp;
                       

                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_search" Width="94px" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_import" runat="server" Width="220px" class="btn btn-primary" OnClick="btn_import_Click" Text="Import Data From Excel" UseSubmitBehavior="False" />

                            </div>
                        </div>



                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">


                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="s_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="s_id" runat="server" Text='<%# Bind("society_master_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Establish Date" ItemStyle-Width="150" SortExpression="establish_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="establish_date" runat="server" Text='<%# Bind("establish_date","{0:yyyy-MM-dd}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Registration No" ItemStyle-Width="150" SortExpression="registration_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="registration_no" runat="server" Text='<%# Bind("registration_no")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Address" ItemStyle-Width="150" SortExpression="off_address1">
                                                    <ItemTemplate>
                                                        <asp:Label ID="off_address1" runat="server" Text='<%# Bind("off_address1")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="150" SortExpression="contact_no1">
                                                    <ItemTemplate>
                                                        <asp:Label ID="contact_no1" runat="server" Text='<%# Bind("contact_no1")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="60">
                                                    <ItemTemplate>

                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("society_master_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="60">
                                                    <ItemTemplate>
                                                        <asp:ImageButton
                                                            ID="imgDelete"
                                                            ImageUrl="~/Images/delete_10781634.png"
                                                            CommandName="Delete"
                                                            runat="server"
                                                            Height="25px"
                                                            ToolTip="Delete this row"
                                                            OnClientClick="return confirm('Are you sure you want to delete this row?');" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%--                                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_10781634.png" ShowDeleteButton="True" ControlStyle-Height="25" />--%>


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
                    <div class="modal-dialog modal-sm-1" style="right: 80px">
                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Society</strong></h4>
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
                                                    <asp:Label ID="lbl_co_name" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_name" runat="server" placeholder="Enter Name" required autofocus Width="200px"></asp:TextBox>
                                                    <br />

                                                </div>


                                                <div class="col-sm-3">

                                                    <asp:Label ID="Label1" runat="server" Text="Establish Date"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_es_date" TextMode="Date" runat="server" Width="200px" required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label4" runat="server" Text="Registration No"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_registration" runat="server" Width="200px" AutoPostBack="true" placeholder="Enter Registration No" required Autofocus OnTextChanged="txt_registration_TextChanged"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>

                                            </div>

                                        </div>

                                        <hr />

                                        <h4>Contact Info</h4>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label7" runat="server" Text=" Office Address"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_off_address1" runat="server" Width="200px" placeholder="Enter Address" required autofocus></asp:TextBox>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label11" runat="server" Text="Alternate address"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_off_address2" runat="server" Width="200px" placeholder="Enter Address" autofocus></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Contact No."></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_contact_no1" runat="server" MaxLength="10" Width="200px" placeholder="Enter Contact No." onblur="checkLength(this)" onkeypress="return digit(event);" AutoPostBack="true" required></asp:TextBox>
                                                    <br />

                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_email" Width="200px" placeholder="Enter Email Id" runat="server" required></asp:TextBox>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label17" runat="server" Text="State"></asp:Label>
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_state" Height="32px" Width="200px" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label37" runat="server" Text="District"></asp:Label>
                                                    <asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%--<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_district" Height="32px" Width="200px" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>



                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label40" runat="server" Text="Division"></asp:Label>
                                                    <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%--<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_division" Height="32px" Width="200px" runat="server"></asp:DropDownList>

                                                </div>




                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label14" runat="server" Text="City"></asp:Label>
                                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_city" runat="server" Width="200px" placeholder="Enter Address" required autofocus></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label34" runat="server" Text="Street/Home No"></asp:Label>
                                                    <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label36" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%--<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_street" runat="server" Width="200px" MaxLength="10" placeholder="Enter Home No" required autofocus></asp:TextBox>

                                                </div>


                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label28" runat="server" Text="Pincode"></asp:Label>
                                                    <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_pincode" runat="server" Width="200px" MaxLength="6" onkeypress="return digit(event);" placeholder="Enter Pin" required autofocus></asp:TextBox>
                                                    <br />

                                                    <asp:RegularExpressionValidator ID="regularExp" ControlToValidate="txt_pincode" runat="server" ValidationExpression="[0-9]{6}" ErrorMessage="Invalid Pin Code." Font-Bold="True" ForeColor="red" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />




                                        <h4>Business Info</h4>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label23" runat="server" Text="TAN NO"></asp:Label>
                                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%-- <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_tan_no" runat="server" Width="200px" MaxLength="10" placeholder="Enter TAN NO" required autofocus></asp:TextBox>
                                                    <br />

                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label26" runat="server" Text="GSTIN REG.NO:"></asp:Label>
                                                    <%--<asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Medium" ></asp:Label>--%>
                                                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%--<asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_gstin_no" runat="server" Width="200px" MaxLength="15" placeholder="Enter GSTIN REG.NO" required autofocus></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label20" runat="server" Text="PAN NO"></asp:Label>
                                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    <%--<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_pan_no" runat="server" Width="200px" MaxLength="10" placeholder="Enter PAN NO" required autofocus></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>



                            </div>
                            <hr />


                            <div class="modal-footer">


                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClick="btn_delete_Click" />
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



                <div class="modal fade bs-example-modal-sm" id="import_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-1" style="right: 80px">
                        <iv class="modal-content" style="height: auto; width: 700px;">
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label27" runat="server" Text="Type of Data"></asp:Label>
                                            <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                                        </div>
                                        <div class="col-sm-4">

                                            <asp:DropDownList ID="ddl_import" runat="server" Width="200px" Height="32px">
                                                <asp:ListItem Value="building">Building</asp:ListItem>
                                                <asp:ListItem Value="owner">Owner</asp:ListItem>
                                                <asp:ListItem Value="society_member">Society Member</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label75" runat="server" Text="Upload File"></asp:Label>
                                            <asp:Label ID="Label76" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                                        </div>
                                        <div class="col-sm-4">
                                            <asp:FileUpload ID="file_name" runat="server" accept=".xls,.xlsx,.csv" />
                                            <asp:Label ID="uploadedfiles" runat="server" ForeColor="Green" />
                                        </div>


                                    </div>

                                </div>
                            </div>

                            <div class="modal-footer">


                                <div class="form-group">
                                    <div class="row ">
                                        <center>
                                            <asp:Button ID="btn_photo_upload" runat="server" Text="Import" Class="btn btn-primary" UseSubmitBehavior="false" OnClick="btn_photo_upload_Click" />
                                            <asp:Button ID="btn_close1" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close1_Click" UseSubmitBehavior="False" />

                                        </center>
                                    </div>
                                </div>


                            </div>
                    </div>
                </div>

            </div>
        </div>

    </div>


</asp:Content>
