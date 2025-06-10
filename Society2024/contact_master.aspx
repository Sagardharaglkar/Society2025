<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact_master.aspx.cs" Inherits="Society.contact_master" %>


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
                    window.location.href = 'contact_master.aspx';
                }
            });
        }

        function openModal() {
            $('#edit_model').modal('show');
        }

        function disableSaveButtonIfValid() {
            var btn = document.getElementById('<%= btn_save.ClientID %>');
            var modal = document.getElementById('edit_model');
            var inputs = modal.querySelectorAll('input[required], select[required]');
            var allValid = true;

            inputs.forEach(function (input) {
                if (!input.checkValidity()) {
                    allValid = false;
                }
            });

            if (allValid && btn) {
                btn.disabled = true;
                btn.value = "Saving...";


                __doPostBack('<%= btn_save.UniqueID %>', '');

                return false; // prevent default to avoid double postback
            }

            return false; // prevent postback if not valid
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">


                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Helpers
                            </h1>
                        </th>
                    </tr>
                </table>
                <br />



                <%--<div class="box box-info">--%>
                <%--  <div class="box-body">--%>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="usefull_contact_id" runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                        <asp:HiddenField ID="contact_type_id" runat="Server"/>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add</button>
                        <br />
                        <br />
                        <div class="box box-info">
                            <div class="form-group">
                                <div class="box-header">
                                    <div class="row ">
                                        <div class="col-sm-12">
                                            <h3 class="box-title"><strong>Electrician Contact</strong></h3>
                                            <div class="box-tools pull-right">
                                                <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <div class="box-body">
                                    <asp:GridView ID="GridView2" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Organization">
                                                <ItemTemplate>
                                                    <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contact No">
                                                <ItemTemplate>
                                                    <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark">
                                                <ItemTemplate>
                                                    <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <%--</div>--%>



                        <%-- </div>--%>


                        <div class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Plumber Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="box-body">
                                <asp:GridView ID="GridView1" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                        <div id="Div3" class="box box-info">

                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Carpenter Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView7" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>


                        <div id="Div4" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Milk Supplier Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView4" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>


                        <div id="Div5" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Paper Supplier Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView5" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>


                        <div id="Div6" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Mechanics Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView8" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>

                        <div id="Div7" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>TV Cable Contact</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView9" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>


                        </div>



                        <div id="Div1" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Servants Details</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView3" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("s_name")%>' NavigateUrl='<%# "servent_search.aspx?society_master_id=" + Eval("society_master_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("mobile_no1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("s_address_1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Alternate Contact">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("mobile_no2")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="Div1" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Building Cleaner Details</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView6" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="Div1" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Chairman Details</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView10" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="Div1" class="box box-info">
                            <div class="box-header">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <h3 class="box-title"><strong>Committee Members Details</strong></h3>
                                        <div class="box-tools pull-right">
                                            <button type="button" class="tn btn-info btn-sm" data-widget="collapse">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView11" Width="100%" runat="server" SkinID="gvSkin" CssClass="table table-bordered table-hover table-striped" HeaderStyle-BackColor="LightBlue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" AutoGenerateColumns="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "contact_master.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization">
                                            <ItemTemplate>
                                                <asp:Label ID="org_name" runat="server" Text='<%# Bind("org_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No">
                                            <ItemTemplate>
                                                <asp:Label ID="contact_no" runat="server" Text='<%# Bind("contact_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Bind("contact_address")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:Label ID="remark" runat="server" Text='<%# Bind("remark")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal fade bs-example-modal-sm" id="edit_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4">
                        <div class="modal-content" style="height: auto; width: 800px">
                            <div class="modal-header">
                                <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>New Helper</strong></h4>
                            </div>
                            <div class="modal-body" id="invoice_data">

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_acc_no" runat="server" Text="Person's name"></asp:Label>
                                                    <asp:Label ID="lbl_acc_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_p_name" CssClass="form-control" runat="server" Style="text-transform: capitalize;" placeholder="Enter person's Name" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Persons Name
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label7" runat="server" Text="Person's Type"></asp:Label>
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="dropdown-container">
                                                        <asp:TextBox ID="categoryBox" runat="server" CssClass="input-box form-control"
                                                            placeholder="Select category (Select Item)" autocomplete="off" />
                                                        <div id="categoryRepeaterContainer" style="width:239px;" class="suggestion-list">
                                                            <asp:Repeater ID="categoryRepeater" runat="server" OnItemCommand="CategoryRepeater_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton
                                                                        ID="lnkCategory"
                                                                        runat="server"
                                                                        CssClass="suggestion-item link-button category-link"
                                                                        Text='<%# Eval("p_type_name") %>'
                                                                        CommandArgument='<%# Eval("p_type_id") %>'
                                                                        CommandName="SelectCategory"
                                                                        OnClientClick="setCategoryBox(this.innerText);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                                        Text="No items found." />
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>


                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_name" runat="server" Text="Organization Name"></asp:Label>
                                                    <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_org_name" CssClass="form-control" runat="server" Style="text-transform: capitalize;" MaxLength="50" placeholder="Enter Oraganization Name" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Organization Name
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="lbl_pre_addr1" runat="server" Text="Address"></asp:Label>
                                                    <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_org_addr1" CssClass="form-control" Style="text-transform: capitalize;" runat="server" MaxLength="250" placeholder="Enter Oragnization Address" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Address
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label1" runat="server" Text="Contact No"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label13" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_org_tel" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Mobile No" onkeypress="return digit(event);" onblur="checkLength(this)" AutoPostBack="true" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Mobile No
                                                    </div>

                                                </div>
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_org_addr2" CssClass="not-required" Style="text-transform: capitalize;" runat="server" MaxLength="250" placeholder="Enter Address"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txt_email" CssClass="form-control" Style="text-transform: lowercase;" runat="server" placeholder="Enter Email Address" required></asp:TextBox>
                                                    <div class="invalid-feedback">
                                                        Please Enter Email Address
                                                    </div>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Email" ForeColor="Red" ErrorMessage="Invalid Email Format" Visible="True" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                                </div>
                                                <div class="col-sm-2">
                                                    <asp:Label ID="Label4" runat="server" Text="Remark"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox CssClass="not-required" ID="txt_remark" Style="text-transform: capitalize;" runat="server" placeholder="Enter Remark"></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView2" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView4" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView5" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView6" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView7" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView8" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView9" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView10" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="GridView11" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>
                            <div class="modal-footer">
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-12 text-center">
                                            <asp:Button ID="btn_save" runat="server" OnClientClick="disableSaveButtonIfValid();" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                            <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                            <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" UseSubmitBehavior="False" OnClientClick="resetForm(); return false;" data-dismiss="modal" />


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
<script>

    function initDropdownEvents() {

        const categoryBox = document.getElementById("<%= categoryBox.ClientID %>");

        const categorySuggestions = document.getElementById("categoryRepeaterContainer");

        categoryBox.addEventListener("focus", function () {

            categorySuggestions.style.display = "block";

            itemSuggestions.style.display = "none";

        });

        categoryBox.addEventListener("input", function () {

            const input = categoryBox.value.toLowerCase();

            filterSuggestions("category-link", input);

        });


    }


    function filterSuggestions(className, value) {

        const items = document.querySelectorAll("." + className);

        let matchFound = false;

        items.forEach(item => {

            if (item.innerText.toLowerCase().includes(value.toLowerCase())) {

                item.style.display = "block";

                matchFound = true;

            } else {

                item.style.display = "none";

            }

        });

        let noMatchMessage = document.getElementById("no-match-message");

        if (!matchFound) {

            if (!noMatchMessage) {

                noMatchMessage = document.createElement("div");

                noMatchMessage.id = "no-match-message";

                noMatchMessage.innerText = "No matching suggestions.";

                items[0]?.parentNode?.appendChild(noMatchMessage);

            }

            noMatchMessage.style.display = "block";

        } else {

            if (noMatchMessage) {

                noMatchMessage.style.display = "none";

            }

        }

    }


    function setCategoryBox(value) {

        document.getElementById("<%= categoryBox.ClientID %>").value = value;

        document.getElementById("categoryRepeaterContainer").style.display = "none";

    }


    Sys.Application.add_load(initDropdownEvents);


</script>
 
</asp:Content>



