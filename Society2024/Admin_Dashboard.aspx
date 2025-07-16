<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Society2024.Admin_Dashboard" MasterPageFile="~/Site.Master" %>


<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.css" rel="stylesheet" />
    <!-- Flatpickr Date Range Picker -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.js"></script>

   
    <style>
        .filter-container { position: relative; }
        #filterSidebar {
            position: absolute; top: 40px; left: 0; width: 300px;
            background: #f8f9fa; box-shadow: 0 0 5px rgba(0,0,0,0.2);
            padding: 20px; border-radius: 4px; display: none; z-index: 10;
        }
        #filterSidebar.show { display: block; }
        .filter-chip {
            margin: 4px; padding: 4px 6px; font-size: 13px;
            background: #17a2b8; color: #fff; border-radius: 16px;
            display: inline-flex; align-items: center;
        }
        .filter-chip button {
            background: none; border: none; color: #fff;
            margin-left: 6px; cursor: pointer; font-weight: bold;
        }

        .resized-model{
        width: 529px;
    height: auto;
    right: 82px;
}

@media(max-width: 431px){
   .resized-model{
       height: auto;
    margin: auto;
    width: 233px;
    margin-top: 168px;
    right: 1px;
   }
}
    </style>
    <script type="text/javascript">
        function SuccessEntry() {
            Swal.fire(
                'SUCCESS!',
                'Quotation Entry Successfully Registered!',
                'success'
            )
        }
        function FailedEntry() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'You Missed Something Empty!',
            })
        }
    </script>

    <script type='text/javascript'>
        function openModal() {
            $('#edit_model').modal('show');
        }
    </script>

    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="box-body">


                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class=" font-weight-bold " style="color: #012970;">Admin Dashboard</h1>
                        </th>
                    </tr>
                </table>
                <br />

                <%--                <h4 style="color: Navy">Purchase Entry</h4>--%>
                <asp:HiddenField ID="maxPriceHidden" runat="server" />
                <asp:HiddenField ID="minPriceHidden" runat="server" />

                <asp:HiddenField ID="society_id" runat="server" />
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>

        <%--<div class="col-sm-1.5">
            <asp:Label Visible="false" ID="society_name" runat="server" Text="Society Name"></asp:Label>
        </div>
        <div class="col-sm-2">
            <asp:DropDownList Visible="false" ID="drp_society" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>--%>

        <div class="form-group">
            <div class="row">
                <div class="col-12">
                    <div class="d-flex align-items-center">
                     <!-- Filter Button -->
<button id="filterButton" type="button" style="margin-right: 8px; border-radius: 12px; border: 1px solid #ccc;">
    <img style="width: 28px; margin: 5px;" src="img/filter.svg" alt="Filter" />
</button>

<!-- Filter Sidebar -->
<div id="filterSidebar">
    <div class="d-flex justify-content-between align-items-center mb-2">
        <h6>Filter Options</h6>
        <button class="btn btn-sm btn-danger" onclick="document.getElementById('filterSidebar').classList.remove('show')">×</button>

    </div>

  <div class="row">
    <div class="col-6">
        <div class="form-group">
            <label>State</label>
            <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control" AutoPostBack="false"></asp:DropDownList>
        </div>
    </div>

    <div class="col-6">
        <div class="form-group">
            <label>District</label>
            <asp:DropDownList ID="ddl_district" runat="server" CssClass="form-control" AutoPostBack="false"></asp:DropDownList>
        </div>
    </div>

    <div class="col-6">
        <div class="form-group">
            <label>City</label>
            <asp:DropDownList ID="ddl_division" runat="server" CssClass="form-control" AutoPostBack="false"></asp:DropDownList>
        </div>
    </div>

    <div class="col-6">
        <div class="form-group">
            <label>Pin Code</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Pin Code" />
        </div>
    </div>
</div>




<!-- Pending Amount -->
<div class="form-group">
    <label>Pending Amount (₹)</label>
    <div id="pendingSlider"></div>
    <div id="pendingRangeDisplay">₹0 – ₹50000</div>
    <asp:HiddenField ID="minPendingHidden" runat="server" />
    <asp:HiddenField ID="maxPendingHidden" runat="server" />
</div>
      <!-- Date Filter -->
    <div class="form-group">
        <label>Date Range</label>
        <asp:TextBox ID="calendarRange" runat="server" CssClass="form-control" placeholder="Select date range" />
        <asp:HiddenField ID="dateFrom" runat="server" />
        <asp:HiddenField ID="dateTo" runat="server" />
    </div>



    <!-- Filter Buttons -->
    <asp:Button ID="btnResetFilters" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm mt-2" OnClientClick="resetFilters(); return false;" />
    <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filter" CssClass="btn btn-primary btn-sm mt-2" OnClick="btnApplyFilters_Click" />
