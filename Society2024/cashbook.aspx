<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashbook.aspx.cs" Inherits="Society.cashbook" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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




    <%-- <div class="container">
        <div class="card card-primary">
            <div class="card-body" style="background-color: lemonchiffon">
                <div class="row justify-content-center align-items-center text-center text-white bg-dark">
                    <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-10">

                        <br />
                        <br />
                        <div class="container" style="box-shadow: 2px 1px 35px 6px #000000; box-shadow: 2px 1px 35px 6px #000000;">
                            <br />--%>
    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%" class="">
                            <h1 class=" tex0 font-weight-bold " style="color: #012970;">Financial Report
                            </h1>
                        </th>
                    </tr>
                </table>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="build_id" runat="server" />


                <asp:HiddenField ID="shop_maint_id" runat="server" />
                <asp:HiddenField ID="wing_id" runat="server" />
                <asp:HiddenField ID="owner_id" runat="server" />

                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-1">
                            <asp:Label ID="Label1" runat="server" Text="Building Name :"></asp:Label>

                        </div>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="ddl_build" runat="server" ValidationGroup="valid" AutoPostBack="true" Width="150px"></asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="ddl_build" ID="RequiredFieldValidator2"
                                ValidationGroup="valid" CssClass="errormesg" ForeColor="Red" ErrorMessage="Please select a building"
                                InitialValue="select" runat="server" Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-sm-1">
                            <asp:Label ID="lbl_date" runat="server" Text="From Date :"></asp:Label>

                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txt_from" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label ID="Label12" runat="server" Text="To Date :"></asp:Label>

                        </div>
                        <div class="col-sm-2">
                            <asp:TextBox ID="txt_to" TextMode="Date" runat="server"></asp:TextBox>
                        </div>



                        <div class="col-sm-1">
                            <%-- <i class="fas fa-search"></i>--%>
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" ValidationGroup="valid" Text="Search" UseSubmitBehavior="False" va />
                        </div>

                        <div class="col-sm-1">

                            <asp:Button ID="btn_print" runat="server" class="btn btn-primary" OnClick="btn_print_Click" Text="Print" UseSubmitBehavior="False" />
                        </div>
                    </div>



                </div>
            </div>
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <div align="center">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="59%"></rsweb:ReportViewer>
                </div>
            </asp:Panel>

            <div class="form-group">
                <div class="row ">
                    <div class="col-sm-12">
                        <div style="width: 100%; overflow: auto;">
                            <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" ItemStyle-Width="200" SortExpression="date">
                                        <ItemTemplate>
                                            <asp:Label ID="receipt_no" runat="server" Text='<%# Bind("date","{0: dd-MMM-yyyy}")%>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Particular" ItemStyle-Width="450" SortExpression="Particular">
                                        <ItemTemplate>
                                            <asp:Label ID="b_id" runat="server" Text='<%# Bind("Particular")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit" ItemStyle-Width="300" SortExpression="Debit">
                                        <ItemTemplate>
                                            <asp:Label ID="name" runat="server" Text='<%# Bind("Debit")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit" ItemStyle-Width="150" SortExpression="Credit">
                                        <ItemTemplate>
                                            <asp:Label ID="name1" runat="server" Text='<%# Bind("Credit")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>


                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
