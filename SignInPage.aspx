<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignInPage.aspx.cs" Inherits="SignInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SongMood - Sign In</title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/NavBarStyle.css" rel="stylesheet" />
        <link href="Styles/SignInStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />

        <div>
            <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
        </div>

        <div class="topnav" >
            <asp:HyperLink ID="SignUpHL" runat="server" NavigateUrl="SignUpPage.aspx">Sign Up</asp:HyperLink>
        </div>

        <h3 class="header">Song Mood - Sign In</h3>

    <table class="signin">   
        <tr>
            <td><asp:Label ID="UserNameLbl" runat="server" Text="User Name: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignin" ID="UserNameTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRFV" runat="server" ErrorMessage="*" Font-Size="Large" Font-Bold="true" ForeColor="Red" ControlToValidate="UserNameTxt" ValidationGroup="SignInVG"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td><asp:Label ID="PasswordLbl" runat="server" Text="Password: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignin" ID="PasswordTxt" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRFV" runat="server" ErrorMessage="*" Font-Size="Large" Font-Bold="true" ForeColor="Red" ControlToValidate="PasswordTxt" ValidationGroup="SignInVG"></asp:RequiredFieldValidator>
            </td>

        </tr>
        
        <tr>
            <td></td>
            <td><asp:Button CssClass="buttonsignin" ID="SignInBtn" runat="server" Text="Sign In" ValidationGroup="SignInVG" OnClick="SignInBtn_Click" /></td>
            <td><asp:Label ID="SignInSuccessLbl" runat="server"></asp:Label></td>
            <td><asp:Label ID="SignInRedirectLbl" runat="server"></asp:Label></td>
        </tr>
           
        <tr>
            <td></td>
            <td><asp:HyperLink ID="ForgotPassHL" runat="server" Text="I forgot my password" NavigateUrl="~/PasswordResetPage.aspx" ForeColor="Wheat"></asp:HyperLink></td>
        </tr>
    </table>
    </form>
</body>
</html>
