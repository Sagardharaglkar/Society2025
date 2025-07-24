<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_receipt.aspx.cs" Inherits="Society2024.society_receipt" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Receipt Management</h2>
    <asp:HiddenField runat="server" id="Society_id"/>
    <div>

        <div class="row mb-3">
    <div class="col-md-4">
        <div class="card text-white bg-danger mb-3">
            <div class="card-header">Total Dues</div>
            <div class="card-body">
                <h3><asp:Label ID="lblTotalDues" runat="server" Text="₹0" /></h3>
            </div>
        </div>
    </div> 
    <div class="col-md-4">
        <div class="card text-white bg-success mb-3">
            <div class="card-header">Paid This Year</div>
            <div class="card-body">
                <h3><asp:Label ID="lblPaidThisYear" runat="server" Text="₹0" /></h3>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-white bg-warning mb-3">
            <div class="card-header">Overdue Months</div>
            <div class="card-body">
                <h3><asp:Label ID="lblOverdueMonths" runat="server" Text="0" /></h3>
            </div>
        </div>
    </div>
</div>


        <!-- Tab Navigation -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item active">
                <a class="nav-link active" href="#invoiceTab" role="tab" data-toggle="tab">Invoice</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#historyTab" role="tab" data-toggle="tab">History</a>
            </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content mt-3">
            <!-- Invoice Tab -->
            <div role="tabpanel" class="tab-pane fade show active" id="invoiceTab">
                 <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped"
                                    EmptyDataText="No Record Found" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="lightblue" AllowSorting="true" > 
                                    
                                  

                                    <Columns>
                                                 <asp:TemplateField HeaderText="S.No" ItemStyle-Width="5px">
                                                     <ItemTemplate>
                                                         <%# Container.DataItemIndex + 1 %>

                                                     </ItemTemplate>

                                                 </asp:TemplateField>                               
                                        <asp:TemplateField HeaderText="Pending Month" ItemStyle-Width="400" SortExpression="amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingAmount" runat="server" Text='<%# Bind("month")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount" ItemStyle-Width="400" SortExpression="month">
                                            <ItemTemplate>
                                                <asp:Label ID="amount" runat="server" Text='<%# Bind("amount")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>   
                                        
                                      
                                     <asp:TemplateField HeaderText="Mark to Pay" ItemStyle-Width="150" SortExpression="month">
                                            <ItemTemplate>
                                                 <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />


                                            </ItemTemplate>
                                        </asp:TemplateField>   
                                   


                                           
                                   </Columns>
                                </asp:GridView>
                                

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
    <div class="col-md-12 d-flex justify-content-end align-items-center">
        <label class="mr-2 font-weight-bold mb-0">Total:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control d-inline-block mr-2" Style="width: 150px;" Text="0"></asp:TextBox>

    <asp:Button ID="pay" runat="server" Text="Pay" CssClass="btn btn-success payBtn"
    OnClientClick="return validateAndShowPaymentModal();" />

    </div>
</div>
                   
            </div>

            <!-- History Tab -->
            <div role="tabpanel" class="tab-pane fade" id="historyTab">
                 <div class="form-group">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div style="width: 100%; overflow: auto;">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-striped" 
                                    EmptyDataText="No Record Found" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="lightblue" AllowSorting="true">
                                   
                                   <Columns>
    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="50px">
        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Date" ItemStyle-Width="150" >
        <ItemTemplate>
            <asp:Label ID="lblPendingAmount" runat="server" Text='<%# Bind("date","{0:dd MMMM yyyy}")%>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Paid Amount" ItemStyle-Width="150" >
        <ItemTemplate>
            <asp:Label ID="lblPendingMonth" runat="server" Text='<%# Bind("paid_amount")%>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Payment mode" ItemStyle-Width="150" >
        <ItemTemplate>
            <asp:Label ID="lblPendingMonth" runat="server" Text='<%# Bind("paymode")%>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Receipt" ItemStyle-Width="100">
    <ItemTemplate>
        <asp:Button ID="btnReceipt" runat="server" Text="View Details"
            CssClass="btn btn-sm btn-primary"
         
            CommandArgument='<%# Eval("receipt_id") %>' />
    </ItemTemplate>
</asp:TemplateField>

                                        

