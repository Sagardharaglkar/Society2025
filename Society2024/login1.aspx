<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="Society.login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <script src="script/rich-textarea-53.js" type="text/javascript"></script>
    <script src="script/isc_base.js" type="text/javascript"></script>

    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/js/bootstrap.js" />
    <link rel="stylesheet" href="bootstrap/js/bootstrap.min.js" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style type="text/css">
body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
        }

        .container {
            width: 800px;
            height: 450px;
            margin: 50px auto;
            display: flex;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .left {
            width: 50%;
            background: #ffffff;
            padding: 40px;
            box-sizing: border-box;
        }

        .left h2 {
            margin-bottom: 20px;
            font-weight: 600;
            color: #466CD9;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: none;
            border-radius: 25px;
            background-color: #eef1f5;
            font-size: 14px;
        }

        .btn-signin {
            margin-top:30px;
            width: 106%;
            padding: 12px;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        .options {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
            font-size: 13px;
        }

        .remember {
            color: #466CD9;
        }

        .right {
            width: 50%;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 30px;
        }

        .right h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .right span {
            font-size: 14px;
            margin-bottom: 20px;
        }

        .btn-signup {
            padding: 10px 20px;
            background: transparent;
            border: 1px solid #fff;
            color: white;
            border-radius: 25px;
            font-size: 14px;
            cursor: pointer;
        }

        .social-icons {
            text-align: right;
            margin-bottom: 20px;
        }

        .social-icons i {
            margin: 0 5px;
            font-size: 18px;
            cursor: pointer;
            color: #466CD9;
        }

        .social-icons i:hover {
            color: #2d4bb6;
        }
    </style>

</head>

<body>

            <form id="form2" runat="server" class="needs-validation" novalidate>
       <div class="container" style="padding:0;">
        <div class="left">
            <h2>Sign In</h2>
            <div class="container2">
                <div class="mb-3">
                    <asp:TextBox ID="txt_Username" runat="server" CssClass="form-control" placeholder="Username" required></asp:TextBox>
                    <div class="invalid-feedback">Please enter your username.</div>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" required></asp:TextBox>
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>

                <asp:Button ID="Button2" runat="server" Text="Sign In" CssClass="btn-signin" OnClick="btn_Login_Click" />
            </div>
            <div class="options">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forgot Password</asp:HyperLink>
            </div>
        </div>
        <div class="right">
            <h2>Welcome to login</h2>
            <span>Don't have an account?</span>
            <asp:Button ID="Button3" runat="server" CssClass="btn-signup" Text="Sign Up" UseSubmitBehavior="false"  OnClick="Button1_Click" />
        </div>
    </div>
    <asp:Label ID="lbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
    </form>




</body>



<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- InputMask -->
<script src="js/jquery.inputmask.js"></script>
<script src="js/jquery.inputmask.date.extensions.js"></script>
<script src="js/jquery.inputmask.extensions.js"></script>
<script src="js/jquery.inputmask.numeric.extensions.js"></script>

<!-- Page script -->
<script>
    $(function () {

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();


    });
</script>




<script type="text/javascript">
    var message = "Function Disabled!";

    function clickIE4() {
        if (event.button == 2) {

            return false;
        }
    }

    function clickNS4(e) {
        if (document.layers || document.getElementById && !document.all) {
            if (e.which == 2 || e.which == 3) {
                return false;
            }
        }
    }
    if (document.layers) {
        document.captureEvents(Event.MOUSEDOWN);
        document.onmousedown = clickNS4;
    }
    else if (document.all && !document.getElementById) {
        document.onmousedown = clickIE4;
    }
    document.oncontextmenu = new Function("return false")
</script>

<script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-64913771-1', 'auto');
    ga('send', 'pageview');

</script>

    <!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom validation script -->
<script>
    (function () {
        'use strict';

        // Wait for the DOM to be ready
        window.addEventListener('load', function () {
            // Get the form element
            var form = document.querySelector('.needs-validation');

            // Prevent form submission if fields are invalid
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>

</html>
<footer class="index-footer">
    <center>
        <strong>Integrasol Software Consultancy.</strong> All rights reserved.
    </center>
</footer>
