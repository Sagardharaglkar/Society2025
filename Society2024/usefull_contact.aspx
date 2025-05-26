<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usefull_contact.aspx.cs" Inherits="Society.usefull_contactDataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }
    </script>
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">


                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Contact Saved</center>
                            </h1>
                        </th>
                    </tr>

                </table>
                <br />
            </div>



            <asp:HiddenField ID="usefull_contact_id" runat="server" />
            <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
            <div class="box box-info">
                <div class="box-body">

                    <div class="form-group">
                        <div class="row ">
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_acc_no" runat="server" Text="Person's name"></asp:Label>
                                <asp:Label ID="lbl_acc_no_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_p_name" runat="server" Style="text-transform: capitalize;" placeholder="Enter person's Name" required></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="Label7" runat="server" Text="Person's Type"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="drp_per_type" runat="server" OnSelectedIndexChanged="drp_per_type_SelectedIndexChanged" AutoPostBack="True" Width="200px"></asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="drp_per_type" ErrorMessage="Required" Font-Bold="True" ForeColor="Red" ValidationGroup="g1" ValueToCompare="select" Type="String" Operator="NotEqual"></asp:CompareValidator>
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
                                <asp:TextBox ID="txt_org_name" runat="server" Style="text-transform: capitalize;" MaxLength="50" placeholder="Enter Oraganization Name" required></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_pre_addr1" runat="server" Text="Address"></asp:Label>
                                <asp:Label ID="lbl_pre_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="Label12" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium" Text="*"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_org_addr1" Style="text-transform: capitalize;" runat="server" MaxLength="250" placeholder="Enter Oragnization Address" required></asp:TextBox>
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
                                <asp:TextBox ID="txt_org_tel" runat="server" MaxLength="10" placeholder="Enter Mobile No" onkeypress="return digit(event);" onblur="checkLength(this)" AutoPostBack="true" required></asp:TextBox>

                            </div>
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_org_addr2" Style="text-transform: capitalize;" runat="server" MaxLength="250" placeholder="Enter Address" required></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row ">
                            <div class="col-sm-2">
                                <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="Label14" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Medium" Text="*"></asp:Label>
                                <%--<asp:TextBox ID="TextBox1"  runat="server"/>--%>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_email" Style="text-transform: lowercase;" runat="server" placeholder="Enter Email Address" required></asp:TextBox><br />
                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Email" ForeColor="Red" ErrorMessage="Invalid Email Format" Visible="True" ValidationGroup="g1"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="Label4" runat="server" Text="Remark"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>

                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_remark" Style="text-transform: capitalize;" runat="server" placeholder="Enter Remark"></asp:TextBox>
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row ">
                            <div class="col-sm-12 text-center">
                                    <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="g1" />
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-primary" OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btn_delete_Click" />
                                    <asp:Button ID="btn_close" runat="server" Text="Close" class="btn btn-primary" OnClick="btn_close_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
