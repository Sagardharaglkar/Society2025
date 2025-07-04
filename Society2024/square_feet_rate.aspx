<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="square_feet_rate.aspx.cs" Inherits="Society2024.square_feet_rate" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
       
        function openModal() {
            $('#edit_model').modal('show');
        }


        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function validateAndSubmit() {

            $('#emailmodal').modal('hide');
            return true;
        }
   
        function openEmailModal() {
            $('#emailmodal').modal('show');
        }
    </script>
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

                }, willClose: () => {

                    window.location.href = 'square_feet_rate.aspx';

                }

            });

        }

    </script>

    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                           
                                <h1 class=" font-weight-bold " style="color: #012970;">Square Feet Rate</h1>
 
                         
                        </th>
                    </tr>
                </table>
              
                 <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                 <ContentTemplate>
                <asp:HiddenField ID="sq_rate_id" runat="server" />
                <asp:HiddenField ID="village_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="house_type_id" runat="server" />
                <asp:HiddenField ID="house_id" runat="server" />
                <asp:HiddenField ID="modified_u_id" runat="server" />

                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                            <div class="d-flex align-items-center">

                                <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="rate">Square Feet Rate</asp:ListItem>
                                    <asp:ListItem Value="house_type.house_type">House Type</asp:ListItem>
                                    <asp:ListItem Value="applied_date">Applied Date</asp:ListItem>

                                </asp:DropDownList>&nbsp;&nbsp;
                      
                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" Font-Bold="true" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                        
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
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnPageIndexChanging="GridView1_PageIndexChanging" Pagesize="15" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">


                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Square Feet Rate" SortExpression="sq_rate_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="sq_rate_id" runat="server" Text='<%# Bind("sq_rate_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rate" SortExpression="rate">
                                            <ItemTemplate>
                                                <asp:Label ID="rate" runat="server" Text='<%# Bind("rate")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="House Type" SortExpression="house_type">
                                            <ItemTemplate>
                                                <asp:Label ID="ht" runat="server" Text='<%# Bind("house_type")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Applied Date" SortExpression="applied_date">
                                            <ItemTemplate>
                                                <asp:Label ID="applied_date" runat="server" Text='<%# Bind("applied_date","{0:dd-MM-yyyy}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit1" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("sq_rate_id")%>'><img src="Images/123.png" /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                     </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
     </asp:UpdatePanel>
             


                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 1000px;">
                            <div class="modal-header">
                              <h4 class="modal-title" id="gridSystemModalLabel"><strong>Square Feet Rate</strong></h4>
                                
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
                                                        <asp:Label ID="Label3" runat="server" Text="House Type"></asp:Label>
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">

                                                        <asp:DropDownList ID="ddl_house_type" Height="32px" Width="200px" runat="server" OnSelectedIndexChanged="ddl_house_type_SelectedIndexChanged"></asp:DropDownList>

                                                    </div>


                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Rate/Per sq ft"></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                    </div>
                                                   
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_rate" runat="server" Height="32px" Width="200px" placeholder="Enter Square Feet Rate"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <div class="row ">

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label6" runat="server" Text="Bill Generation Date"></asp:Label>
                                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_gen_date" runat="server" Height="32px" Width="200px" TextMode="Date" required autofocus></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div> 
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label10" runat="server" Text="Due Date"></asp:Label>
                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_due" runat="server" Height="32px" Width="200px" TextMode="Date" required autofocus></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <div class="row ">
                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label2" runat="server" Text="Applied Date"></asp:Label>
                                                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <asp:TextBox ID="txt_applied_date" runat="server" Height="32px" Width="200px" TextMode="Date" required autofocus></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
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
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="false" CausesValidation="False" />
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
