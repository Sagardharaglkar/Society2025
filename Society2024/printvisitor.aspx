<%@ Page Title="Contact" Language="C#" AutoEventWireup="true" CodeBehind="printvisitor.aspx.cs" Inherits="Society.printvisitor" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div style="padding: 15px">
                <asp:HiddenField ID="society_id" runat="server" />
                <asp:HiddenField ID="building_id" runat="server" />

                <h1 class=" tex0 font-weight-bold " style="color: #012970;">Visitor Reports
                </h1>
                <br />
                <div class="bg-white p-3">
                    <div class="form-group">
                        <div class="row ">
                            <div class="col-sm-2">
                                <asp:Label ID="Label7" runat="server" Text="Building Name"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                            </div>
                            <div class="col-sm-2">
                                <div class="dropdown-container">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                                        placeholder="Select" autocomplete="off" required="required" />
                                    <div id="RepeaterContainer1" class="suggestion-list">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="CategoryRepeater_ItemCommand">
                                            <ItemTemplate>
                                                <asp:LinkButton
                                                    ID="lnkCategory"
                                                    runat="server"
                                                    CssClass="suggestion-item link-button category-link"
                                                    Text='<%# Eval("build_name") %>'
                                                    CommandArgument='0'
                                                    CommandName="SelectCategory"
                                                    OnClientClick="setTextBox1(this.innerText);" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                                    Text="No items found." />
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="Label1" runat="server" Text="Type"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="*"></asp:Label>
                            </div>
                            <div class="col-sm-2">
                                <asp:DropDownList ID="ddl_type" runat="server" AutoPostBack="true" Width="150px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem Value="Cab">Cab </asp:ListItem>
                                    <asp:ListItem Value="Service">Home service</asp:ListItem>
                                    <asp:ListItem Value="Delivery">Delivery</asp:ListItem>
                                    <asp:ListItem Value="Guest">Guest & Others</asp:ListItem>

                                </asp:DropDownList>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row ">

                            <div class="col-sm-2">
                                <asp:Label ID="lbl_date" runat="server" Text="From Date"></asp:Label>
                                <asp:Label ID="lbl_date_sep" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                            </div>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_from" TextMode="Date" runat="server" SelectedDate="<%# DateTime.Today %>"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="Label12" runat="server" Text="To Date"></asp:Label>
                                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Medium" Text=":"></asp:Label>
                            </div>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_to" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <br />

                <div align="center">
                    <asp:Button ID="Button1" runat="server" Text="Load Report" OnClick="Button1_Click"
                        class="btn btn-primary" Font-Bold="True" />
                    <br />
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="69%"></rsweb:ReportViewer>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>




<script>
 
function initDropdownEvents() {
    const textBox1 = document.getElementById("<%= TextBox1.ClientID %>");
    const repeaterContainer1 = document.getElementById("RepeaterContainer1");
 
    textBox1.addEventListener("focus", function () {
        repeaterContainer1.style.display = "block";
    });
 
    textBox1.addEventListener("input", function () {
        const input = textBox1.value.toLowerCase();
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
 
function setTextBox1(value) {
    document.getElementById("<%= TextBox1.ClientID %>").value = value;
    document.getElementById("RepeaterContainer1").style.display = "none";
}
 
 
Sys.Application.add_load(initDropdownEvents);
 
 
</script>
</asp:Content>
