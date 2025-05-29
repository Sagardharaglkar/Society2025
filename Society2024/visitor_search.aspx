<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitor_search.aspx.cs" Inherits="Society.visitor_search" MasterPageFile="~/Site.Master" %>


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
                    window.location.href = 'visitor_search.aspx';
                }
            });
        }

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

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
                            <h1 class=" font-weight-bold " style="color: #012970;">Visitors</h1>
                        </th>
                    </tr>
                </table>
                <br />


                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:HiddenField ID="visitor_id" runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="society_id" runat="server" />


                        <div class="form-group">
                            <div class="row align-items-end">

                                <!-- Visitor Type -->
                                <div class="col-sm-2">
                                    <asp:Label ID="lbl_acc_no" runat="server" ForeColor="Black" Text="Visitor Type"></asp:Label>
                                    <asp:DropDownList ID="drp_visiting_type" runat="server" ForeColor="Gray">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem Value="Cab">Cab</asp:ListItem>
                                        <asp:ListItem Value="Service">Home service</asp:ListItem>
                                        <asp:ListItem Value="Delivery">Delivery</asp:ListItem>
                                        <asp:ListItem Value="Guest">Guest & Others</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <!-- From Date -->
                                <div class="col-sm-2">
                                    <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="From Date"></asp:Label>
                                    <asp:TextBox ID="txt_from" runat="server" ForeColor="Gray" TextMode="Date"></asp:TextBox>
                                </div>

                                <!-- To Date -->
                                <div class="col-sm-2">
                                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="To Date"></asp:Label>
                                    <asp:TextBox ID="txt_to" runat="server" ForeColor="Gray" TextMode="Date"></asp:TextBox>
                                </div>

                                <!-- Buttons -->
                                <div class="col-sm-6">
                                    <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" UseSubmitBehavior="False" CssClass="btn btn-primary me-2" />
                                    <button type="button" class="btn btn-primary me-2" data-toggle="modal" data-target=".bs-example-modal-sm">New Entry</button>
                                    <asp:Button ID="btn_print" runat="server" Text="Print" OnClick="btn_print_Click" UseSubmitBehavior="False" CssClass="btn btn-primary" />
                                </div>

                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row ">
                                <div class="col-sm-12">
                                    <div style="width: 100%; overflow: auto;">
                                        <asp:GridView ID="GridView1" runat="server" PageSize="15" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="No" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="visitor_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="visitor_id" runat="server" Text='<%#Bind("visitor_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" SortExpression="v_name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ID1" runat="server" Text='<%#Bind("v_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Visitor Type" SortExpression="type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="v_type" runat="server" Text='<%# Bind("type")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="In Date" SortExpression="in_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="in_date" runat="server" Text='<%# Bind("in_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IN Time" SortExpression="in_time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="in_time" runat="server" Text='<%# Bind("in_time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Out Date" SortExpression="out_date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="out_date" runat="server" Text='<%# Bind("out_date", "{0:dd-MM-yyyy}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Out Time" SortExpression="out_time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="out_time" runat="server" Text='<%# Bind("out_time")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("visitor_id")%>'><img src="Images/123.png"/></asp:LinkButton>

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
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4" style="right: 80px">
                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Visitor Details</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_date" runat="server" Text="In Date"></asp:Label>
                                                    <asp:Label ID="lbl_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_in_date" Width="192px" Height="32px" TextMode="Date" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label32" runat="server" Text="Out Date"></asp:Label>
                                                    <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_out_date" Width="192px" Height="32px" TextMode="Date" runat="server" ValidationGroup="g1"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3"></div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_in_time" runat="server" Width="192px" Height="32px" Enabled="false"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3"></div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_out_time" Width="192px" Height="32px" TextMode="Time" runat="server" ValidationGroup="g1"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label3" runat="server" Text="Visitor's name:"></asp:Label>

                                                    <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_v_name" runat="server" Style="text-transform: capitalize;" required placeholder="Enter Visitor's Name" Width="192px" Height="32px"></asp:TextBox>
                                                </div>


                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label34" runat="server" Text="Contact No"></asp:Label>
                                                    <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label36" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_contact" runat="server" MaxLength="10" placeholder="Enter No" onkeypress="return digit(event);" required></asp:TextBox>
                                                    <br />
                                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_org_tel" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+" ValidationGroup="g1" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Phone number" Font-Bold="True" ForeColor="Red" ControlToValidate="txt_contact" ValidationExpression="[0-9]{10}" ValidationGroup="g1" Display="Dynamic"> </asp:RegularExpressionValidator>
                                                    <asp:Label ID="Label37" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>


                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label29" runat="server" Text="Building"></asp:Label>
                                                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_build" Height="32px" Width="192px" OnSelectedIndexChanged="ddl_build_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="valid" runat="server"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ControlToValidate="ddl_flat" ID="RequiredFieldValidator2"
                                                        ValidationGroup="valid" CssClass="errormesg" ForeColor="Red" ErrorMessage="Please select a type"
                                                        InitialValue="select" runat="server" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label6" runat="server" Text="Visiting Flat No"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_flat" Height="32px" Width="192px" ValidationGroup="valid" runat="server"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ControlToValidate="ddl_flat" ID="RequiredFieldValidator4"
                                                        ValidationGroup="valid" CssClass="errormesg" ForeColor="Red" ErrorMessage="Please select a type"
                                                        InitialValue="select" runat="server" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>


                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label7" runat="server" Text="Visiting Type"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*" required></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_visiting_type" OnSelectedIndexChanged="ddl_visiting_type_SelectedIndexChanged" runat="server" Height="32px" Width="192px" AutoPostBack="true">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                        <asp:ListItem Value="Cab">Cab </asp:ListItem>
                                                        <asp:ListItem Value="Service">Home Service </asp:ListItem>
                                                        <asp:ListItem Value="Delivery">Delivery </asp:ListItem>
                                                        <asp:ListItem Value="Guest">Guest & Others </asp:ListItem>

                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ControlToValidate="ddl_visiting_type" ForeColor="Red" ID="RequiredFieldValidator1"
                                                        ValidationGroup="valid" CssClass="errormesg" ErrorMessage="Please select a type"
                                                        InitialValue="Select" runat="server" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label12" runat="server" Text="Vehical No"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_vehical_no" runat="server" Style="text-transform: capitalize;" MaxLength="250" placeholder="Enter Vehical No." Width="192px" Height="32px"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>

                                        <asp:Panel ID="delivary" runat="server" Visible="false">
                                            <div class="form-group">
                                                <div class="row ">

                                                    <div class="col-sm-3">
                                                        <asp:Label ID="Label4" runat="server" Text="Preference"></asp:Label>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="Leave At Gate" Checked="true" GroupName="led_status" />
                                                        &nbsp;&nbsp;
                                                     <asp:RadioButton ID="RadioButton2" runat="server" Text="Doorstep" GroupName="led_status" />
                                                    </div>
                                                </div>
                                        </asp:Panel>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label19" runat="server" Text="Visiting Purpose"></asp:Label>
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_visiting_purpose" runat="server" Style="text-transform: capitalize;" MaxLength="250" Width="192px" Height="32px" placeholder="Enter Visiting Purpose" required></asp:TextBox>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label26" runat="server" Text="Image"></asp:Label>
                                                    <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,jpeg" />
                                                    <asp:Label ID="image" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>


                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>


                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-12">
                                            <div class="pull-center">
                                                <asp:Button ID="btn_in" runat="server" Text="In" class="btn btn-primary" BackColor="red" ValidationGroup="valid" OnClick="btn_in_Click" />
                                                <asp:Button ID="btn_out" runat="server" Text="Out" class="btn btn-primary" BackColor="red" ValidationGroup="g1" OnClick="btn_out_Click" Visible="false" />
                                                <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" UseSubmitBehavior="false" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>



