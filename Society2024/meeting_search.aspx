<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meeting_search.aspx.cs" Inherits="Society.meeting_search" ValidateRequest="false" MasterPageFile="~/Site.Master" Async="true" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
     <script src="../Scripts/ckeditor/ckeditor.js"> </script>

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
                    window.location.href = 'meeting_search.aspx';
                }
            });
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
                            <th width="100%" class="">
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Meetings
                                </h1>
                            </th>
                        </tr>
                    </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
  <ContentTemplate>
                <asp:HiddenField ID="meet_id" runat="server" />
                <asp:HiddenField ID="meet_ex_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                  
                <div class="form-group">
                      <div class="col-12">
                         <div class="d-flex align-items-center">

                    <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="subject">Subject</asp:ListItem>
                        <asp:ListItem Value="meeting_date">Date</asp:ListItem>
                        <%-- <asp:ListItem Value="meeting_time">Time</asp:ListItem>--%>
                    </asp:DropDownList>&nbsp;&nbsp;

                      <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                    <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;

                    <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add</button>

                               </div>
                          </div>
                    </div>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="meet_id" ItemStyle-Width="200" SortExpression="meet_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="meet_id" runat="server" Text='<%# Bind("meet_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject" ItemStyle-Width="300" SortExpression="subject">
                                            <ItemTemplate>
                                                <asp:Label ID="subject" runat="server" Text='<%# Bind("subject")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="200" SortExpression="meeting_date">
                                            <ItemTemplate>
                                                <asp:Label ID="meeting_date" runat="server" Text='<%# Bind("meeting_date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Meeting Time" ItemStyle-Width="200" SortExpression="meeting_time">
                                            <ItemTemplate>
                                                <asp:Label ID="meeting_time" runat="server" Text='<%# Bind("meeting_time","{0:hh:mm tt}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("meet_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="0">
                                            <ItemTemplate>
                                               
                                                 <asp:LinkButton runat="server" ID="delete" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
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
                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: auto;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Meeting</strong></h4>
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
                                                        <asp:Label ID="Label1" runat="server" Text="Subject"></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_sub" CssClass="form-control" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" placeholder="Enter Subject" required autofocus></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Subject 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="lbl_co_name" runat="server" Text="Meeting Date"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_date" CssClass="form-control" runat="server" Height="32px" Width="200px" TextMode="Date" required autofocus ></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Meeting Date
                                                        </div>
                                                        <br />
                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-4">
                                                        <asp:Label ID="Label7" runat="server" Text="Meeting Time"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox ID="txt_time" CssClass="form-control" runat="server" Height="32px" Width="200px" TextMode="Time" required></asp:TextBox>
                                                        <div class="invalid-feedback">
                                                            Please Enter Meeting Time
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                            <asp:TextBox ID="editor1" runat="server" TextMode="MultiLine" Width="100%" CssClass="ckeditor" Rows="10"></asp:TextBox>



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
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
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
   
</asp:Content>
