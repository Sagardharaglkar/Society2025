<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact_master.aspx.cs" Inherits="Society.contact_master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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


              <table width="100%">
                        <tr>
                            <th width="100%" class="">
                                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Helpers
                                </h1>
                            </th>
                        </tr>
                    </table>
            <br />
          <div class="pull-left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                </div>
    <asp:HiddenField ID="v_id" runat="server"></asp:HiddenField>
     <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>

      <%--<div class="box box-info">--%>
      <%--  <div class="box-body">--%>
  <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

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
                            <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>'  NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <h3 class="box-title"><strong> Carpenter Contact</strong></h3>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>'  NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>'  NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>'  NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>'  NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
                    <asp:HyperLink ID="p_name" runat="server" Text='<%#Bind("p_name")%>' NavigateUrl='<%# "usefull_contact.aspx?usefull_contact_id=" + Eval("usefull_contact_id")%>'></asp:HyperLink>
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
         </div>
            </div>
          </div>
   
</asp:Content>



