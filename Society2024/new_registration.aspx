<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_registration.aspx.cs" Inherits="Society.new_registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Registration</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
        }

        .form-control2 {
            height: 35px;
            width: 30%;
            margin-right: 185px;
            padding: 12px;
            margin-bottom: 12px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
        }

        .form-control:focus {
            border: 2px solid black;
            outline: none;
        }

        .form-container {
            width: 60vw;
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

        .right-panel {
            width: 60%;
            padding: 25px 20px;
        }

        .btn-SignUp, .btn-verify {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #466CD9, #5D8FEF);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-control-repass {
            padding: 12px;
            border: none;
            border-radius: 50px;
            background-color: #eef1f5;
            font-size: 14px;
            text-transform: capitalize;
            width: 100%;
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

  
</head>

<body>
    <form id="myForm" runat="server" class="needs-validation" novalidate>
        <div class="form-container">
            <div class="left-panel">
                <h2>Welcome Back!</h2>
                <p>Already have an account?</p>
                <asp:Button ID="Button1" runat="server" CssClass="btn-singin" Text="Sign In" OnClick="Button1_Click" UseSubmitBehavior="False" />
            </div>

            <div class="right-panel">
                <asp:HiddenField ID="UserLoginId" runat="server" />
                <asp:HiddenField ID="society_id" runat="server" />

                <h2>Create Account</h2>

                <div class="mb-3">
                    <asp:TextBox ID="txt_Name" CssClass="form-control" runat="server" placeholder="Enter Name" required></asp:TextBox>
                    <div class="invalid-feedback">Please enter your name.</div>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txt_Address" CssClass="form-control" runat="server" placeholder="Enter Address" required></asp:TextBox>
                    <div class="invalid-feedback">Please enter your address.</div>
                </div>

                <div class="mb-3">
                    <div class="d-flex align-items-center gap-2">
                        <div style="width:100%;"> 
                    <asp:TextBox ID="txt_Mobile" Style="margin-bottom:0px;" CssClass="form-control" MaxLength="10" runat="server" placeholder="Enter Contact No." required TextMode="Phone"></asp:TextBox>
                    <div class="invalid-feedback">Enter a valid mobile number.</div>
                    <asp:TextBox Style="display:none; margin-bottom:0px;" CssClass="form-control" ID="Contact_OTP" runat="server" placeholder="Enter Verify OTP" ></asp:TextBox>
                            </div>
                    <asp:Button ID="btn_verify1" CssClass="btn-verify" runat="server" Text="Verify" OnClick="btn_verify1_Click" UseSubmitBehavior="False" />

                    </div>
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <asp:LinkButton ID="LinkButton1" runat="server">Resend OTP</asp:LinkButton>
                    </asp:Panel>
                </div>

                <div class="mb-3">
                    <div class="d-flex align-items-center gap-2 w-100">
                        <div style="width:100%;"> 
                    <asp:TextBox ID="txt_Emailid" Style="margin-bottom:0px;" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txt_Emailid_TextChanged" placeholder="Enter Email" required TextMode="Email"></asp:TextBox>
                    <div class="invalid-feedback">Please enter a valid email address.</div>
                    <asp:TextBox ID="Email_OTP" Style="margin-bottom:0px; display:none;" CssClass="form-control" runat="server" placeholder="Enter Verify OTP" ></asp:TextBox>

                        </div>
                    <asp:Button ID="btn_verify2" CssClass="btn-verify" runat="server" Text="Verify" OnClick="btn_verify2_Click" UseSubmitBehavior="False" />
                        </div>
                    <asp:Label ID="Label10" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Font-Bold="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_Emailid" ForeColor="red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        <asp:LinkButton ID="LinkButton2" runat="server">Resend OTP</asp:LinkButton>
                    </asp:Panel>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txt_user" CssClass="form-control" runat="server" placeholder="Username" Enabled="false"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txt_new_pass" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter Password" required></asp:TextBox>
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txt_re_password" CssClass="form-control" runat="server" TextMode="Password" placeholder="Re-enter Password" required></asp:TextBox>
                   <%-- <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_new_pass" ControlToValidate="txt_re_password" ErrorMessage="*Passwords do not match" ForeColor="Red"></asp:CompareValidator>--%>
                    <div class="invalid-feedback">Please re-enter the same password.</div>
                </div>

                <div class="mb-3">
                    <asp:Button ID="btn_save" CssClass="btn-SignUp" runat="server" Text="Create Account" OnClick="btn_save_Click" />
                </div>
            </div>
        </div>
    </form>


      <script type="text/javascript">
          (function () {
              'use strict';

              const forms = document.querySelectorAll('.needs-validation');

              Array.prototype.slice.call(forms).forEach(function (form) {
                  let submittedOnce = false;

                  function validateField(input) {
                      const tag = input.tagName.toLowerCase();
                      const type = input.type.toLowerCase();
                      const value = input.value.trim();
                      const validTypes = ['text', 'email', 'password', 'search', 'tel', 'url'];

                      // Common whitespace check
                      if ((validTypes.includes(type) || tag === 'textarea') && input.required) {
                          if (value === '') {
                              input.setCustomValidity('Whitespace is not allowed');
                              showInvalid(input);
                              return;
                          } else {
                              input.setCustomValidity('');
                          }
                      }

                      // Additional type-based validations
                      if (type === 'email' && value !== '') {
                          const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                          if (!emailRegex.test(value)) {
                              input.setCustomValidity('Please enter a valid email address');
                              showInvalid(input);
                              return;
                          } else {
                              input.setCustomValidity('');
                          }
                      }

                      if (type === 'url' && value !== '') {
                          try {
                              new URL(value); // throws if invalid
                              input.setCustomValidity('');
                          } catch {
                              input.setCustomValidity('Please enter a valid URL');
                              showInvalid(input);
                              return;
                          }
                      }

                      if (type === 'tel' && value !== '') {
                          const phoneRegex = /^\d{10}$/; // Only digits, exactly 10
                          if (!phoneRegex.test(value)) {
                              input.setCustomValidity('Phone number must be exactly 10 digits');
                              showInvalid(input);
                              return;
                          } else {
                              input.setCustomValidity('');
                          }
                      }

                      // Dropdown (select) validation
                      if (tag === 'select' && input.required) {
                          if (input.value === '0') {
                              input.setCustomValidity('Please select a valid option');
                              showInvalid(input);
                              return;
                          } else {
                              input.setCustomValidity('');
                          }
                      }

                      // Final validation state
                      if (!input.checkValidity()) {
                          showInvalid(input);
                      } else {
                          showValid(input);
                      }
                  }

                  function showInvalid(input) {
                      input.classList.remove('is-valid');
                      input.classList.add('is-invalid');
                  }

                  function showValid(input) {
                      input.classList.remove('is-invalid');
                      input.classList.add('is-valid');
                  }

                  form.addEventListener('submit', function (event) {
                      submittedOnce = true;
                      let hasCustomError = false;

                      form.querySelectorAll('input, textarea, select').forEach(function (input) {
                          validateField(input);
                          if (!input.checkValidity()) {
                              hasCustomError = true;
                          }
                      });
                      console.log(submittedOnce);
                      if (hasCustomError) {
                          event.preventDefault();
                          event.stopPropagation();
                      }

                      form.classList.add('was-validated');
                  }, false);

                  // Live validation
                  form.querySelectorAll('input, textarea, select').forEach(function (input) {
                      input.addEventListener('input', function () {
                          if (submittedOnce) {
                              validateField(input);
                          }
                      });
                  });
              });
          })();
      </script>
</body>
</html>
