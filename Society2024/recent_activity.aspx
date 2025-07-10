<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recent_activity.aspx.cs" Inherits="Society.recent_activity" MasterPageFile="~/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- External Libraries -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link href="https://cdn.jsdelivr.net/npm/nouislider@15.7.0/dist/nouislider.min.css" rel="stylesheet" />

    <style>
        .filter-container { position: relative; }
        #filterSidebar {
            position: absolute;
            top: 40px;
            left: 0;
            width: 280px;
            background-color: #f8f9fa;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
            z-index: 10;
            padding: 20px;
            display: none;
            border-radius: 4px;
        }
        #filterSidebar.show { display: block; }
        .filter-chip {
            margin: 4px;
            padding: 4px 6px;
            font-size: 13px;
            background-color: #17a2b8;
            color: white;
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
        }
        .filter-chip button {
            background: none;
            border: none;
            color: white;
            margin-left: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .search-button2 {
            margin-left: 5px;
            background-color: #007bff;
            border: none;
            color: white;
            padding: 6px 10px;
            border-radius: 4px;
        }
        #priceSlider { margin-top: 10px; }
        #priceRangeDisplay { font-size: 14px; margin-top: 4px; }
    </style>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">
                <h1 class="font-weight-bold" style="color: #012970;">Recent Activities</h1><br />

                <!-- Search and Filter -->
                <div class="form-group filter-container">
                    <div class="d-flex align-items-center">
                        <button id="filterButton" type="button" style="margin-right: 8px; border-radius: 12px; border: 1px solid #ccc;">
                            <img style="width: 28px; margin: 5px;" src="img/filter.svg" />
                        </button>
                        <asp:TextBox ID="txt_search" CssClass="aspNetTextBox" placeHolder="Search here" runat="server" TextMode="Search" AutoPostBack="true" />
                        <button id="btn_sea6rch" type="submit" class="search-button2" runat="server">
                            <span class="material-symbols-outlined">search</span>
                        </button>
                    </div>

                    <!-- Filter Panel -->
                    <div id="filterSidebar">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h6>Filter Options</h6>
                            <button class="btn btn-sm btn-danger" onclick="toggleFilterPanel()">×</button>
                        </div>

                        <!-- Calendar Filter -->
                        <div class="form-group">
                            <label>Date Range</label>
                            <input type="text" id="calendarRange" class="form-control" placeholder="Select date range" />
                            <input type="hidden" id="dateFrom" />
                            <input type="hidden" id="dateTo" />
                        </div>

                        <!-- Activity Type -->
                        <div class="form-group">
                            <label for="activityType">Activity Type</label>
                            <select class="form-control" id="activityType">
                                <option value="">All</option>
                                <option value="Maintenance">Maintenance</option>
                                <option value="Payment">Payment</option>
                            </select>
                        </div>

                        <!-- Price Range -->
                        <div class="form-group">
                            <label style="margin-bottom: 40px;">
                                Price Range</label>
                            <div id="priceSlider"></div>
                            <div id="priceRangeDisplay">₹0 – ₹5000</div>
                        </div>

                        <button type="button" class="btn btn-secondary btn-sm mt-2" onclick="resetFilters()">Reset</button>
                        <button type="button" class="btn btn-primary btn-sm mt-2" onclick="applyFilter()">Apply Filter</button>
                    </div>
                </div>

                <!-- Filter Chips -->
                <div id="filterChips" style="margin: 10px 0;"></div>

                <!-- GridView Display -->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped"
                    ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found" HeaderStyle-BackColor="lightblue">
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
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="name" runat="server" Text='<%# Bind("particular") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registration No" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="registration_no" runat="server" Text='<%# Bind("received_amt") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.0/dist/nouislider.min.js"></script>

    <script>
        // Toggle sidebar on click
        document.getElementById("filterButton").addEventListener("click", () => {
            document.getElementById("filterSidebar").classList.toggle("show");
        });

        function toggleFilterPanel() {
            document.getElementById("filterSidebar").classList.remove("show");
        }

        // Close on outside click
        document.addEventListener("click", function (event) {
            const sidebar = document.getElementById("filterSidebar");
            const button = document.getElementById("filterButton");
            const clickedInside = sidebar.contains(event.target) || button.contains(event.target);
            if (!clickedInside) {
                sidebar.classList.remove("show");
            }

        });

        // Date Picker
        flatpickr("#calendarRange", {
            mode: "range",
            dateFormat: "Y-m-d",
            onChange: function (selectedDates) {
                if (selectedDates.length === 2) {
                    document.getElementById("dateFrom").value = flatpickr.formatDate(selectedDates[0], "Y-m-d");
                    document.getElementById("dateTo").value = flatpickr.formatDate(selectedDates[1], "Y-m-d");
                }
            }
        });

        // Price Slider
        let minPrice = 0;
        let maxPrice = 5000;
        const priceSlider = document.getElementById("priceSlider");
        const priceDisplay = document.getElementById("priceRangeDisplay");

        noUiSlider.create(priceSlider, {
            start: [minPrice, maxPrice],
            connect: true,
            range: { min: 0, max: 5000 },
            step: 100,
            tooltips: [true, true],
            format: {
                to: value => Math.round(value),
                from: value => Number(value)
            }
        });

        priceSlider.noUiSlider.on('update', function (values) {
            minPrice = values[0];
            maxPrice = values[1];
            priceDisplay.textContent = `₹${minPrice} – ₹${maxPrice}`;
        });

        // Filter chips logic
        function applyFilter() {
            const fromDate = document.getElementById("dateFrom").value;
            const toDate = document.getElementById("dateTo").value;
            const type = document.getElementById("activityType").value;

            let chipsHTML = '';

            if (fromDate || toDate) {
                chipsHTML += `<span class="filter-chip" id="chip-date">📅 ${fromDate || '...'} – ${toDate || '...'} <button onclick="removeFilter('date')">×</button></span>`;
            }

            if (type) {
                chipsHTML += `<span class="filter-chip" id="chip-type">🛠️ Type: ${type} <button onclick="removeFilter('type')">×</button></span>`;
            }
            
            if (minPrice || maxPrice) {
                chipsHTML += `<span class="filter-chip" id="chip-price">💰 ₹${minPrice} – ₹${maxPrice} <button onclick="removeFilter('price')">×</button></span>`;
            }

            document.getElementById("filterChips").innerHTML = chipsHTML;
            toggleFilterPanel();

            // Trigger fetch/filter logic as needed
        }

        function resetFilters() {
            document.getElementById("dateFrom").value = '';
            document.getElementById("dateTo").value = '';
            document.getElementById("activityType").value = '';
            document.getElementById("calendarRange").value = '';
            priceSlider.noUiSlider.set([0, 5000]);
            document.getElementById("filterChips").innerHTML = '';
        }

        function removeFilter(type) {
            if (type === 'date') {
                document.getElementById("dateFrom").value = '';
                document.getElementById("dateTo").value = '';
                document.getElementById("calendarRange").value = '';
                document.getElementById("chip-date")?.remove();
            }
            if (type === 'type') {
                document.getElementById("activityType").value = '';
                document.getElementById("chip-type")?.remove();
            }
            if (type === 'price') {
                priceSlider.noUiSlider.set([0, 5000]);
                document.getElementById("chip-price")?.remove();
            }
        }
    </script>
</asp:Content>
