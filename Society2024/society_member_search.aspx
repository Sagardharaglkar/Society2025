<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_member_search.aspx.cs" Inherits="Society.society_member_search" MasterPageFile="~/Site.Master" %>


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

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }

    </script>

    <script type='text/javascript'>
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
                            <h1 class="bg-primary text-white">
                                <center>Search Society Members</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="user_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                  
                <%--<div class="form-group">
                    <div class="row ">
                       
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="userLogin.name">Name</asp:ListItem>
                                <asp:ListItem Value="UserTypeName">Designation</asp:ListItem>
                                <asp:ListItem Value="address1">Address</asp:ListItem>
                                <asp:ListItem Value="contact_no">Contact No</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;
                     

                            <%--<asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />&nbsp;&nbsp;--%>

              <%-- <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search"> 
                   
    <div class="form-inline">
        <asp:TextBox ID="txt_search" 
                     Style="text-transform: capitalize;" 
                     Font-Bold="true" 
                     Width="200px" 
                     Height="32px" 
                     placeholder="Search here" 
                     runat="server">
                     </asp:TextBox>&nbsp;&nbsp;
        <asp:Button ID="btn_search" 
                    runat="server" 
                    CssClass="btn btn-primary" 
                    OnClick="btn_search_Click" 
                    Text="Search" 
                    UseSubmitBehavior="False" />&nbsp;&nbsp;
    </div>
                        </asp:Panel>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add</button>

                      

                    </div>
                </div>--%>




    <div class="form-group">
    <div class="row">
        <div class="col-12">
            <div class="d-flex align-items-center">

                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                    <asp:ListItem Value="userLogin.name">Name</asp:ListItem>
                    <asp:ListItem Value="UserTypeName">Designation</asp:ListItem>
                    <asp:ListItem Value="address1">Address</asp:ListItem>
                    <asp:ListItem Value="contact_no">Contact No</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp;

                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                    <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Font-Bold="true" Width="200px" Height="32px" placeholder="Search here" runat="server"> </asp:TextBox>&nbsp;&nbsp; 
                      <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary me-2" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /> </asp:Panel>&nbsp;&nbsp;        
              
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"> Add </button>
          
            </div>
        </div>
    </div>
</div>

                   


                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="user_id" runat="server" Text='<%# Bind("user_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation" SortExpression="UserTypeName">
                                            <ItemTemplate>
                                                <asp:Label ID="UserTypeName" runat="server" Text='<%# Bind("UserTypeName")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address" SortExpression="address1">
                                            <ItemTemplate>
                                                <asp:Label ID="address1" runat="server" Text='<%# Bind("address1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No" SortExpression="contact_no">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">                                          
                                            <ItemTemplate>
                                                 <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("user_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="Delete" ItemStyle-Width="50">
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
                    <div class="modal-dialog modal-sm-6">
                        <div class="modal-content" style="height: auto; width: 400px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Member</strong></h4>
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
                    <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Width="200px" Style="text-transform: capitalize;" placeholder="Enter Name" required autofocus></asp:TextBox>
                    <div class="invalid-feedback">
                        Please Enter Name 
                    </div>
                </div>

            </div>
        </div>
        <div class="form-group">
            <div class="row ">
                <div class="col-sm-4">
                    <asp:Label ID="Label4" runat="server" Text="Designation"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList CssClass="form-select" ID="ddl_usertype" runat="server" Width="200px"></asp:DropDownList>
                    <div class="invalid-feedback">
                        Please Select Designation
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
                    <asp:TextBox ID="txt_address1" CssClass="form-control" Style="text-transform: capitalize;" runat="server" Width="200px" placeholder="Enter Address1" required autofocus></asp:TextBox>
                </div>
                <div class="invalid-feedback">
                    Please Enter Adress
                </div>

            </div>
        </div>

        <div class="form-group">
            <div class="row ">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txt_address2" CssClass="form-control" Style="text-transform: capitalize;" runat="server" Width="200px" placeholder="Enter Address2" required autofocus></asp:TextBox>
                    <div class="invalid-feedback">
                        Please Enter Adress 
                    </div>
                </div>

            </div>
        </div>

        <div class="form-group">
            <div class="row ">
                <div class="col-sm-4">
                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Contact No."></asp:Label>
                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txt_contact_no" CssClass="form-control" runat="server" MaxLength="10" Width="200px" onblur="checkLength(this)" placeholder="Enter contact No." onkeypress="return digit(event);" OnTextChanged="txt_contact_no_TextChanged" AutoPostBack="true" required></asp:TextBox>
                      <asp:Label ID="Label25" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                    <div class="invalid-feedback">
                        Please Enter Contact No
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row ">
                <div class="col-sm-4">
                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txt_email" CssClass="form-control" Width="200px" Style="text-transform: lowercase;" placeholder="Enter Email" AutoPostBack="true" OnTextChanged="txt_email_TextChanged" runat="server" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="true" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>
                    <div class="invalid-feedback">
                        Please Enter Email
                    </div>
                </div>
            </div>
        </div>
      
        <div class="form-group">
            <div class="row ">
                <div class="col-sm-4">
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txt_username" CssClass="form-control" Width="200px" placeholder="Enter Username" Enabled="false" runat="server" required></asp:TextBox>
                    <div class="invalid-feedback">
                        Please Enter Username
                    </div>
                </div>
                </div>
                </div>
         <div class="form-group">
             <div class="row ">
                
                <div class="col-sm-4">
                    <asp:Label ID="Label10" runat="server" Text="Password"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txt_password" CssClass="form-control" Width="200px" placeholder="Enter Password" runat="server" required></asp:TextBox>
                    <div class="invalid-feedback">
                        Please Enter Password 
                    </div>
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

    <br />
    <br />


</asp:Content>
