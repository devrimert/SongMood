<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewPasswordPage.aspx.cs" Inherits="NewPasswordPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <link href="Styles/PassResetStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />

        <div>
            <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
        </div>

            <h3 class="header">SongMood - New Password Page</h3>

        <table class="passreset">
            <tr>
                <td>Current Password: </td>
                <td><asp:TextBox CssClass="textboxpassreset" ID="CurrentPassTB" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="CurrentPassRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="CurrentPassTB" ValidationGroup="PassChangeVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>New Password: </td>
                <td><asp:TextBox CssClass="textboxpassreset" ID="NewPassTB" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="NewPassRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="NewPassTB" ValidationGroup="PassChangeVG"></asp:RequiredFieldValidator></td>
            </tr>
            
            <tr>
                <td>New Password Again: </td>
                <td><asp:TextBox CssClass="textboxpassreset" ID="NewPassAgainTB" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="NewPassAgainRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="NewPassAgainTB" ValidationGroup="PassChangeVG"></asp:RequiredFieldValidator></td>
                <td><asp:CompareValidator ID="NewPassAgainCV" runat="server" ControlToValidate="NewPassAgainTB" ControlToCompare="NewPassTB" ErrorMessage="Passwords should be matched!" ForeColor="Red" ValidationGroup="PassChangeVG"></asp:CompareValidator></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Button CssClass="buttonpassreset" ID="PassChangeBtn" runat="server" Text="Change" OnClick="PassChangeBtn_Click" ValidationGroup="PassChangeVG" /></td>
                <td><asp:Label ID="PassChangeSuccessLbl" runat="server"></asp:Label></td>
            </tr>
            
            <tr>
                <td></td>
                <td><asp:Label ID="RedirectionLbl" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
