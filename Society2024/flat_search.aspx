<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flat_search.aspx.cs" Inherits="Society.flat_search" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function openModal() {
            $('#edit_model').modal('show');
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
                },
                willClose: () => {
                    window.location.href = 'flat_search.aspx';
                }
            });
        }
    </script>


    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Flats
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <asp:HiddenField ID="flat_id" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                        <div class="form-group">
                            <div class="row ">
                                <div class="col-12">
                                    <div class="d-flex align-items-center">

                                        <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px" OnSelectedIndexChanged="search_field_SelectedIndexChanged">
                                            <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                            <asp:ListItem Value="bed">Bedrooms</asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp;
                      
                             <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                                 <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" runat="server" placeholder="Search here"></asp:TextBox>&nbsp;&nbsp;
                        
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" />
                                        </asp:Panel>
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
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting">
                                            <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="facility_id" ItemStyle-Width="150px" SortExpression="flat_id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="flat_id" runat="server" Text='<%# Bind("flat_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building & Wing Name" ItemStyle-Width="500px" SortExpression="build_wing">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl5" runat="server" Text='<%# Bind("build_wing")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Flat No" ItemStyle-Width="180px" SortExpression="flat_no">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl2" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bedrooms" ItemStyle-Width="180px" SortExpression="bed">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl4" runat="server" Text='<%# Bind("bed")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Sq.Ft" ItemStyle-Width="180px" SortExpression="sq_ft">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl1" runat="server" Text='<%# Bind("sq_ft")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Types" ItemStyle-Width="180px" SortExpression="flat_type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl8" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Usege" ItemStyle-Width="180px" SortExpression="usage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbl12" runat="server" Text='<%# Bind("usage")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("flat_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="delete" CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"><img src="Images/delete_10781634.png" height="25" width="25" /> </asp:LinkButton>
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
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 750px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Add Flat</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                               <ContentTemplate>
     <div class="form-group">
         <div class="row ">
             <div class="col-sm-2">
                 <asp:Label ID="Label5" runat="server" Text="Building & Wing :"></asp:Label>

                 <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
             </div>
             <div class="col-sm-4">
                 <asp:DropDownList CssClass="form-select" ID="ddl_build_wing" Width="150px" Height="30px" runat="server"></asp:DropDownList>
                 <div class="invalid-feedback">
                     Please Select Building & Wing
                 </div>
                 <br />
                 <asp:CompareValidator ControlToValidate="ddl_build_wing" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Building & Wing" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
             </div>


             <div class="col-sm-2">
                 <asp:Label ID="lbl_co_name" runat="server" Text="Flat Type :"></asp:Label>

                 <asp:Label ID="lbl_co_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
             </div>
             <div class="col-sm-4">
                 <asp:DropDownList CssClass="form-select" ID="ddl_type" Width="150px" Height="30px" runat="server"></asp:DropDownList>
                 <div class="invalid-feedback">
                     Please Select Flat Type 
                 </div>
                 <br />
                 <asp:CompareValidator ControlToValidate="ddl_type" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a type" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
             </div>

         </div>
     </div>
     <div class="form-group">
         <div class="row ">

             <div class="col-sm-2">
                 <asp:Label ID="Label11" runat="server" Text="Flat No "></asp:Label>
                 <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                 <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

             </div>
             <div class="col-sm-4">
                 <asp:TextBox ID="txt_no" CssClass="form-control" Width="150px" Height="30px" Style="text-transform: capitalize;" parsely="trigger" AutoPostBack="true" required OnTextChanged="txt_no_TextChanged" PlaceHolder="Enter Flat Number" runat="server"></asp:TextBox>
                 <div class="invalid-feedback">
                     Please Enter Flat No
                 </div>
                 <br />
                 <asp:Label ID="Label20" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
             </div>
             <div class="col-sm-2">
                 <asp:Label ID="Label2" runat="server" Text="Usage"></asp:Label>
                 <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                 <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
             </div>
             <div class="col-sm-4">
                 <asp:DropDownList CssClass="form-select" ID="ddl_usage" Width="150px" Height="30px" runat="server"></asp:DropDownList>
                 <div class="invalid-feedback">
                     Please select Usage
                 </div>
                 <br />
                 <asp:CompareValidator ControlToValidate="ddl_usage" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a Usege" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
             </div>
         </div>
     </div>
     <div class="form-group">
         <div class="row ">
             <div class="col-sm-2">
                 <asp:Label ID="Label1" runat="server" Text="Bedrooms"></asp:Label>
                 <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                 <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
             </div>
             <div class="col-sm-4">

                 <asp:DropDownList CssClass="form-select" ID="ddl_bed" Width="150px" Height="30px" runat="server"></asp:DropDownList>
                 <div class="invalid-feedback">
                     Please Select Bedrooms
                 </div>
                 <br />
                 <asp:CompareValidator ControlToValidate="ddl_bed" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select Bedrooms" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
             </div>
             <div class="col-sm-2">
                 <asp:Label ID="Label6" runat="server" Text="Size(Sq.Ft)"></asp:Label>
                 <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                 <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
             </div>
             <div class="col-sm-4">
                 <asp:TextBox ID="txt_feet" CssClass="form-control" runat="server" Width="150px" Height="30px" placeholder="Enter size" required></asp:TextBox>
                 <div class="invalid-feedback">
                     Please Enter Size
                 </div>




             </div>
         </div>
     </div>
     <div class="form-group">
         <div class="row ">
             <div class="col-sm-2">
                 <asp:Label ID="Label14" runat="server" Text="Open Terraced(Sq.Ft)"></asp:Label>
             </div>
             <div class="col-sm-4">
                 <asp:TextBox ID="txt_terrace" CssClass="form-control" runat="server" Width="150px" Height="30px" placeholder="Enter size" required></asp:TextBox>
                 <div class="invalid-feedback">
                     Please Enter Size
                 </div>

             </div>


             <div class="col-sm-2">
                 <asp:Label ID="Label18" runat="server" Text="InterCom No"></asp:Label>
                 <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

             </div>
             <div class="col-sm-4">
                 <asp:TextBox ID="txt_intercom" CssClass="form-control" runat="server" Width="150px" Height="30px" placeholder="Enter Number" required></asp:TextBox>
                 <div class="invalid-feedback">
                     Please Enter No 
                 </div>

             </div>

         </div>
     </div>

 </ContentTemplate>
                                </asp:UpdatePanel>



                            </div>
                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary" ValidationGroup="g1" />
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
    </div>

    <br />




    <br />


</asp:Content>
