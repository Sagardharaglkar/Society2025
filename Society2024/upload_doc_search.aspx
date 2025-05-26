<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload_doc_search.aspx.cs" Inherits="Society.upload_doc_search" MasterPageFile="~/Site.Master" %>


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
        function openModal() {
            $('#edit_model').modal('show');
        }
    </script>
    
   

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <asp:HiddenField ID="file_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Search Documents</center>
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>

                <div class="form-group">
                    <div class="row">
                    <div class="col-12">
                     <div class="d-flex align-items-center">
                       
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="name">Building name</asp:ListItem>
                                <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                <asp:ListItem Value="doc_name">Document</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp;

                              <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search Here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>
                        </div>

                    </div>
                </div>

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" OnRowUpdating="GridView1_RowUpdating" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AllowSorting="true" HeaderStyle-BackColor="lightblue" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">

                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:CommandField ShowSelectButton="false" ControlStyle-ForeColor="blue" />--%>
                                        <%--<asp:TemplateField HeaderText="ID" Visible="true" SortExpression="facility_id">
                                                        <ItemTemplate>

                                                            <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='<%# "flat.aspx?facility_id=" + Eval("facility_id")%>' Text='<%# Bind("facility_id")%>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="file_id" SortExpression="file_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="file_id" runat="server" Text='<%# Bind("file_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Building Name" Visible="true" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="HyperLink1" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit" SortExpression="flat_no">
                                            <ItemTemplate>
                                                <asp:Label ID="w_name" runat="server" Text='<%# Eval("w_name")+":" +Eval("flat_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document" SortExpression="doc_name">
                                            <ItemTemplate>
                                                <asp:Label ID="flat_type" runat="server" Text='<%# Bind("doc_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("file_id")%>'><img src="Images/123.png"/></asp:LinkButton>
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
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: auto;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Documents Upload</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel ID="afdhh" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="lbl_co_name" runat="server" Text="Date"></asp:Label>
                                                    <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:TextBox ID="txt_date" runat="server" Height="32px" Width="200px" placeholder="Enter Date" TextMode="Date" required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label1" runat="server" Text="Document name"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddl_doc_type" Height="32px" Width="200px" runat="server" required></asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label4" runat="server" Text="Building Name"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddl_build" Height="32px" Width="200px" runat="server" parsley-trigger="change" OnSelectedIndexChanged="ddl_build_SelectedIndexChanged" AutoPostBack="true" required></asp:DropDownList>
                                                    <asp:CompareValidator ControlToValidate="ddl_build" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Building Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label3" runat="server" Text="Wing Name"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddl_wing" Height="32px" Width="200px" runat="server" parsley-trigger="change" OnSelectedIndexChanged="ddl_wing_SelectedIndexChanged" AutoPostBack="true" required></asp:DropDownList>

                                                    <asp:CompareValidator ControlToValidate="ddl_wing" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Wing Name" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    <asp:TextBox ID="txt_wing" runat="server" Height="32px" Width="200px" Visible="false"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        



                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-4">
                                                    <asp:Label ID="Label6" runat="server" Text="Flat Number"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <asp:DropDownList ID="ddl_flatno" Height="32px" Width="200px" runat="server" AutoPostBack="true" parsly-trigger="change" OnSelectedIndexChanged="ddl_flatno_SelectedIndexChanged" required></asp:DropDownList>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                    <asp:CompareValidator ControlToValidate="ddl_flatno" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    <asp:TextBox ID="txt_no" runat="server" Height="32px" Width="200px" Visible="false"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>


                                       
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-4">
                                            <asp:FileUpload ID="file_name" runat="server" Font-Bold="False" />
                                            <br />
                                            <asp:Label ID="listofuploadedfiles" runat="server" />
                                            <asp:Label ID="Label15" runat="server" Height="32px" Width="200px" />

                                            <asp:Button ID="upload" Text="Upload" runat="server" OnClick="upload_Click" class="btn btn-primary" Font-Bold="True" ValidationGroup="g1" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Height="32px" Width="200px"></asp:Label>
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="pull-center">
                                                <asp:Button ID="btn_close" runat="server" Text="Back" class="btn btn-primary" OnClick="btn_close_Click"   OnClientClick="if (confirm('Are you sure you want to Close?')) { __doPostBack('<%= btn_close.UniqueID %>', ''); } return false;" />
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
</div>
</asp:Content>
