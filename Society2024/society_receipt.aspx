<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="society_receipt.aspx.cs" Inherits="Society2024.society_receipt" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Receipt Management</h2>
    <asp:HiddenField runat="server" id="Society_id"/>
    <div>
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


                                      
                                        <asp:TemplateField HeaderText="Pending Amount" ItemStyle-Width="150" SortExpression="pending_amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingAmount" runat="server" Text='<%# Bind("month")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Month" ItemStyle-Width="150" SortExpression="month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingMonth" runat="server" Text='<%# Bind("pending_amount")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment" ItemStyle-Width="150" SortExpression="month">
    <ItemTemplate>
        <asp:Button ID="pay" runat="server" Text="Pay" CssClass="btn btn-success payBtn"
            OnClientClick='<%# "showPaymentModal(\"" + Eval("pending_amount") + "\"); return false;" %>' />
    </ItemTemplate>
</asp:TemplateField>
                                   </Columns>
                                </asp:GridView>
                            </div>
                        </div>
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
                                    EmptyDataText="No Record Found" ShowHeaderWhenEmpty="true" HeaderStyle-BackColor="lightblue" AllowSorting="true" 
                                
                                    
                                    >
                                   
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField HeaderText="Pending Amount" ItemStyle-Width="150" SortExpression="pending_amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingAmount" runat="server" Text='<%# Bind("month")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Month" ItemStyle-Width="150" SortExpression="month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPendingMonth" runat="server" Text='<%# Bind("pending_amount")%>'></asp:Label>
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

        <div class="form-group">
            <label>Pending Amount</label>
            <input type="text" class="form-control" id="modalPendingAmount" readonly />
        </div>

        <div class="form-group">
            <label>Payment Type</label>
            <select class="form-control" id="paymentType">
                <option value="">-- Select --</option>
                <option value="UPI">UPI</option>
                <option value="Cash">Cash</option>
                <option value="Card">Card</option>
            </select>
        </div>

        <div class="form-group" id="upiField" style="display:none;">
            <label>UPI ID</label>
            <input type="text" class="form-control" placeholder="Enter UPI ID" />
        </div>

        <div class="form-group" id="otherField" style="display:none;">
            <label>Reference Details</label>
            <input type="text" class="form-control" placeholder="Transaction reference..." />
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Submit Payment</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
        </div>
    </div>

    <!-- Optional: Bootstrap for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>>
<script>
    function showPaymentModal(pendingAmount) {
        // Fill the pending amount
        document.getElementById("modalPendingAmount").value = pendingAmount;

        // Reset dropdown and inputs
        $('#paymentType').val('');
        $('#upiField').hide();
        $('#otherField').hide();

        // Show the modal
        $('#paymentModal').modal('show');
    }

    // Show/hide fields based on dropdown selection
    $(document).ready(function () {
        $('#paymentType').change(function () {
            var selected = $(this).val();
            if (selected === "UPI") {
                $('#upiField').show();
                $('#otherField').hide();
            } else if (selected === "Cash") {
                $('#upiField').hide();
                $('#otherField').hide(); // no extra field
            } else {
                $('#upiField').hide();
                $('#otherField').show();
            }
        });
    });
</script>



</asp:Content>