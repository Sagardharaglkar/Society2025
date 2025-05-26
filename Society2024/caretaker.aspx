<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="caretaker.aspx.cs" Inherits="Society.caretaker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
                window.location.href = 'caretaker.aspx';
            }
        });
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



<asp:HiddenField ID="caretaker_id" runat="Server"></asp:HiddenField>
     <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
     <asp:HiddenField ID="wing_id" runat="Server"></asp:HiddenField>

    <div class="box box-primary">
        <div class="box-header with-border">
        <div class="box-body">
  <table width="100%">
                        <tr>
                            <th width="100%" class="">
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">CareTakers
                                </h1>
                            </th>
                        </tr>
                    </table>
            
            <asp:HiddenField ID="HiddenField4" runat="server" />
             <asp:HiddenField ID="HiddenField1" runat="server" />
              <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
            <div class="form-group">
            <div class="row">
            <div class="col-12">
            <div class="d-flex align-items-center">
                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                            <asp:ListItem Value="c_name">Name</asp:ListItem>
                            <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                            <asp:ListItem Value="c_address">Address</asp:ListItem>
                            <asp:ListItem Value="mobile_no">Contact No</asp:ListItem>
                           <%-- <asp:ListItem Value="email">Email</asp:ListItem>--%>
                        </asp:DropDownList>&nbsp;&nbsp;
                  
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">

                        <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                    
                        <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                   
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add</button>
                 </div>
             </div>
          </div>
      </div>
            
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
                                    <asp:TemplateField HeaderText="caretaker_id" ItemStyle-Width="200"  SortExpression="caretaker_id" Visible="false" >
                                        <ItemTemplate>
                                            <asp:Label ID="caretaker_id" runat="server" Text='<%# Bind("caretaker_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Caretaker Name"  SortExpression="c_name" >
                                        <ItemTemplate>
                                            <asp:Label ID="c_name" runat="server" Text='<%# Bind("c_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Flat No" ItemStyle-Width="100"  SortExpression="flat_no" >
                                        <ItemTemplate>
                                            <asp:Label ID="flat_no" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" SortExpression="c_address" >
                                        <ItemTemplate>
                                            <asp:Label ID="c_address" runat="server" Text='<%# Bind("c_address")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact No" SortExpression="mobile_no">
                                        <ItemTemplate>
                                            <asp:Label ID="mobile_no" runat="server" Text='<%# Bind("mobile_no")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="50" HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("caretaker_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                            <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-Width="50" HeaderText="Delete">
                                        <ItemTemplate >
                                            <asp:LinkButton runat="server" ID="edit551" CommandName="Delete"  OnClientClick="return confirm('Are you sure want to delete?');" ><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
                                              </ItemTemplate>
                                    </asp:TemplateField>


                                    <%--                                    <asp:LinkButton  ButtonType="Button" data-toggle="modal" data-target=".bs-example-modal-sm" SelectText="Edit" ControlStyle-ForeColor="blue" />--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
