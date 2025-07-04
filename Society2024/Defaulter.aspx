<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Defaulter.aspx.cs" Inherits="Society2024.Defaulter" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">

                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">Defaulters</h1>
                        </th>
                    </tr>
                </table>

                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>

                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
        <div class="d-flex flex-wrap align-items-center justify-content-between">
            <div class="form-group d-flex align-items-center mt-0 flex-wrap">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center ">


                                <div class="search-container">

                                    <asp:TextBox
                                        ID="txt_search"
                                        CssClass="aspNetTextBox"
                                        placeHolder="Search here"
                                        runat="server"
                                        TextMode="Search"
                                        AutoPostBack="true"
                                        OnTextChanged="btn_search_Click"
                                        onkeyup="removeFocusAfterTyping()" />

                                    <!-- Calendar and Search Buttons -->
                                    <div class="input-buttons">
                                        <button
                                            id="btn_search"
                                            type="submit"
                                            class="search-button2"
                                            runat="server"
                                            onserverclick="btn_search_Click">
                                            <span class="material-symbols-outlined">search</span>
                                        </button>
                                    </div>
                                </div>

                                &nbsp;&nbsp;
                        
                            </div>

                        </div>
                    </div>
                </div>
                <div>
                    <asp:CheckBox ID="select_all" runat="server" OnCheckedChanged="select_all_CheckedChanged" AutoPostBack="true" Text="Select All" />
                    &nbsp;&nbsp;
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center mr-5">
                <h3 class=" font-weight-bold mb-0" style="color: #012970;">Total Due</h3>
                &nbsp;&nbsp;
 <asp:Label runat="server" ID="lbl_due" Font-Size="24px"></asp:Label>&nbsp;&nbsp;<span style="font-size: 24px;">₹</span>

            </div>
        </div>
        <div class="form-group">
            <div class="row ">

                <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto; height: 263px">
                                <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView8_PageIndexChanging" PageSize="15" ID="GridView8" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table_dark" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="Record not found" AllowSorting="true" OnSorting="GridView8_Sorting">
                                   
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="100" SortExpression="owner_name">
                                            <ItemTemplate>
                                                <asp:Label ID="b_id" runat="server" Text='<%# Bind("owner_name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type" ItemStyle-Width="100" SortExpression="bed">
                                            <ItemTemplate>
                                                <asp:Label ID="w_id" runat="server" Text='<%# Bind("bed")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Unit" ItemStyle-Width="100" SortExpression="unit">
                                            <ItemTemplate>
                                                <asp:Label ID="unit" runat="server" Text='<%# Bind("unit")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email" ItemStyle-Width="100" SortExpression="o_name">
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="100" SortExpression="chqno">
                                            <ItemTemplate>
                                                <asp:Label ID="mobile_no" runat="server" Text='<%# Bind("pre_mob")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Due(Including GST)" ItemStyle-Width="100" SortExpression="due">
                                            <ItemTemplate>
                                                <asp:Label ID="due" runat="server" Text='<%# Bind("due")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select" ItemStyle-Width="100" SortExpression="chqno">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" /><a href="Defaulter.aspx"></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>



                <asp:RadioButton ID="RadioButton1" GroupName="abc"  runat ="server" Text="Email" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" Checked="true" />
                <asp:RadioButton ID="RadioButton2" GroupName="abc" runat="server" Text="SMS"  OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true"/>
               
                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-2">
                            <asp:Button ID="btn_send_email" runat="server" Text="Send Email" Class="btn btn-primary" OnClick="btn_send_email_Click" UseSubmitBehavior="False" />
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox CssClass="form-control" ID="txt_email" runat="server" Width="200px" placeholder="Enter Email" TextMode="MultiLine"></asp:TextBox>
                            <div class="invalid-feedback"> invalid </div>
                        </div>
                        <br />
                        <div class="col-sm-4">
                            <asp:Button ID="btn_send_sms" runat="server" Text="Send SMS" Class="btn btn-primary" OnClick="btn_send_sms_Click" Visible="false" UseSubmitBehavior="False" />
                        </div>
                        
                    </div>
                </div>
        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>