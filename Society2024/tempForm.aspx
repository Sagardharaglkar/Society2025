<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Date Range Picker Example</title>

  <!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!-- Moment.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

  <script src="
  https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js
  "></script>
  <link href="
  https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.css
  " rel="stylesheet">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 40px;
    }
    input {
      padding: 10px;
      width: 250px;
      font-size: 16px;
    }
  </style>
</head>
<body>

  <h2>Select Date Range</h2>
  <input type="text" id="dateRange" placeholder="Select a date range" />

  <script>
      $(document).ready(function () {
          $('#dateRange').daterangepicker({
              opens: 'center',
              autoApply: true,
              showDropdowns: true,
              locale: {
                  format: 'ddd, DD MMM',
                  separator: ' – '
              }
          });
      });
  </script>

</body>
</html>


</asp:Content>
