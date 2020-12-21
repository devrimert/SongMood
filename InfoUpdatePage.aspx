<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoUpdatePage.aspx.cs" Inherits="InfoUpdatePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SongMood - Info Update/Change Page</title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/ProfileStyle.css" rel="stylesheet" />
        <link href="Styles/NavBarStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />

    <div>
        <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
    </div>

        <div class="topnav">
            <asp:Button CssClass="navbarbutton" ID="LogOutBtn" runat="server" Text="Log Out" OnClick="LogOutBtn_Click" />
            <asp:HyperLink ID="ProfilePageRedirector" runat="server" NavigateUrl="ProfilePage.aspx"><asp:Label ID="UserNameLbl" runat="server"></asp:Label></asp:HyperLink>
        </div>

        <h3 class="header">Song Mood - Info Update</h3>

        <table class="infoupt">
            <tr>
                <td>Profile Picture: </td>
                <td><asp:FileUpload CssClass="textboxinfupt" ID="ProfilePictureUpload" runat="server" /></td>
                <td><asp:Button CssClass="buttoninfupt" ID="PPUpload" runat="server" Text="Upload" OnClick="PPUpload_Click"/></td>
                <td><asp:Image ID="ProfilePicture" runat="server" Height="160px" Width="90px"/></td>
            </tr>

            <tr>
                <td>Name: </td>
                <td><asp:TextBox CssClass="textboxinfupt" ID="UsrInfoNameTB" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Surname: </td>
                <td><asp:TextBox CssClass="textboxinfupt" ID="UsrInfoSurnameTB" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>City: </td>
                <td><asp:TextBox CssClass="textboxinfupt" ID="UsrInfoCityTB" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Phone: </td>
                <td><asp:TextBox CssClass="textboxinfupt" ID="UsrInfoPhoneTB" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>About: </td>
                <td><asp:TextBox CssClass="textboxinfupt" ID="UsrInfoAbout" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Button CssClass="buttoninfupt" ID="SaveChangesBtn" runat="server" Text="Save!" OnClick="SaveChangesBtn_Click" /></td>
                <td><asp:Label ID="InfoChangeSuccessLbl" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Label ID="PPUplSuccessLbl" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
