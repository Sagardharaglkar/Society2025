<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event_search.aspx.cs" Inherits="Society.event_search" MasterPageFile="~/Site.Master" Async="true" %>


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
                    window.location.href = 'event_search.aspx';
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
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Events
                                </h1>
                            </th>
                        </tr>
                    </table>
               
                <asp:HiddenField ID="event_id" runat="server" />
                <asp:HiddenField ID="visitor_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">

                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="event_name">Event's Name</asp:ListItem>
                                            <asp:ListItem Value="from_date">Date</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;
                      
                              <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                  <asp:TextBox ID="txt_search" Font-Bold="true" Width="200px" Height="32px" Style="text-transform: capitalize;" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                      
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                                        </asp:Panel>
                                        &nbsp;&nbsp;
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add</button>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">

                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="event_id" ItemStyle-Width="200" SortExpression="event_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="event_id" runat="server" Text='<%# Bind("event_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText=" Event Name" SortExpression="event_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="event_name" runat="server" Text='<%# Bind("event_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From date" SortExpression="from_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="from_date" runat="server" Text='<%# Bind("from_date","{0:yyyy-MM-dd}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To Date" SortExpression="to_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="to_date" runat="server" Text='<%# Bind("to_date","{0:yyyy-MM-dd}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description" ItemStyle-Width="200" SortExpression="description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="desciption" runat="server" Text='<%# Bind("description")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("event_id")%>'> <img src="Images/123.png" /></asp:LinkButton>
                                                        <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>-  NavigateUrl='<%# "wing_search.aspx?w_id=" + Eval("w_id")%>' --%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
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
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-6">
                        <div class="modal-content" style="height: auto; width: 500px;">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Event</strong></h4>
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
                                                    <asp:Label ID="Label1" runat="server" Text="Event Name"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_sub" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" placeholder="Enter Subject" required autofocus></asp:TextBox>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="lbl_co_name" runat="server" Text="From Date"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_from_date" runat="server" Height="32px" Width="200px" required TextMode="Date"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label7" runat="server" Text="To Date"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_to_date" runat="server" Height="32px" Width="200px" required TextMode="Date"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_desc" runat="server" TextMode="MultiLine" Rows="3" Height="100px" Width="200px" placeholder="Enter Description"></asp:TextBox>
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
                                            <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" Visible="false" OnClick="btn_delete_Click" />
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
