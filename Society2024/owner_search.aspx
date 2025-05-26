<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="owner_search.aspx.cs" Inherits="Society.owner_search" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="True" %>


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
                   window.location.href = 'owner_search.aspx';
               }
           });
       }
   </script>
    <script type="text/javascript">
        
        function openModal() {
            $('#edit_model').modal('show');
        }
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
                           <th width="100%" class="">
                               <h1 class=" tex0 font-weight-bold " style="color: #012970;">Flat Owners 
                               </h1>
                           </th>
                       </tr>
                   </table>
                <asp:HiddenField ID="owner_id" runat="server" />
                <asp:HiddenField ID="o_ex_id" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
                <asp:HiddenField ID="flat_id" runat="server" />
                  <asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>
                <div class="form-group">
                    <div class="row ">
                        <div class="col-12">
                           <div class="d-flex align-items-center">
                       
                            <asp:DropDownList ID="search_field" runat="server" Width="200px" Height="32px">
                                <asp:ListItem Value="name">Name</asp:ListItem>
                                <asp:ListItem Value="flat_no">Flat No</asp:ListItem>
                                <asp:ListItem Value="build_name">Building</asp:ListItem>
                                <asp:ListItem Value="w_name">Wing</asp:ListItem>
                               <%-- <asp:ListItem Value="usage">Flat Type</asp:ListItem>--%>
                            </asp:DropDownList>&nbsp;&nbsp;
                       
                               <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btn_search" CssClass="d-flex align-items-center me-2">
                            <asp:TextBox ID="txt_search" Font-Bold="true" Style="text-transform: capitalize;" Width="200px" Height="32px" placeholder="Search here" runat="server"></asp:TextBox>&nbsp;&nbsp;
                       
                            <asp:Button ID="btn_search" runat="server" class="btn btn-primary" OnClick="btn_search_Click" Text="Search" UseSubmitBehavior="False" /></asp:Panel>&nbsp;&nbsp;
                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_model">New Entry</button>
                      </div>
                   </div> 
                </div>
             </div>
                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="OwnerGrid" runat="server" AllowPaging="true" PageSize="50" OnPageIndexChanging="OwnerGrid_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" AllowSorting="true" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" OnRowUpdating="OwnerGrid_RowUpdating" OnSorting="OwnerGrid_Sorting" OnRowDeleting="OwnerGrid_RowDeleting" >
                                    <%--                                            <asp:GridView ID="grid_cust" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped table-dark">--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="owner_id" SortExpression="owner_id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="owner_id" Text='<%# Bind("owner_id")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name" Visible="true" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="name" Text='<%# Bind("name")%>'></asp:Label>
                                                <%-- <asp:Label ID="addr" runat="server" Text='<%# Bind("flat_type")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Building" Visible="true" SortExpression="build_name">
                                            <ItemTemplate>
                                                <asp:Label ID="addr2" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Flat No" Visible="true" SortExpression="flat_no">
                                            <ItemTemplate>
                                                <asp:Label ID="addr1" runat="server" Text='<%# Bind("flat_no")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Wing" Visible="true" SortExpression="w_name">
                                            <ItemTemplate>
                                                <asp:Label ID="addr" runat="server" Text='<%# Bind("w_name")%>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Flat Type" Visible="true" SortExpression="usage">
                                            <ItemTemplate>
                                                <asp:Label ID="addr11" runat="server" Text='<%# Bind("usage")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="edit" OnCommand="edit_Command" CommandName="Update" CommandArgument='<%# Bind("owner_id")%>'><img src="Images/123.png"/></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="50">
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
        </ContentTemplate></asp:UpdatePanel>
                <div class="modal fade bs-example-modal-sm" id="edit_model" role="form" aria-labelledby="myLargeModalLabel" data-backdrop="static">
                    <div class="modal-dialog modal-sm-4" style="right: 80px">

                        <div class="modal-content" style="height: auto; width: 900px;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="gridSystemModalLabel"><strong>Owner Details</strong></h4>
                            </div>
                            <%-- <directedgraph xmlns="http://schemas.microsoft.com/vs/2009/dgml">
                            <nodes>
                                <node id="(@1 Namespace=Society Type=owner_search Member=txt_owner_rel)" category="CodeSchema_Field" codeschemaproperty_isprotected="True" commonlabel="txt_owner_rel" icon="Microsoft.VisualStudio.Field.Protected" isdragsource="True" label="txt_owner_rel : TextBox" sourcelocation="(Assembly=file:///C:/Users/Admin/Desktop/Society_5_jan/Society/owner_search.aspx.designer.cs StartLineNumber=797 StartCharacterOffset=60 EndLineNumber=797 EndCharacterOffset=73)">
                                </node>
                                <node id="(@1 Namespace=Society Type=owner_search)" visibility="Hidden">
                                </node>
                            </nodes>
                            <links>
                                <link category="Contains" source="(@1 Namespace=Society Type=owner_search)" target="(@1 Namespace=Society Type=owner_search Member=txt_owner_rel)">
                                </link>
                            </links>
                            <categories>
                                <category id="CodeSchema_Field" basedon="CodeSchema_Member" icon="CodeSchema_Field" label="Field">
                                </category>
                                <category id="CodeSchema_Member" icon="CodeSchema_Field" label="Member">
                                </category>
                                <category id="Contains" description="Whether the source of the link contains the target object" iscontainment="True" label="Contains">
                                </category>
                            </categories>
                            <properties>
                                <property id="CodeSchemaProperty_IsProtected" datatype="System.Boolean" description="Flag to indicate the scope is Protected" label="Is Protected">
                                </property>
                                <property id="CommonLabel" datatype="System.String">
                                </property>
                                <property id="Icon" datatype="System.String" label="Icon">
                                </property>
                                <property id="IsContainment" datatype="System.Boolean">
                                </property>
                                <property id="IsDragSource" datatype="System.Boolean" description="IsDragSource" label="IsDragSource">
                                </property>
                                <property id="Label" datatype="System.String" description="Displayable label of an Annotatable object" label="Label">
                                </property>
                                <property id="SourceLocation" datatype="Microsoft.VisualStudio.GraphModel.CodeSchema.SourceLocation" label="Start Line Number">
                                </property>
                                <property id="Visibility" datatype="System.Windows.Visibility" description="Defines whether a node in the graph is visible or not" label="Visibility">
                                </property>
                            </properties>
                            <qualifiednames>
                                <name id="Assembly" label="Assembly" valuetype="Uri">
                                </name>
                                <name id="Member" label="Member" valuetype="System.Object">
                                </name>
                                <name id="Namespace" label="Namespace" valuetype="System.String">
                                </name>
                                <name id="Type" label="Type" valuetype="System.Object">
                                </name>
                            </qualifiednames>
                            <identifieraliases>
                                <alias n="1" uri="Assembly=$(4d31b533-4e00-48b4-850b-26ecebdeeafe.OutputPathUri)">
                                </alias>
                            </identifieraliases>
                            <paths>
                                <path id="4d31b533-4e00-48b4-850b-26ecebdeeafe.OutputPathUri" value="file:///C:/Users/Admin/Desktop/Society_5_jan/Society/bin/Society.dll">
                                </path>
                            </paths>
                        </directedgraph>--%>
                            <div class="modal-body" id="invoice_data">
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_acc_no" runat="server" Text="  Build & Wing :"></asp:Label>
                                                    <asp:Label ID="lbl_acc_no_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_build_wing" Height="32px" Width="200px" runat="server" parsely-trigger="change"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_build_wing" ID="CompareValidator3" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Build & Wing" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_date" runat="server" Text="Poss Date :"></asp:Label>

                                                    <asp:Label ID="lbl_date_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_poss_date" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                    <%--                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" TargetControlID="txt_poss_date" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label5" runat="server" Text="Type"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <%--                      <asp:TextBox ID="txt_build_name" runat="server"  placeholder="Enter Building No" AutoPostBack="true" required></asp:TextBox>--%>
                                                    <asp:DropDownList ID="ddl_type" Height="32px" Width="200px" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged" parsely-trigger="change" AutoPostBack="true" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_type" ID="CompareValidator1" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Type" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </div>


                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label8" runat="server" Text="Flat No"></asp:Label>
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="ddl_flat" Height="32px" Width="200px" parsely-trigger="change" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="ddl_flat" ID="CompareValidator2" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Flat No" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />

                                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                    <asp:TextBox ID="txt_flat" runat="server" Height="32px" Width="200px" Visible="false"></asp:TextBox>


                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                                                    <asp:Label ID="lbl_name_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_name_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_name" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Name" required></asp:TextBox>
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_mob" runat="server" Text="E-mail ID"></asp:Label>
                                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text=":"></asp:Label>
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_email" Height="32px" Width="200px" placeholder="Enter Email" required runat="server"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="regexEmailValid" Height="32px" Width="200px" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Font-Bold="True" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>

                                                </div>


                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_pre_mob" runat="server" Text="Mobile No."></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="lbl_pre_mob_mandatory" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_pre_mob" runat="server" MaxLength="10" Height="32px" onkeypress="return digit(event);" onblur="checkLength(this)" Width="200px" placeholder="Enter Mobile No." OnTextChanged="txt_pre_mob_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                    <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_add_mob" runat="server" Text="Alternate Mobile No."></asp:Label>
                                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_add_mob" Height="32px" Width="200px" runat="server" MaxLength="10" onkeypress="return digit(event);" onblur="checkLength(this)" placeholder="Enter Alternate Mobile No."></asp:TextBox>

                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row ">

                                                <div class="col-sm-3">
                                                    <asp:Label ID="lbl_married" runat="server" Text="Married"></asp:Label>
                                                    <asp:Label ID="lbl_married_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:DropDownList ID="drp_married" Height="32px" parsely-trigger="change" Width="200px" runat="server"></asp:DropDownList>
                                                    <br />
                                                    <asp:CompareValidator ControlToValidate="drp_married" ID="CompareValidator4" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select Married Status" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                                </div>

                                                <div class="col-sm-3">
                                                    <asp:Label ID="Label27" runat="server" Text="DOB"></asp:Label>
                                                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                                </div>
                                                <div class="col-sm-3">
                                                    <asp:TextBox ID="txt_dob" runat="server" Height="32px" Width="200px" TextMode="Date" required></asp:TextBox>
                                                    <%--                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_dob" Format="dd/MM/yyyy"></asp:CalendarExtender>--%>
                                                </div>
                                            </div>
                                        </div>


                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                






                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <asp:Label ID="Label3" runat="server" Text="ID Proof"></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:DropDownList ID="ddl_doc_type" Height="32px" Width="200px" runat="server" parsely-trigger="change" >
                                               
                                               
                                            </asp:DropDownList>
                                            <br />
                                            <asp:CompareValidator ControlToValidate="ddl_doc_type" ID="CompareValidator5" ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please Select ID Proof" Font-Bold="true" ForeColor="Red" runat="server" Display="Dynamic" Operator="NotEqual" ValueToCompare="select" Type="String" />
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:FileUpload ID="FileUpload2" runat="server" />
                                        </div>

                                        <div class="col-sm-2">
                                            <asp:Button ID="btnotice_id_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btnotice_id_upload_Click" UseSubmitBehavior="False" />
                                            <asp:Label ID="listofuploadedfiles1" runat="server" />
                                            <asp:Label ID="uploadidproof" runat="server" Visible="false" />
                                       </div>
                                      </div>


                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <asp:Label ID="Label1" runat="server" Text="Photo Proof"></asp:Label>
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                             <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,jpeg" /> <br /><br />
                                             <asp:Button ID="btn_photo_upload" runat="server" Text="Upload" Class="btn btn-primary" OnClick="btn_photo_upload_Click" UseSubmitBehavior="False" />
                                       
                                            <asp:Label ID="listofuploadedfiles" runat="server" />
                                            <asp:Label ID="uploadphotopath" runat="server" Visible="false" />
                                        </div>
                                    </div>
                                </div>
                                <hr />


                                <div class="box-header">
                                    <div class="row ">
                                        <div class="col-sm-12">
                                            <h3 class="box-title"><b>Occupation Details</b></h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_occup" runat="server" Text="Occupation"></asp:Label>
                                            <asp:Label ID="lbl_occup_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_occup" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Occupation"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_mon_inc" runat="server" Text="Monthly Income"></asp:Label>
                                            <asp:Label ID="lbl_mon_inc_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_monthly_income" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Monthly Income"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row ">

                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_off_addr1" runat="server" Text="Office Address"></asp:Label>
                                            <asp:Label ID="lbl_off_addr1_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_off_addr1" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="250" placeholder="Enter Office Address"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_off_tel" runat="server" Text="Office Tel."></asp:Label>
                                            <asp:Label ID="lbl_off_tel_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_off_tel" runat="server" Height="32px" Width="200px" MaxLength="10" onkeypress="return digit(event);" placeholder="Enter Office Tel."></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_off_tel" ErrorMessage="Numbers Only" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+" Display="Dynamic" ValidationGroup="g1"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                </div>
                                <hr />



                                <div class="box-header">
                                    <div class="row ">
                                        <div class="col-sm-12">
                                            <h3 class="box-title"><b>Family Members Name</b></h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_tof_acc" runat="server" Text="Family Member"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_fam_mem_name" Style="text-transform: capitalize;" runat="server" Height="32px" Width="200px" placeholder="Enter family member"></asp:TextBox>
                                            <asp:Label ID="Label17" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_bank_acc" runat="server" Text="Relation"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_owner_rel" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Relation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_bank" runat="server" Text="Occupaation"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_f_occu" runat="server" Style="text-transform: capitalize;" Height="32px" Width="200px" MaxLength="50" placeholder="Enter Occupation"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:Label ID="lbl_bank_addr1" runat="server" Text="DOB"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="txt_f_dob" runat="server" MaxLength="50" Height="32px" Width="200px" placeholder="Enter Dob" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <center>
                                            <asp:Button ID="add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_add_Click" />
                                        </center>
                                    </div>
                                </div>

                                <hr />
                                <div class="form-group">
                                    <div class="row ">
                                        <div class="col-sm-12">
                                            <asp:GridView ID="FamilyGrid" runat="server" Width="100%" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="false" OnRowUpdating="FamilyGrid_RowUpdating" OnRowDeleting="FamilyGrid_RowDeleting" OnSorting="FamilyGrid_Sorting" AllowSorting="True" HeaderStyle-BackColor="lightblue" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="detail_id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="o_ex_id" runat="server" Text='<%# Bind("o_ex_id")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="owner_id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="owner_id" runat="server" Text='<%# Bind("owner_id")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name" SortExpression="f_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="f_name" runat="server" Text='<%# Bind("f_name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Relation" SortExpression="relation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="relation" runat="server" Text='<%# Bind("relation")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Occupation" SortExpression="f_occu">
                                                        <ItemTemplate>
                                                            <asp:Label ID="f_occu" runat="server" Text='<%# Bind("f_occu")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DOB" SortExpression="f_dob">
                                                        <ItemTemplate>
                                                            <asp:Label ID="f_dob" runat="server" Text='<%# Bind("f_dob", "{0:dd-MM-yyyy}")%>'></asp:Label>
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

                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="row">
                                            <center>
                                                <asp:Button ID="btn_save" type="button-submit" runat="server" Text="Save" OnClick="btn_save_Click1" ValidationGroup="g1" class="btn btn-primary" />
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
