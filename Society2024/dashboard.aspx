<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Society.dashboard" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/layout.css" rel="stylesheet" />

    <style>
        body {
            background: #EBF0F9;
        }

        .helpdesk-card {
            background-color: #ecf0f1;
            padding: 30px 20px;
            border-radius: 10px;
            width: 45%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .helpdesk-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            }

        .helpdesk-card-title {
            font-size: 18px;
            color: #34495e;
            margin-bottom: 15px;
        }

        .helpdesk-card-number {
            font-size: 28px;
            font-weight: bold;
            color: #2c3e50;
        }

        .helpdesk-cards {
            display: flex;
            justify-content: space-around;
            gap: 20px;
        }

        .hov {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .hov:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            }

        .expense-heading {
            font-family: 'Microsoft Sans Serif', sans-serif;
            font-size: 18pt;
            color: black; /* Change if needed */
            text-align: Center;
            margin-left: 10px; /* Adjust spacing */
        }

        .income-heading {
            font-family: 'Microsoft Sans Serif', sans-serif;
            font-size: 18pt;
            color: black; /* Change if needed */
            text-align: Center;
            margin-left: 10px; /* Adjust spacing */
        }

        .dropdown-divider {
            margin: 6px -1px;
            height: 1px;
            background: radial-gradient(black, transparent);
            /* margin: var(--bs-dropdown-divider-margin-y) 0; */
            overflow: hidden;
            border-top: 1px solid var(--bs-dropdown-divider-bg);
            opacity: 1;
        }

        .box-table {
            border-radius: 16px;
            padding: 18px;
            box-shadowQ: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            margin-bottom: 38px;
            background: white;
        }

        .table-heading {
            text-decoration: underline;
        }

        .btn-custom {
            margin-top: 30px;
            width: 106%;
            padding: 12px;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        .custom-table {
            width: fit-content;
            background: white;
            border-collapse: collapse;
            font-family: 'Segoe UI', sans-serif;
            /*      box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;*/ */
        }

            .custom-table th {
                padding: 7px 25px;
                border: hidden;
            }

            .custom-table td {
                padding: 12px 16px;
                border: hidden;
            }

        .link-style {
            color: black;
            text-decoration: none;
        }

            .link-style:hover {
                text-decoration: underline;
            }

        .update-card {
            overflow: auto;
            width: 100%;
            padding: 10px 13px;
            height: 225px;
            overflow-x: hidden;
        }

        .update-grid {
            margin-bottom: 5px;
            padding: 7px;
            width: 100%;
            border-radius: 16px;
            border: 2px solid #d6d6d6;
        }

        .inner-div {
            width: 100%;
            justify-content: space-between;
            display: flex;
        }

        .notify-div {
            width: 245px;
            height: 25px;
            word-wrap: break-word;
            overflow: hidden;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>



    <%--  <h4 style="color: Navy">Purchase Entry</h4>--%>





    <div class="layout-container mb-5">
        <!-- LEFT COLUMN -->
        <div class="layout-left">
            <!-- Top row: three small boxes -->

            <div class="layout-top-row layout-small">
                <div class="border-left-primary card layout-small hov card-body">
                    <a href="Defaulter.aspx" style="text-decoration: none;">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3
                                class="card-heading text-xs font-weight-bold  text-primary text-uppercase">Due
                            </h3>

                        </div>
                        <div class="dropdown-divider"></div>

                        <asp:UpdatePanel runat="server" ID="updatePanelDue" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:HiddenField ID="society_id" runat="server" />
                                <asp:HiddenField ID="notice_id" runat="server" />
                                <asp:HiddenField ID="HiddenField4" runat="server" />

                                <div
                                    class="d-flex justify-content-between align-items-center">
                                    <img src="img/cash.png" width="76px" />
                                    <asp:Label runat="server" ID="lblDue" class="h1 mb-0 font-weight-bold text-gray-800">
                   
                                    </asp:Label>

                                </div>

                            </ContentTemplate>

                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="due_this_month" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="due_last_month" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="due_this_year" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </a>
                </div>
                <div class="border-left-warning card layout-small layout-ed hov card-body">
                    <a href="Defaulter.aspx" style="text-decoration: none;">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3
                                class="card-heading text-xs font-weight-bold  text-warning text-uppercase">Defaulter
                            </h3>

                        </div>
                        <div class="dropdown-divider"></div>


                        <div
                            class="d-flex justify-content-between align-items-center">
                            <img src="img/defaulters.png" width="76px" />
                            <div>

                                <asp:Label runat="server" ID="defaulter" class="h1 mb-0 font-weight-bold text-gray-800">
                   
                                </asp:Label>

                            </div>
                        </div>
                    </a>
                </div>
                <div class="border-left-info card layout-small layout-ed hov card-body">
                    <a href="owner_search.aspx" style="text-decoration: none;">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3
                                class="card-heading text-xs font-weight-bold  text-info text-uppercase">Members
                            </h3>

                        </div>
                        <div class="dropdown-divider"></div>


                        <div
                            class="d-flex justify-content-between align-items-center">
                            <img src="img/friends.png" width="76px" />
                            <asp:Label runat="server" ID="residents" class="h1 mb-0 font-weight-bold text-gray-800">
                   
                            </asp:Label>

                        </div>
                    </a>
                </div>
            </div>
            <!-- Two big boxes -->

            <div class="layout-box layout-big layout-green card" id="chartContainer">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Expence Tracker</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <asp:Panel runat="server" ID="lblNoDataFound2" Visible="False">
                    <img src="img/noDataFound2.jpg" style="margin-left: 122px; width: 445px;" />
                </asp:Panel>
                <%--         <asp:UpdateProgress ID="ChartUpdateProgress" runat="server" AssociatedUpdatePanelID="chartUpdatePanal">
                            <ProgressTemplate>
                                <div style="position: absolute; left: 50%; top: 50%; z-index: 9999;">
                                    <img src="img/loading.gif" alt="Loading..." />
                                    <span>Loading chart...</span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>--%>


                <%--<asp:Button ID="btnChartAsyncLoad" runat="server" Style="display:none;" OnClick="btnChartAsyncLoad_Click" />--%>


                <asp:Chart ID="Chart2" runat="server" CssClass="widthSet" Height="316px" Width="600px" ValidateRequestMode="Inherit">

                    <Series>
                        <asp:Series Name="Expense" XValueMember="expense_month" YValueMembers="expense"
                            IsVisibleInLegend="true"
                            IsValueShownAsLabel="False"
                            YValuesPerPoint="1"
                            ToolTip="Expence: #VALY" ChartType="Spline" YValueType="Auto" LabelBorderWidth="10" Palette="None" BorderWidth="7" BorderDashStyle="Solid">
                        </asp:Series>
                        <asp:Series Name="Due" XValueMember="expense_month" YValueMembers="Due"
                            IsVisibleInLegend="true"
                            IsValueShownAsLabel="False"
                            YValuesPerPoint="1"
                            ToolTip="Due: #VALY" ChartType="Spline" BorderWidth="7">
                        </asp:Series>
                        <asp:Series Name="Collection" XValueMember="expense_month" YValueMembers="Collection"
                            IsVisibleInLegend="true"
                            IsValueShownAsLabel="False"
                            YValuesPerPoint="1"
                            ToolTip="Collection: #VALY" ChartType="Spline" BorderWidth="7">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="True" AlignmentStyle="PlotPosition">
                            <AxisX LineColor="Gray" IsMarginVisible="False">
                                <MajorGrid LineColor="white" />
                            </AxisX>
                            <AxisY LineColor="gray">
                                <MajorGrid LineColor="white" />
                            </AxisY>
                            <Area3DStyle Enable3D="false" LightStyle="Realistic"></Area3DStyle>
                        </asp:ChartArea>
                    </ChartAreas>

                    <Legends>
                        <asp:Legend>
                        </asp:Legend>
                    </Legends>
                </asp:Chart>

            </div>

            <div class="layout-box layout-big layout-blue card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">PDC Clearing</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <div class=" custom-table form-group ">

                    <div class="row ">
                        <div class="col-sm-12">

                            <div style="width: 100%; overflow: auto;">
                                <asp:Panel ID="lblNoDataFound3" runat="server">
                                    <img style="margin-top: 3px; margin-left: 203px; width: 426px;"
                                        src="img/noDataFound3.jpg" />
                                </asp:Panel>
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging"
                                            PageSize="3" ID="GridView1" runat="server" AutoGenerateColumns="false"
                                            CssClass="" AllowSorting="true" OnSorting="GridView1_Sorting" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="5" HeaderStyle-ForeColor="#224ABE">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Building" ItemStyle-Width="100" SortExpression="build_name">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="b_id" runat="server" Text='<%# Bind("build_name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit" ItemStyle-Width="100" SortExpression="unit">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="w_id" runat="server" Text='<%# Bind("unit")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Pdc Remainder" ItemStyle-Width="100" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="pdc_rem_id" runat="server" Text='<%# Bind("pdc_rem_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Owner" ItemStyle-Width="100" SortExpression="name">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="o_name" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Chq No." ItemStyle-Width="120" SortExpression="chqno">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="chqno" runat="server" Text='<%# Bind("chqno")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="100" SortExpression="che_amount">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="che_amount" runat="server" Text='<%# Bind("che_amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Chq Date" ItemStyle-Width="120" SortExpression="che_date">
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="link-style" ID="che_date" runat="server" Text='<%# Bind("che_date", "{0:yyyy-MM-dd}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--     <asp:CommandField ShowDeleteButton="false" ControlStyle-ForeColor="blue" />--%>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN -->

        <div class="layout-right">

            <div class="card layout-box layout-tall layout-purple">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Weekly Updates</h6>

                </div>
                <div class="card-body update-card">
                    <asp:GridView Width="100%" OnRowCommand="Updates_RowCommand" ID="Updates" runat="server" ShowHeader="false" AutoGenerateColumns="false" GridLines="None" EmptyDataText="No Updates" SelectedRowStyle-Width="100">
                        <Columns>

                            <asp:TemplateField HeaderText="Building" ItemStyle-Width="100%" SortExpression="name">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="lnkDetails"
                                        runat="server"
                                        CommandName="Redirect"
                                        CommandArgument='<%# Eval("type") %>'
                                        Style="text-decoration: none;">
                                        <div class="d-flex update-grid hov" style="gap: 12px;">
                                            <asp:Image runat="server" Width="35px" Height="39px"
                                                ImageUrl='<%# Eval("ImageUrl") %>'
                                                AlternateText="Type Image" />
                                            <div style="width: 100%;">
                                                <div class="inner-div">
                                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("type") %>' Font-Size="Small" ForeColor="#808080"></asp:Label>
                                                    <asp:Label runat="server" Text='<%# Eval("date", "{0:yyyy-MM-dd}") %>' Font-Size="Small" ForeColor="#BCBED0"></asp:Label>
                                                </div>
                                                <div class="notify-div">
                                                    <asp:Label runat="server" ID="name" Text='<%# Eval("name") %>' ForeColor="Black"></asp:Label>
                                                </div>

                                            </div>
                                        </div>

                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Panel ID="noUpdates4" runat="server" Style="margin:auto;">
                        <img style="width: 285px; margin-left:70px;"
                            src="img/noUpdates.jpg" />
                    </asp:Panel>
                </div>
            </div>

            <asp:UpdatePanel runat="server" ID="updatePanelDonat" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="card layout-box layout-medium layout-pink">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Income Tracker</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                    <asp:Button ID="due_this_month" runat="server" CssClass="dropdown-item" Text="This Month" OnClick="due_this_month_Click"></asp:Button>
                                    <asp:Button ID="due_last_month" runat="server" CssClass="dropdown-item" Text="Last Month" OnClick="due_last_month_Click"></asp:Button>
                                    <asp:Button ID="due_this_year" runat="server" CssClass="dropdown-item" Text="This Year" OnClick="due_this_year_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body d-flex flex-column align-items-center justify-content-center">
                            <asp:Label ID="lblNoData" runat="server"><img src="img/noDataFound.jpg" width="233px"/></asp:Label>



                            <asp:Chart ID="Chart1" runat="server" BackColor="Transparent">
                                <Series>
                                    <asp:Series Name="Default" ChartType="Doughnut"
                                        IsValueShownAsLabel="false"
                                        Label="#PERCENT{P1}"
                                        ToolTip="#VALX: ₹#VALY"
                                        Font="Segoe UI, 9pt"
                                        LabelForeColor="White"
                                        BorderWidth="1"
                                        BorderColor="White">
                                    </asp:Series>
                                </Series>

                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                        <Area3DStyle Enable3D="true" LightStyle="Realistic" />
                                        <AxisX LineWidth="0" MajorGrid-Enabled="False" LabelStyle-Enabled="False" />
                                        <AxisY LineWidth="0" MajorGrid-Enabled="False" LabelStyle-Enabled="False" />
                                    </asp:ChartArea>
                                </ChartAreas>


                            </asp:Chart>

                            <asp:Panel ID="chartDots" runat="server">
                                <div class="mt-4 text-center small">
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-primary mr-1" style="color: #ff7f7f;"></i>Due
                                    </span>
                                    <span class="mr-2">
                                        <i class="fas fa-circle mr-1" style="color: #FFFAA0;"></i>Collection
                                    </span>
                                </div>
                            </asp:Panel>

                        </div>



                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Timer ID="SharedTimer" runat="server" Interval="1000" OnTick="TimerNotif_Tick" />
            <div class="card layout-box layout-small-right layout-cyan">
                <a href="support_ticket.aspx" style="text-decoration: none;">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">HELPDESK TICKETS</h6>

                    </div>

                    <div class="card-body form-group">
                        <asp:UpdatePanel ID="upNotifCount" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="helpdesk-cards">
                                    <div class="helpdesk-card">
                                        <div class="helpdesk-card-title">Open Ticket</div>
                                        <div class="helpdesk-card-number">
                                            <asp:Label ID="open" runat="server" Text="Open" ForeColor="Black"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="helpdesk-card">
                                        <div class="helpdesk-card-title">Resolve Tickets</div>
                                        <div class="helpdesk-card-number">
                                            <asp:Label ID="resolved" runat="server" Text="Resolved" ForeColor="Black"></asp:Label>
                                        </div>

                                    </div>
                                    <asp:Label ID="lblToken" runat="server" Text=""></asp:Label>

                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="SharedTimer" EventName="Tick" />
                            </Triggers>

                        </asp:UpdatePanel>
                        <br />

                    </div>
                </a>
            </div>
            
        </div>
    </div>





    <script src="https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js"></script>
    <script type="text/javascript">
        debugger;
        firebase.initializeApp({
            apiKey: "AIzaSyCVD6hUSK4zMfG43bMjyjwTFmTz5PJc_qk",
            authDomain: "society-management-32053.firebaseapp.com",
            projectId: "society-management-32053",
            storageBucket: "society-management-32053.appspot.com",
            messagingSenderId: "303424747645",
            appId: "1:303424747645:web:a10ad8eceb38c4fe10d914",
            measurementId: "G-MCRPPNVW38"
        });

        const messaging = firebase.messaging();
        Notification.requestPermission().then(permission => {

            if (permission === "granted") {
                console.log("permission Granted");
                navigator.serviceWorker.register('/firebase-messaging-sw.js')
                    .then((registration) => {
                        console.log('✅ SW registered:', registration);

                        //messaging.useServiceWorker(registration); // only works with compat SDK

                        return messaging.getToken({
                            vapidKey: "BKJDUyImlBxO4O_UewJxcN8Ug0EdqxsmxbwQ8nn2bscwwWBUGPGsuMdlU9IKvuTe60iz59iJC0wBMfGuXRkqj2E",
                            serviceWorkerRegistration: registration
                        });
                    })
                    .then(token => {
                        console.log("✅ Token:", token);
                        

                        sendTokenToServer(token);
                    })
                    .catch(error => {
                        console.error("❌ Error getting token:", error);
                    });
            } else {
                console.warn("❌ Notification permission denied");
            }
        });

        function sendTokenToServer(token) {
            fetch('TokenService.asmx/SaveToken', {
                method: 'POST',
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ token: token })
            })
                .then(response => response.json())
                .then(data => {
                    console.log("Response:", data);

                })
                .catch(error => {
                    console.error("Error:", error);
                });
        }


        window.addEventListener('load', resizeChart);
        window.addEventListener('resize', resizeChart);

        function resizeChart() {
            var container = document.getElementById('chartContainer');
            var chart = document.getElementById('<%= Chart2.ClientID %>');

            if (container && chart) {
                var width = container.offsetWidth;

                chart.style.width = width-3 + 'px';
            }
        }
    </script>

</asp:Content>


