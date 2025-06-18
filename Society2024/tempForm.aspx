<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
<asp:RadioButton ID="RadioButton1" runat="server" Text="Male"
    GroupName="Gender" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />

<asp:RadioButton ID="RadioButton2" runat="server" Text="Female"
    GroupName="Gender" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />

<asp:Label ID="lblMessage" runat="server" ForeColor="Blue" />


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
