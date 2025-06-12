<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
                           
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                                       
            <!-- First Dropdown (Category Selection) -->
            <div class="dropdown-container">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box form-control"
                    placeholder="Select category (Animal or Bird)" autocomplete="off"/>
                <div id="RepeaterContainer1" class="suggestion-list">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="CategoryRepeater_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="lnkCategory"
                                runat="server"
                                CssClass="suggestion-item link-button category-link"
                                Text='<%# Eval("flat_type") %>'
                                CommandArgument='<%# Eval("flat_type_id") %>'
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

            <!-- Second Dropdown (Items based on category) -->
            <div class="dropdown-container">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box form-control" placeholder="Select item" autocomplete="off" />
                <div id="RepeaterContainer2" class="suggestion-list">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="lnkCategory"
                                runat="server"
                                CssClass="suggestion-item link-button item-option"
                                Text='<%# Eval("flat_no") %>'
                                CommandArgument='<%# Eval("flat_id") %>'
                                CommandName="SelectCategory"
                                 />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Literal ID="litNoItem" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'
                                Text="No items found." />
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        function initDropdownEvents() {
            const textBox1 = document.getElementById("<%= TextBox1.ClientID %>");
            const repeaterContainer1 = document.getElementById("RepeaterContainer1");

            const textBox2 = document.getElementById("<%= TextBox2.ClientID %>");
            const repeaterContainer2 = document.getElementById("RepeaterContainer2");

            textBox1.addEventListener("focus", function () {
                repeaterContainer1.style.display = "block";
                repeaterContainer2.style.display = "none";
            });

            textBox1.addEventListener("input", function () {
                const input = textBox1.value.toLowerCase();
                filterSuggestions("category-link", input);
            });

            textBox2.addEventListener("focus", function () {
                repeaterContainer2.style.display = "block";
            });

            textBox2.addEventListener("input", function () {
                const input = textBox2.value.toLowerCase();
                filterSuggestions("item-option", input);
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
            document.getElementById("<%= TextBox2.ClientID %>").value = "";
        }

        function setTextBox2(value) {
            document.getElementById("<%= TextBox2.ClientID %>").value = value;
            document.getElementById("RepeaterContainer2").style.display = "none";
        }

        Sys.Application.add_load(initDropdownEvents);
    </script>

</asp:Content>
