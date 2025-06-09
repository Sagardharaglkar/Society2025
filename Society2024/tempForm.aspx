<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-5" style="max-width: 400px;">
        <h4 class="mb-3">IFSC Code Validation</h4>
        <div class="mb-3">
            <label for="ifscInput" class="form-label">Enter IFSC Code</label>
            <asp:TextBox ID="ifscInput" runat="server" CssClass="not-required" />
            <div class="valid-feedback">Valid IFSC code.</div>
            <div class="invalid-feedback">Please enter a valid IFSC code.</div>
        </div>
        <asp:Button runat="server" Text="Submit" CssClass="btn btn-primary" OnClientClick="validateIFSC(); return false;" />
    </div>

    <script>
        let formSubmitted = false;

        function validateIFSC() {
            const input = document.getElementById('<%= ifscInput.ClientID %>');
            const pattern = /^[A-Z]{4}0[A-Z0-9]{6}$/;
            formSubmitted = true;

            input.classList.remove('valid-field', 'invalid-field',);

            if (pattern.test(input.value)) {
                input.classList.add('valid-field');
            } else {
                input.classList.add('invalid-field');
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            const input = document.getElementById('<%= ifscInput.ClientID %>');
            input.addEventListener('input', function () {
                if (formSubmitted) validateIFSC();
            });
        });
    </script>

    <style>
.not-required.valid-field {
    border-color: #1cc88a !important;
    padding-right: calc(1.5em + .75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%231cc88a' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(.375em + .1875rem) center;
    background-size: calc(.75em + .375rem) calc(.75em + .375rem);
}

.not-required.invalid-field {
    border-color: #e74a3b !important;
    padding-right: calc(1.5em + .75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='none' stroke='%23e74a3b' viewBox='0 0 12 12'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23e74a3b' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(.375em + .1875rem) center;
    background-size: calc(.75em + .375rem) calc(.75em + .375rem);
}

    </style>
</asp:Content>
