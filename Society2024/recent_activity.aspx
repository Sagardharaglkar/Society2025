<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recent_activity.aspx.cs" Inherits="Society.recent_activity" MasterPageFile="~/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .filter-container {
            position: relative;
        }

        #filterSidebar {
            position: absolute;
            top: 40px;
            left: 0;
            width: 260px;
            background-color: #f8f9fa;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
            z-index: 10;
            padding: 20px;
            display: none;
            border-radius: 4px;
        }

        #filterSidebar.show {
            display: block;
        }

        .filter-chip {
            margin: 5px;
            display: inline-flex;
            align-items: center;
            padding: 6px 8px;
            background-color: #17a2b8;
            color: #fff;
            border-radius: 20px;
        }

        .filter-chip button {
            background: none;
            border: none;
            color: white;
            padding: 6px 10px;
            margin-left: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .search-container {
            display: flex;
            align-items: center;
        }

        .search-button2 {
            margin-left: 5px;
            background-color: #007bff;
            border: none;
            color: white;
            padding: 6px 10px;
            border-radius: 4px;
        }

        .calendar-icon {
            height: 30px;
            margin-left: 5px;
        }

        .input-buttons {
            display: inline-flex;
            align-items: center;
        }
    </style>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <h1 class="font-weight-bold" style="color: #012970;">Recent Activities</h1>
                <br />

                <!-- Search & Filter -->
                <div class="form-group filter-container">
                    <div class="d-flex align-items-center">
                        <!-- Filter Icon Button -->
                        <button type="button" style="margin-right: 8px; padding: 0; border-radius: 12px; border: 1px solid #ccc;"
                            onclick="toggleFilterPanel()" title="Filter Activities" style="margin-right: 8px;">
                            <img style="width: 28px; margin: 5px;"
                                src="img/filter.svg" />
                        </button>

                        <!-- Search Bar -->
                        <div class="search-container">
                            <asp:TextBox ID="txt_search" CssClass="aspNetTextBox" placeHolder="Search here" runat="server" TextMode="Search" AutoPostBack="true" />
                            <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_search" PopupButtonID="btn_calendar" Format="yyyy-MM-dd" />
                            <div class="input-buttons">
                                <img id="btn_calendar" src="img/calendar.png" alt="Pick Date" class="calendar-icon" style="cursor: pointer;" />
                                <button id="btn_sea6rch" type="submit" class="search-button2" runat="server">
                                    <span class="material-symbols-outlined">search</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Inline Slide-in Filter Panel -->
                    <div id="filterSidebar">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h6>Filter Options</h6>
                            <button class="btn btn-sm btn-danger" onclick="toggleFilterPanel()">×</button>
                        </div>

                        <div class="form-group">
                            <label for="dateFrom">From Date</label>
                            <input type="date" class="form-control" id="dateFrom" />
                        </div>
                        <div class="form-group">
                            <label for="dateTo">To Date</label>
                            <input type="date" class="form-control" id="dateTo" />
                        </div>
                        <div class="form-group">
                            <label for="activityType">Activity Type</label>
                            <select class="form-control" id="activityType">
                                <option value="">All</option>
                                <option value="Maintenance">Maintenance</option>
                                <option value="Payment">Payment</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="priceRange">Max Price: ₹<span id="priceVal">5000</span></label>
                            <input type="range" id="priceRange" min="0" max="5000" value="5000" class="form-control-range" oninput="updatePriceValue()" />
                        </div>

                        <button type="button" class="btn btn-secondary btn-sm mt-2" onclick="resetFilters()">Reset</button>
                        <button type="button" class="btn btn-primary btn-sm mt-2" onclick="applyFilter()">Apply Filter</button>
                    </div>
                </div>

                <!-- Filter Chips -->
                <div id="filterChips" style="margin: 10px 0;"></div>

                <!-- Data Grid -->
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue">
                        <Columns>
                            <asp:TemplateField HeaderText="No" ItemStyle-Width="30">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="s_id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="s_id" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" ItemStyle-Width="150" SortExpression="name">
                                <ItemTemplate>
                                    <asp:Label ID="name" runat="server" Text='<%# Bind("particular") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Registration No" ItemStyle-Width="150" SortExpression="registration_no">
                                <ItemTemplate>
                                    <asp:Label ID="registration_no" runat="server" Text='<%# Bind("received_amt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleFilterPanel() {
            const sidebar = document.getElementById("filterSidebar");
            sidebar.classList.toggle("show");
        }

        function updatePriceValue() {
            document.getElementById("priceVal").innerText = document.getElementById("priceRange").value;
        }

        function applyFilter() {
            const fromDate = document.getElementById("dateFrom").value;
            const toDate = document.getElementById("dateTo").value;
            const type = document.getElementById("activityType").value;
            const price = document.getElementById("priceRange").value;

            let chipsHTML = '';

            if (fromDate || toDate) {
                chipsHTML += `<span class="filter-chip" id="chip-date">Date: ${fromDate || '...'} – ${toDate || '...'} <button onclick="removeFilter('date')">×</button></span>`;
            }

            if (type) {
                chipsHTML += `<span class="filter-chip" id="chip-type">Type: ${type} <button onclick="removeFilter('type')">×</button></span>`;
            }

            if (price < 5000) {
                chipsHTML += `<span class="filter-chip" id="chip-price">Price ≤ ₹${price} <button onclick="removeFilter('price')">×</button></span>`;
            }

            document.getElementById("filterChips").innerHTML = chipsHTML;
            toggleFilterPanel();
        }

        function resetFilters() {
            document.getElementById("dateFrom").value = '';
            document.getElementById("dateTo").value = '';
            document.getElementById("activityType").value = '';
            document.getElementById("priceRange").value = 5000;
            updatePriceValue();
            document.getElementById("filterChips").innerHTML = '';
        }

        function removeFilter(type) {
            if (type === 'date') {
                document.getElementById("dateFrom").value = '';
                document.getElementById("dateTo").value = '';
                document.getElementById("chip-date")?.remove();
            }
            if (type === 'type') {
                document.getElementById("activityType").value = '';
                document.getElementById("chip-type")?.remove();
            }
            if (type === 'price') {
                document.getElementById("priceRange").value = 5000;
                updatePriceValue();
                document.getElementById("chip-price")?.remove();
            }
        }
    </script>
</asp:Content>
