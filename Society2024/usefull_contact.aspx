<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usefull_contact.aspx.cs" Inherits="Society.usefull_contactDataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function digit(evt) {
            if (evt.keyCode < 48 || evt.keyCode > 57) {

                return false;
            }
        }

        function checkLength(el) {

            if (el.value.length != 10) {

                alert("length must be exactly 10 digits")

                return false;
            }
        }
    </script>
    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="box-body">


                <table width="100%">
                    <tr>
                        <th width="100%">
                            <h1 class="bg-primary text-white">
                                <center>Contact Saved</center>
                            </h1>
                        </th>
                    </tr>

                </table>
                <br />
            </div>



            <asp:HiddenField ID="usefull_contact_id" runat="server" />
            <asp:HiddenField ID="society_id" runat="Server"></asp:HiddenField>
            <div class="box box-info">
                <div class="box-body">

                    

                  
                </div>
            </div>
        </div>
    </div>

</asp:Content>