</ContentTemplate></asp:UpdatePanel>

     <div class="modal fade bs-example-modal-sm"  tabindex="-1" id="edit_model" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                <div class="modal-dialog modal-sm-4" style="right: 80px">
                    <div class="modal-content" style="height: auto; width: 900px;">
                        <div class="modal-header">
                          <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Caretaker</strong></h4>
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
                        <asp:Label ID="lbl_acc_no" runat="server" Text="Build & Wing"></asp:Label>
                        <asp:Label ID="lbl_acc_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddl_build_wing1" Height="32px" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddl_build_wing_SelectedIndexChanged" parsley-trigger="change" runat ="server" required autofocus > </asp:DropDownList> <br />
                          <asp:CompareValidator ControlToValidate="ddl_build_wing1" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Build & Wing" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                        <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="Label6" runat="server" Text="Flat No"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_flat_no" runat="server"  Height="32px" Width="200px" MaxLength="50" placeholder="Enter No" required ></asp:TextBox>
                    <%--    <asp:Label ID="Label10" runat="server" forecolor="Red"></asp:Label>--%>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row ">
                    <div class="col-sm-3">
                        <asp:Label ID="lbl_name" runat="server" Text="Caretaker Name"></asp:Label>
                        <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_c_name" runat="server"  Height="32px" Width="200px" MaxLength="50" placeholder="Enter Name" required autofocus ></asp:TextBox>
                    <%--    <asp:Label ID="Label10" runat="server" forecolor="Red"></asp:Label>--%>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="Label1" runat="server" Text="Document Type"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddl_doc_name"  Height="32px" Width="200px" runat="server" parsely-trigger="change" ></asp:DropDownList>
                         <asp:CompareValidator ControlToValidate="ddl_doc_name" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Document Type" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                    </div>

                </div>
            </div>

            <div class="form-group">
                <div class="row ">
                    
                    <div class="col-sm-3">
                        <asp:Label ID="lbl_pre_addr1" runat="server" Text="Address"></asp:Label>
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                        <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_c_address" runat="server"  Height="32px" Style="text-transform: capitalize;" Width="200px" MaxLength="250" required placeholder="Enter Address"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="Label7" runat="server" Text="Area"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_area" runat="server" MaxLength="50"  Height="32px" Width="200px" placeholder="Enter Area" required ></asp:TextBox>
                       
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
                        <asp:TextBox ID="txt_mobile_no" runat="server" MaxLength="10" Height="32px" Width="200px" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter contact No." AutoPostBack="true" required></asp:TextBox><br />
                    </div>
                    
              <div class="col-sm-3">
                        <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                      <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_email"  Height="32px" Width="200px" placeholder="Enter Email" runat="server" required></asp:TextBox> <br />
                        <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>

                    </div>
                    </div></div>

             <div class="form-group">
                <div class="row ">
                    <div class="col-sm-3">
                        <asp:Label ID="Label14" runat="server" Text="City"></asp:Label>
                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_city" runat="server"  Height="32px" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Address" required autofocus></asp:TextBox>
                    </div>
                 
                    <div class="col-sm-3">
                        <asp:Label ID="Label17" runat="server" Text="State"></asp:Label>
                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                          <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddl_state" Height="32px" Width="200px" parsley-trigger="change" runat="server"></asp:DropDownList>
                         <asp:CompareValidator ControlToValidate="ddl_state" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select state" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                    </div>
                    
                </div>
            </div>
            
          <div class="form-group">
                <div class="row ">
                    <div class="col-sm-3">
                        <asp:Label ID="Label28" runat="server" Text="Pincode"></asp:Label>
                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_pincode" runat="server" Maxlength="6" Height="32px" Width="200px"  placeholder="Enter Pincode" required autofocus></asp:TextBox> <br />
                        <asp:RegularExpressionValidator ID="regularExp"  ControlToValidate="txt_pincode" runat="server" ValidationExpression="[0-9]{6}" ErrorMessage="Invalid Pin Code." Font-Bold="True" ForeColor="red" ValidationGroup="g1" ></asp:RegularExpressionValidator>
                    </div>
                 <%-- <div class="col-sm-3">
                        <asp:Label ID="Label4" runat="server" Text="Document Executed"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                       <%-- <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>--%>
                   <%-- </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txt_doc_executed" runat="server"  Height="32px" Width="200px"  placeholder="Enter Executed" required autofocus></asp:TextBox>
                    </div>--%>
                   
                    
                </div>
            </div>
    
                </ContentTemplate>
                                    </asp:UpdatePanel>

                                </form>    
   </div>
    <div class="modal-footer">
    
            <div class="form-group">
                <div class="row ">
                   
                     <center>
                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" Visible="false" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="False" />
                         </center>
                    </div>
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
  
     <br />  <br />  <br /> <br />  <br />  <br />  <br />  <br />  <br />
</asp:Content>
