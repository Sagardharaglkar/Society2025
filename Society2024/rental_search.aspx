<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rental_search.aspx.cs" Inherits="Society.rental_search" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="True" %>


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
                window.location.href = 'rental_search.aspx';
            }
        });
    }
</script>

    <script type="text/javascript">
        function digit(evt) {

            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }
        function openModal() {
            $('#edit_model').modal('show');
        }
        function checkLength(el) {
            if (el.value.length != 10) {
                alert("length must be exactly 10 characters")
            }
        }  </script>

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
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">Tenant</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="owner_id" runat="server" />
                <asp:HiddenField ID="o_ex_id" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="flat_id" runat="server" />
                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                    <asp:ListItem Value="name">Name</asp:ListItem>
                                    <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                    <asp:ListItem Value="build_name">Building</asp:ListItem>
                                    <asp:ListItem Value="w_name">Wing</asp:ListItem>
                                    <asp:ListItem Value="flat_type">Flat Type</asp:ListItem>

                                </asp:DropDownList>&nbsp;&nbsp;
                       
                            <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                                </asp:Panel>
                                &nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowDeleting="GridView1_RowDeleting">

                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="owner_id" Visible="false" SortExpression="owner_id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="owner_id" runat="server" Text='<%# Bind("owner_id")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Building" Visible="true" SortExpression="build_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr3" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Flat No" Visible="true" SortExpression="flat_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="wing" Visible="true" SortExpression="w_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr2" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Flat Type" Visible="true" SortExpression="flat_type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="addr1" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("owner_id")%>'><img src="Images/123.png"/></asp:LinkButton>
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

                                            </Columns>
                                        </asp:GridView>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm-4" style="right: 80px">
                    <div class="modal-content" style="height: auto; width: 900px;">
                        <div class="modal-header">
                            <h4 class="modal-title" id="gridSystemModalLabel"><strong>Rental Details</strong></h4>
                        </div>
                        <div class="modal-body" id="invoice_data">
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_acc_no" runat="server" Text="Build & Wing"></asp:Label>
                                                <asp:Label ID="lbl_acc_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="ddl_build_wing" Height="32px" Width="200px" runat="server" parsely-trigger="change" AutoPostBack="true"></asp:DropDownList>
                                                </br>
                                        <asp:CompareValidator ControlToValidate="ddl_build_wing" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Build & Wing" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                            </div>

                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_date" runat="server" Text="Poss Date"></asp:Label>
                                                <asp:Label ID="lbl_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="lbl_date_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_poss_date" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
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
                                                <%--                      <asp:TextBox ID="txt_build_name" runat="server"  placeholder="Enter Building No" AutoPostBack="true" required></asp:TextBox>--%>
                                                <asp:DropDownList ID="ddl_type" Height="32px" Width="200px" AutoPostBack="true" parsely-trigger="change" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                <br />
                                                <asp:CompareValidator ControlToValidate="ddl_type" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Type" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                            </div>

                                            <div class="col-sm-3">
                                                <asp:Label ID="Label8" runat="server" Text="Flat No"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="ddl_flat" Height="32px" Width="200px" runat="server" AutoPostBack="true" parsely-trigger="change" OnSelectedIndexChanged="ddl_flat_SelectedIndexChanged"></asp:DropDownList>

                                                <asp:CompareValidator ControlToValidate="ddl_flat" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                <asp:TextBox ID="txt_flat" runat="server" Height="32px" Width="200px" Visible="false"></asp:TextBox>
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
                                                <asp:TextBox ID="txt_name" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Name" required></asp:TextBox>

                                            </div>

                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                                <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_email" Height="32px" Width="200px" placeholder="Enter Email" required runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>

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
                                                <asp:TextBox ID="txt_pre_mob" runat="server" OnTextChanged="txt_pre_mob_TextChanged" MaxLength="10" Height="32px" Width="200px" onkeypress="return digit(event);" onblur="checkLength(this)" placeholder="Enter Mobile No." AutoPostBack="true" required></asp:TextBox>
                                                <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </div>

                                            <div class="col-sm-3">
                                                <asp:Label ID="lbl_add_mob" runat="server" Text="Alternate Mobile No."></asp:Label>
                                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_add_mob" Height="32px" Width="200px" runat="server" MaxLength="10" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Mobile No."></asp:TextBox>

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
                                                <asp:DropDownList ID="drp_married" Height="32px" Width="200px" parsely-trigger="change" runat="server"></asp:DropDownList>
                                                <br />
                                                <asp:CompareValidator ControlToValidate="drp_married" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Married Status" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                            </div>
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label27" runat="server" Text="DOB"></asp:Label>
                                                <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_dob" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>


                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <asp:Label ID="Label3" runat="server" Text="ID Proof"></asp:Label>
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_doc_type" Height="32px" Width="200px" runat="server" parsely-trigger="change">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:CompareValidator ControlToValidate="ddl_doc_type" ID="CompareValidator5" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select ID Proof" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                    </div>

                                    <div class="col-sm-2">
                                        <asp:Button ID="btnotice_id_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btnotice_id_upload_Click" UseSubmitBehavior="False" />
                                        <div class="overflow-div">
                                            <asp:Label ID="listofuploadedfiles1" runat="server" />
                                        </div>
                                        <asp:Label ID="uploadphotopath" runat="server" Visible="false" />
                                    </div>
                                </div>


                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <asp:Label ID="Label2" runat="server" Text="Photo Proof"></asp:Label>
                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,jpeg" />
                                        <asp:Button ID="btn_photo_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btn_photo_upload_Click" UseSubmitBehavior="False" />
                                        <div class="overflow-div">
                                            <asp:Label ID="listofuploadedfiles" runat="server" />
                                        </div>
                                        <asp:Label ID="uploadidpath" runat="server" Visible="false" />
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
                                        <asp:TextBox ID="txt_occup" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Occupation"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_mon_inc" runat="server" Text="Organization"></asp:Label>
                                        <asp:Label ID="lbl_mon_inc_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_org" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Organization Name"></asp:TextBox>
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
                                        <asp:TextBox ID="txt_off_addr1" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Office Address"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_off_tel" runat="server" Text="Office Tel."></asp:Label>
                                        <asp:Label ID="lbl_off_tel_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_off_tel" runat="server" Height="32px" Width="200px" MaxLength="50" onkeypress="return digit(event);" placeholder="Enter Office Tel."></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_off_tel" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="box-header">
                                        <div class="row ">
                                            <div class="col-sm-12">
                                                <h3 class="box-title"><b>Aggrement Details</b></h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row ">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label13" runat="server" Text="Agreement Date"></asp:Label>
                                                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_aggrement_date" runat="server" Height="32px" Width="200px" MaxLength="8" TextMode="Date" required></asp:TextBox>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label25" runat="server" Text="Police Verification Date "></asp:Label>
                                                <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_police_verification" runat="server" Height="32px" Width="200px" MaxLength="8" TextMode="Date" required></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row ">

                                            <div class="col-sm-3">
                                                <asp:Label ID="Label16" runat="server" Text="Agreement Period From: "></asp:Label>

                                                <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_period_from" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label21" runat="server" Text="Agreement Period To"></asp:Label>
                                                <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txt_period_to" runat="server" Height="32px" Width="200px" MaxLength="8" TextMode="Date" required></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>
                                    <hr />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            '

                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><b>Family Details</b></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_tof_acc" runat="server" Text="Family Member"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_fam_mem_name" Style="text-transform: capitalize;" runat="server" Height="32px" Width="200px" placeholder="Enter family member"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_bank_acc" runat="server" Text="Relation"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_owner_rel" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Relation"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_bank" runat="server" Text="Occupaation"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_f_occu" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Occupation"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_bank_addr1" runat="server" Text="DOB"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_f_dob" runat="server" MaxLength="50" Height="32px" Width="200px" placeholder="Enter Dob" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <center>
                                        <asp:Button ID="btn_add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_add_Click"></asp:Button>
                                    </center>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView2_RowDeleting" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" OnSorting="GridView2_Sorting" EmptyDataText="No Record Found" AllowSorting="True">

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
                            <hr />


                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <div class="row">
                                    <center>
                                        <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click1" ValidationGroup="g1" class="btn btn-primary" />
                                        <asp:Button ID="btn_delete" class="btn btn-primary" Visible="false" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                        <asp:Button ID="btn_close" type="button-close" class="btn btn-primary" runat="server" Text="Close" OnClick="btn_close_Click" UseSubmitBehavior="False" />


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

</asp:Content>
