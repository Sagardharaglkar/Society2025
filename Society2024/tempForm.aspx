<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">



    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <!-- First Dropdown (Category Selection) -->
            <div class="dropdown-container">
                <asp:TextBox ID="categoryBox" runat="server" CssClass="input-box form-control"
                    placeholder="Select category (Animal or Bird)" autocomplete="off"/>
                <div id="categoryRepeaterContainer" class="suggestion-list">
                    <asp:Repeater ID="categoryRepeater" runat="server" OnItemCommand="CategoryRepeater_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="lnkCategory"
                                runat="server"
                                CssClass="suggestion-item link-button category-link"
                                Text='<%# Eval("flat_type") %>'
                                CommandArgument='<%# Eval("flat_type_id") %>'
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

            <!-- Second Dropdown (Items based on category) -->
            <div class="dropdown-container">
                <asp:TextBox ID="itemBox" runat="server" CssClass="input-box form-control" placeholder="Select item" autocomplete="off" />
                <div id="itemRepeaterContainer" class="suggestion-list">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="lnkCategory"
                                runat="server"
                                CssClass="suggestion-item link-button item-option"
                                Text='<%# Eval("flat_no") %>'
                                CommandArgument='<%# Eval("flat_id") %>'
                                CommandName="SelectCategory"
                                OnClientClick='setItemBox(this.innerText);' />
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
        //Sys.Application.add_load(initDropdownEvents);

        function initDropdownEvents() {
            const categoryBox = document.getElementById("<%= categoryBox.ClientID %>");
            const categorySuggestions = document.getElementById("categoryRepeaterContainer");

            const itemBox = document.getElementById("<%= itemBox.ClientID %>");
            const itemSuggestions = document.getElementById("itemRepeaterContainer");

            categoryBox.addEventListener("focus", function () {
                categorySuggestions.style.display = "block";
                itemSuggestions.style.display = "none";
            });

            categoryBox.addEventListener("input", function () {
                const input = categoryBox.value.toLowerCase();
                filterSuggestions("category-link", input);
            });

            itemBox.addEventListener("focus", function () {
                itemSuggestions.style.display = "block";
            });

            itemBox.addEventListener("input", function () {
                const input = itemBox.value.toLowerCase();
                filterSuggestions("item-option", input);
            });

            // Handle clicks outside dropdowns
            //document.addEventListener("click", function (e) {
            //    if (!categoryBox.contains(e.target) && !categorySuggestions.contains(e.target)) {
            //        categorySuggestions.style.display = "none";
            //    }
            //    if (!itemBox.contains(e.target) && !itemSuggestions.contains(e.target)) {
            //        itemSuggestions.style.display = "none";
            //    }
            //});
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

            document.getElementById("<%= itemBox.ClientID %>").value = "";

        }
        function setItemBox(value) {
            document.getElementById("<%= itemBox.ClientID %>").value = value;
            document.getElementById("itemRepeaterContainer").style.display = "none";
        }


        // Attach after partial postback
        Sys.Application.add_load(initDropdownEvents);
    </script>
</asp:Content>
