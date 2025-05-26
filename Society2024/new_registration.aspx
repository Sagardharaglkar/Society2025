<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_registration.aspx.cs" Inherits="Society.new_registration" MasterPageFile="~/Site.Master" %>

<%--<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">--%>
<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type='text/javascript'>

        function digit(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode < 48 || charCode > 57) {
                return false;
            }
            return true;
        }
        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }

        function toggleEmailVerification() {
            // Hide the email input textbox
            document.getElementById('<%= txt_Emailid.ClientID %>').style.display = 'none';
            // Show the OTP input textbox
            document.getElementById('<%= Email_OTP.ClientID %>').style.display = 'block';
        }
    </script>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
        }

        
        .form-control2 {
            height: 35px;
            width: 30%;
            margin-right:185px;
            padding: 12px;
            margin-bottom: 12px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
        }

            .form-control:focus {
                border: 2px solid black; /* Black border on focus */
                outline: none; /* Removes the blue focus border */
            }

        .form-container {
            width: 60vw;
            height: 600px;
            margin: 50px auto;
            display: flex;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }


        .left-panel {
            width: 50%;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            padding: 30px 50px;
            padding-top: 150px;
            text-align: center;
        }

            .left-panel h2 {
                margin-bottom: 20px;
                font-weight: bold;
            }

        .signin-btn {
            background-color: white;
            color: #f76c6c;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 20px;
        }

        .right-panel {
            width: 60%;
            padding: 25px 20px;
        }

            .right-panel h2 {
                margin-bottom: 20px;
                font-weight: 600;
                color: #466CD9;
            }

            .right-panel p {
                font-size: 12px;
                margin-bottom: 20px;
            }

        .btn-singin {
            width: 100%;
            padding: 10px 20px;
            background: transparent;
            border: 1px solid #fff;
            color: white;
            border-radius: 25px;
            font-size: 14px;
            cursor: pointer;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

            /*     .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="password"] {
                flex: 1;
                padding: 8px 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 14px;
            }*/

            /*.form-group button {
                margin-left: 8px;
                padding: 8px 12px;
                background-color: #f76c6c;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 12px;
            }*/

            .form-group .otp-input {
                display: flex;
                align-items: center;
                margin-top: 5px;
            }

                .form-group .otp-input input {
                    margin-right: 5px;
                }

                .form-group .otp-input a {
                    font-size: 11px;
                    color: #f76c6c;
                    text-decoration: none;
                }

            .form-group:last-child {
                justify-content: center;
            }

                .form-group:last-child button {
                    width: 100%;
                    font-size: 16px;
                }

        .btn-SignUp {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-verify {
            margin: 0 3px;
            padding: 12px;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-control-repass{
            padding: 12px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
        }

            .form-control-repass:focus {
                border: none; /* Black border on focus */
                outline: none; /* Removes the blue focus border */
            }

        .last-text {
            width: 100%;
            margin-bottom: 15px;
            height: 35px;
            background-color: #eef1f5;
            border-radius: 50px;
            display: flex;
            justify-content: space-between;
            padding-right: 16px;
            text-align: center;
        }
    </style>

    <div class="form-container">
        <div class="left-panel">
            <h2>Welcome Back!</h2>
            <p>Already have an Account</p>
            <asp:Button ID="Button1" runat="server" CssClass="btn-singin" Text="Sign in" OnClick="Button1_Click" UseSubmitBehavior="False" />

        </div>

        <div class="right-panel">
            <h2>Create Account</h2>

            <asp:HiddenField ID="UserLoginId" runat="server" />
            <asp:HiddenField ID="society_id" runat="server" />

            <div class="form-group">
                <asp:TextBox ID="txt_Name" CssClass="form-control" runat="server" placeholder="Enter Name" required></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox CssClass="form-control" ID="txt_Address" runat="server" Style="text-transform: capitalize;" placeholder="Enter Address" required></asp:TextBox>
            </div>

            <div class="form-group">

                <asp:TextBox CssClass="form-control" ID="txt_Mobile" runat="server" MaxLength="10" onblur="checkLength(this)" onkeypress="return digit(event);" placeholder="Enter Contact No." required></asp:TextBox>
                <asp:TextBox Style="display: none;" CssClass="form-control2" ID="Contact_OTP" runat="server" placeholder="Enter Verify OTP"></asp:TextBox>
                <asp:Button ID="btn_verify1" CssClass="btn-verify" runat="server" Text="Verify" OnClick="btn_verify1_Click" UseSubmitBehavior="False" />
                <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="otp-input">
                    <asp:LinkButton ID="LinkButton1" runat="server">Resend OTP</asp:LinkButton>
                </asp:Panel>
            </div>

            <div class="form-group">

                <asp:TextBox CssClass="form-control" ID="txt_Emailid" runat="server" placeholder="Enter Email" OnTextChanged="txt_Emailid_TextChanged" AutoPostBack="true" required></asp:TextBox>
                <asp:TextBox CssClass="form-control2" Style="display: none;" ID="Email_OTP" runat="server" placeholder="Enter Verify OTP"></asp:TextBox>
                <asp:Button CssClass="btn-verify" ID="btn_verify2" runat="server" Text="Verify" OnClick="btn_verify2_Click" UseSubmitBehavior="False" />
                <asp:Label ID="Label10" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Font-Bold="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Emailid" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="otp-input">
                    <asp:LinkButton ID="LinkButton2" runat="server">Resend OTP</asp:LinkButton>
                </asp:Panel>
            </div>

            <div class="form-group">

                <asp:TextBox CssClass="form-control" ID="txt_user" runat="server" placeholder="Enter Username" required Enabled="false"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox CssClass="form-control" ID="txt_new_pass" runat="server" TextMode="Password" placeholder="Enter Password" required></asp:TextBox>
            </div>

            <div class="form-group">
                <div class="last-text">
                    <asp:TextBox CssClass="form-control-repass" ID="txt_re_password" TextMode="Password" runat="server" placeholder="Re-Enter Password" required></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_new_pass" ControlToValidate="txt_re_password" ErrorMessage="*Password Not Match" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Button ID="btn_save" CssClass="btn-SignUp" runat="server" Text="Create Account" OnClick="btn_save_Click" />
            </div>
        </div>
    </div>
</asp:Content>



