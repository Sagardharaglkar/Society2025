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
                 <div class="form-group">
                <div class="row ">
                <div class="col-12">
                  <div class="d-flex align-items-center">




                    <asp:Label ID="Inv_post" runat="server" Text="Invoice Posted Before"></asp:Label>&nbsp;&nbsp;
                  
                      <asp:TextBox ID="date_before"  Height="32px" Textmode="Date" runat ="server"></asp:TextBox>&nbsp;&nbsp;
                   
                              <asp:DropDownList ID="drp_type" runat="server" Width="180px"  Height="32px"  Autopostback="true" >
                               </asp:DropDownList>&nbsp;&nbsp;
                           
                       <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                        <asp:TextBox ID="txt_search" style="text-transform: capitalize;"  Height="32px" placeHolder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                    
                      <asp:Button ID="btn_search" runat="server" Text="Search" Class="btn btn-primary" OnClick="btn_search_Click" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                      <asp:CheckBox ID="select_all" runat="server" OnCheckedChanged="select_all_CheckedChanged" AutoPostBack="true" Text="Select All" />
                      
                    </div>
                  </div>
                </div>
             </div>
                <div class="form-group">
                    <div class="row ">
                          
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto; height: 263px">
                                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table_dark" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="Record not found" AllowSorting="true" OnSorting="GridView8_Sorting">
                                   
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
                            <asp:TextBox ID="txt_email" runat="server" Width="200px" placeholder="Enter Email" TextMode="MultiLine"></asp:TextBox>
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
