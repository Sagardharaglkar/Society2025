<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Society2024.Admin_Dashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
   
    <style>
        .resized-model{
        width: 529px;
    height: auto;
    right: 82px;
}

@media(max-width: 431px){
   .resized-model{
       height: auto;
    margin: auto;
    width: 233px;
    margin-top: 168px;
    right: 1px;
   }
}
    </style>
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
                            <h1 class=" font-weight-bold " style="color: #012970;">Admin Dashboard</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="HiddenField4" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>

        <%--<div class="col-sm-1.5">
            <asp:Label Visible="false" ID="society_name" runat="server" Text="Society Name"></asp:Label>
        </div>
        <div class="col-sm-2">
            <asp:DropDownList Visible="false" ID="drp_society" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>--%>

        <div class="form-group">
            <div class="row ">
                <div class="col-12">
                    <div class="d-flex align-items-center">
                        <div class="search-container">
                            <asp:TextBox
                                ID="txt_search"
                                CssClass="aspNetTextBox"
                                placeHolder="Search here"
                                TextMode="Search"
                                runat="server" />

                            <button
                                id="btn_search"
                                type="submit"
                                class="search-button"
                                runat="server"
                                onserverclick="btn_search_Click">
                                <span class="material-symbols-outlined">search</span>
                            </button>
                        </div>
                        &nbsp;&nbsp;
                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">Add</button>

                    </div>
                </div>
            </div>
        </div>




        <asp:Panel ID="filterSection" runat="server" visible="false" CssClass="row mt-2">
        <div class="col-sm-2">
            <asp:Label ID="lbl_state" runat="server" Text="State"></asp:Label>
            <asp:DropDownList ID="drp_state" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_district" runat="server" Text="District"></asp:Label>
            <asp:DropDownList ID="drp_district" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
         <div class="col-sm-2">
            <asp:Label ID="lbl_division" runat="server" Text="Division"></asp:Label>
            <asp:DropDownList ID="drp_division" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_city" runat="server" Text="City"></asp:Label>
            <asp:DropDownList ID="drp_city" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_pincode" runat="server" Text="Pin Code"></asp:Label>
            <asp:TextBox ID="txt_pincode" runat="server" Width="180px" Height="32px" placeHolder="Enter Pin Code"></asp:TextBox>
        </div>
    </asp:Panel>









                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" EmptyDataText="No Record Found" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="lightblue" AllowSorting="true" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Society Name" ItemStyle-Width="400" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="society_name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Address" ItemStyle-Width="400" SortExpression="address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Flats" ItemStyle-Width="150" SortExpression="total_flats">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("total_flats")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Point of Contact" ItemStyle-Width="400" SortExpression="contact_no1">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact_no1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email Address" ItemStyle-Width="150" SortExpression="email">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Charges Per Month" ItemStyle-Width="150" SortExpression="chargesPerMonth">
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("chargesPerMonth")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Amount" ItemStyle-Width="150" SortExpression="pending_amount">
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("pending_amount")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Month" ItemStyle-Width="150" SortExpression="month">
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("month")%>'></asp:Label>
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
                </div>
            </div>
           
        </div>
   

</asp:Content>