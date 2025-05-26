<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="village_master.aspx.cs" Inherits="Society2024.village_master" %>

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

    </script>
    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');

        }
    </script>

    <script type="text/javascript">
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
                            <h1 class="bg-primary text-white">
                                <center>Search Village</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <asp:HiddenField ID="user_id" runat="server" />
                <asp:HiddenField ID="village_id" runat="server" />
                <div class="form-group">
                    <div class="row ">

                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="name">Name</asp:ListItem>
                            <asp:ListItem Value="taluka">Taluka</asp:ListItem>
                            <asp:ListItem Value="email">Email</asp:ListItem>
                            <asp:ListItem Value="contact_no">Contact No</asp:ListItem>

                        </asp:DropDownList>&nbsp;&nbsp;
                       

                            <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_import" runat="server" class="btn btn-primary" OnClick="btn_import_Click" Text="Import Data From Excel" UseSubmitBehavior="False" />

                    </div>
                </div>



                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="v_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="v_id" runat="server" Text='<%# Bind("village_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Taluka" ItemStyle-Width="150" SortExpression="taluka">
                                            <ItemTemplate>
                                                <asp:Label ID="taluka" runat="server" Text='<%# Bind("taluka")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email" ItemStyle-Width="150" SortExpression="email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="150" SortExpression="contact_no">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="60">
                                            <ItemTemplate>

                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("village_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
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
                                                    
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-1" style="right: 80px">
                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Village</strong></h4>
                               
                            </div>
                            <div class="modal-body" id="invoice_data">
                                <form id="owner-socity-add" action="" method="post">

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


                                                    <<div class="col-sm-3">
                                                        <asp:Label ID="lbl_pre_mob" runat="server" Text="Contact No."></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_contact_no" runat="server" MaxLength="10" Width="200px" placeholder="Enter Contact No." onblur="checkLength(this)" onkeypress="return digit(event);" AutoPostBack="true" required></asp:TextBox>
                                                        <br />

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                               <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="E-mail ID"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="TextBox1" Width="200px" placeholder="Enter Email Id" runat="server" required></asp:TextBox>
                                                        <br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>

                                                    </div>
                                                <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_pincode" runat="server" Width="200px" MaxLength="6" onkeypress="return digit(event);" placeholder="Enter Pin" required autofocus></asp:TextBox>
                                                        <br />

                                                        <asp:RegularExpressionValidator ID="regularExp" ControlToValidate="txt_pincode" runat="server" ValidationExpression="[0-9]{6}" ErrorMessage="Invalid Pin Code." Font-Bold="True" ForeColor="red" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                                    </div>

                                            </div>
                                                                                      
                                           
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
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_district" Height="32px" Width="200px" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                    </div>



                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label40" runat="server" Text="Taluka"></asp:Label>
                                                        <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                        <%--<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:DropDownList ID="ddl_taluka" Height="32px" Width="200px" runat="server"></asp:DropDownList>

                                                    </div>
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


                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                   

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
                                    </asp:UpdatePanel>

                                </form>
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