</Columns>

                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Complete Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <!-- Pending Amount -->
                <div class="form-group">
                    <label>Pending Amount</label>
                    <asp:TextBox ID="txtPaymentAmount" runat="server" CssClass="form-control" />
                </div>

               <!-- Payment Type -->
<div class="form-group">
    <label>Payment Type</label>
    <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control">
        <asp:ListItem Text="-- Select --" Value="" />
        <asp:ListItem Text="UPI" Value="UPI" />
        <asp:ListItem Text="Card" Value="Card" />
        <asp:ListItem Text="Bank Transfer" Value="Bank Transfer" />
        <asp:ListItem Text="Wallet" Value="Wallet" />
        <asp:ListItem Text="Online Gateway" Value="Online Gateway" />
    </asp:DropDownList>
</div>

<!-- UPI Field -->
<div class="form-group" id="upiField" style="display:none;">
    <label>UPI ID</label>
    <asp:TextBox ID="txtUPIId" runat="server" CssClass="form-control" Placeholder="Enter UPI ID" />
</div>

<!-- Card Field -->
<div class="form-group" id="cardField" style="display:none;">
    <label>Last 4 Digits of Card</label>
    <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="4" Placeholder="e.g., 1234" />
</div>

<!-- Bank Transfer Field -->
<div class="form-group" id="bankField" style="display:none;">
    <label>Bank Transaction Reference</label>
    <asp:TextBox ID="txtBankRef" runat="server" CssClass="form-control" Placeholder="e.g., NEFT123456" />
</div>

<!-- Wallet Field -->
<div class="form-group" id="walletField" style="display:none;">
    <label>Wallet Transaction ID</label>
    <asp:TextBox ID="txtWalletTxn" runat="server" CssClass="form-control" Placeholder="e.g., Paytm/PhonePe Txn ID" />
</div>

<!-- Gateway Field -->
<div class="form-group" id="gatewayField" style="display:none;">
    <label>Payment Gateway Reference</label>
    <asp:TextBox ID="txtGatewayRef" runat="server" CssClass="form-control" Placeholder="e.g., Razorpay/Stripe ID" />
</div>


            <div class="modal-footer">
                <asp:Button ID="btnSubmitPayment" runat="server" CssClass="btn btn-primary" Text="Submit Payment"
                    OnClick="SubmitPayment" />
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>


    <!-- Optional: Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function setAndShowPaymentModal() {
        var pendingAmount = document.getElementById('<%= TextBox1.ClientID %>').value;
        document.getElementById('<%= txtPaymentAmount.ClientID %>').value = pendingAmount;

        var ddl = $('#<%= ddlPaymentMode.ClientID %>');

        // Reset dropdown and all payment inputs
        ddl.val('');
        $('#<%= txtUPIId.ClientID %>').val('');
        $('#<%= txtCardNumber.ClientID %>').val('');
        $('#<%= txtBankRef.ClientID %>').val('');
        $('#<%= txtWalletTxn.ClientID %>').val('');
        $('#<%= txtGatewayRef.ClientID %>').val('');

        // Hide all payment fields
        $('#upiField, #cardField, #bankField, #walletField, #gatewayField').hide();

        // Show the modal
        $('#paymentModal').modal('show');

        // Force re-trigger logic for showing/hiding fields
        ddl.trigger('change');
    }

    $(document).ready(function () {
        var ddl = $('#<%= ddlPaymentMode.ClientID %>');

        ddl.change(function () {
            var selected = $(this).val();

            // Hide all by default
            $('#upiField, #cardField, #bankField, #walletField, #gatewayField').hide();

            // Show specific field based on selection
            switch (selected) {
                case "UPI":
                    $('#upiField').show();
                    break;
                case "Card":
                    $('#cardField').show();
                    break;
                case "Bank Transfer":
                    $('#bankField').show();
                    break;
                case "Wallet":
                    $('#walletField').show();
                    break;
                case "Online Gateway":
                    $('#gatewayField').show();
                    break;
            }
        });
    });

    function validateAndShowPaymentModal() {
        var amount = parseFloat(document.getElementById('<%= TextBox1.ClientID %>').value);

        if (isNaN(amount) || amount <= 0) {
            alert('Please select at least one item to pay.');
            return false; // Stop execution
        }

        setAndShowPaymentModal();
        return false; // Prevent postback
    }

</script>




</asp:Content>