</div>


                        <div class="search-container">
                            

                            <asp:TextBox ID="txt_search" runat="server"
                                CssClass="aspNetTextBox"
                                placeholder="Search here"
                                onkeypress="return triggerSearchOnEnter(event);" />



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

                    </div>
                </div>
            </div>
        </div>




        <asp:Panel ID="filterSection" runat="server" visible="false" CssClass="row mt-2">
        <div class="col-sm-2">
            <asp:Label ID="lbl_state" runat="server" Text="State"></asp:Label>
            <asp:DropDownList ID="drp_state" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_district" runat="server" Text="District"></asp:Label>
            <asp:DropDownList ID="drp_district" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
         <div class="col-sm-2">
            <asp:Label ID="lbl_division" runat="server" Text="Division"></asp:Label>
            <asp:DropDownList ID="drp_division" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_city" runat="server" Text="City"></asp:Label>
            <asp:DropDownList ID="drp_city" runat="server" Width="180px" Height="32px" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        
        <div class="col-sm-2">
            <asp:Label ID="lbl_pincode" runat="server" Text="Pin Code"></asp:Label>
            <asp:TextBox ID="txt_pincode" runat="server" Width="180px" Height="32px" placeHolder="Enter Pin Code"></asp:TextBox>
        </div>
    </asp:Panel>





                <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" EmptyDataText="No Record Found" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="lightblue" AllowSorting="true" OnSorting="GridView1_Sorting" OnRowUpdating="GridView1_RowUpdating">

                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Society Name" ItemStyle-Width="400" SortExpression="name">
                                            <ItemTemplate>
                                                <asp:Label ID="society_name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Address" ItemStyle-Width="400" SortExpression="address">
                                            <ItemTemplate>
                                                <asp:Label ID="address" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Flats" ItemStyle-Width="150" SortExpression="total_flats">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("total_flats")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Point of Contact" ItemStyle-Width="400" SortExpression="contact_no1">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact_no1")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email Address" ItemStyle-Width="150" SortExpression="email">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("email")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Charges Per Month" ItemStyle-Width="150" SortExpression="chargesPerMonth">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChargesPerMonth" runat="server" Text='<%# Bind("chargesPerMonth")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Amount" ItemStyle-Width="150" SortExpression="pending_amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingAmount" runat="server" Text='<%# Bind("pending_amount")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Month" ItemStyle-Width="150" SortExpression="month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingMonth" runat="server" Text='<%# Bind("month")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                   </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>

                </asp:UpdatePanel>

            </div>
            </div>
           
        </div>

  <!-- NoUiSlider CSS & JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.js"></script>

<script type="text/javascript">
  function initializeFilterUI() {
    console.log("Initializing filter UI...");

    const btn = document.getElementById("filterButton");
    const sidebar = document.getElementById("filterSidebar");
    const closeBtn = sidebar?.querySelector(".btn-danger");

    if (btn && sidebar) {
      btn.onclick = e => { e.stopPropagation(); sidebar.classList.toggle("show"); };
      closeBtn?.addEventListener("click", e => { e.stopPropagation(); sidebar.classList.remove("show"); });
      document.addEventListener("click", e => {
        if (!sidebar.contains(e.target) && !btn.contains(e.target)) sidebar.classList.remove("show");
      });
    }


      // Flatpickr
      flatpickr("#<%= calendarRange.ClientID %>", {
          mode: "range",
          dateFormat: "Y-m-d",
          onChange: function (selectedDates) {
              if (selectedDates.length === 2) {
                  document.getElementById("<%= dateFrom.ClientID %>").value = selectedDates[0].toISOString().split("T")[0];
                    document.getElementById("<%= dateTo.ClientID %>").value = selectedDates[1].toISOString().split("T")[0];
                }
            }
        });

    // Pending slider
    try {
      const s2 = document.getElementById("pendingSlider");
      if (s2 && !s2.noUiSlider) {
        noUiSlider.create(s2, {
          start: [0, 50000], connect: true,
          range: { min: 0, max: 50000 },
          step: 100, tooltips: true,
          format: { to: v => Math.round(v), from: v => +v }
        });
        s2.noUiSlider.on('update', vals => {
          document.getElementById("pendingRangeDisplay").textContent = `₹${vals[0]} – ₹${vals[1]}`;
          document.getElementById("<%= minPendingHidden.ClientID %>").value = vals[0];
          document.getElementById("<%= maxPendingHidden.ClientID %>").value = vals[1];
        });
      }
    } catch (e) { console.error("Pending slider error:", e); }
  }

  function resetFilters() {
    ["<%= txt_pincode.ClientID %>", "<%= drp_state.ClientID %>", "<%= drp_district.ClientID %>", "<%= drp_city.ClientID %>"]
      .forEach(id => {
        const el = document.getElementById(id);
        if (el) {
          if ('selectedIndex' in el) el.selectedIndex = 0;
          else el.value = '';
        }
      });

    const fs = document.getElementById("flatsSlider")?.noUiSlider;
    fs?.set([0, 500]);

    const ps = document.getElementById("pendingSlider")?.noUiSlider;
    ps?.set([0, 50000]);

    document.getElementById("filterSidebar")?.classList.remove("show");
  }

  function triggerSearchOnEnter(e) {
    if (e.key === "Enter") {
      e.preventDefault();
      __doPostBack('<%= btn_search.UniqueID %>', '');
            return false;
        }
        return true;
    }

    // Initialization after full load or UpdatePanel partial postback
    if (typeof Sys !== "undefined" && Sys.Application) {
        Sys.Application.add_load(initializeFilterUI);
    } else {
        window.addEventListener("load", initializeFilterUI);
    }
</script>

    </asp:Content>