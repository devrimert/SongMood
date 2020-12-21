<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SongAdditionPage.aspx.cs" Inherits="SongAdditionPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Song Mood - Add Song</title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/SongAddStyle.css" rel="stylesheet" />
        <link href="Styles/NavBarStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />
        <link href="Styles/DropDownListStyle.css" rel="stylesheet" />

        <div>
            <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
        </div>

        <div class="topnav">
            <asp:Button CssClass="navbarbutton" ID="LogOutBtn" runat="server" Text="Log Out" OnClick="LogOutBtn_Click" />
            <asp:HyperLink ID="ProfilePageHL" runat="server" NavigateUrl="~/ProfilePage.aspx"><asp:Label ID="UserNameLbl" runat="server"></asp:Label></asp:HyperLink>
        </div>

        <h3 class="header">Song Mood - Add Song</h3>

    <div>
        <table class="songadd">
            <tr>
                <td>Song Name: </td>
                <td><asp:TextBox CssClass="textboxsongadd" ID="SongNameTB" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="SongNameRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="SongNameTB" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>
            
            <tr>
                <td>Artist Name: </td>
                <td><asp:TextBox CssClass="textboxsongadd" ID="ArtistNameTB" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="ArtistNameRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ArtistNameTB" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>Album Name: </td>
                <td><asp:TextBox CssClass="textboxsongadd" ID="AlbumNameTB" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="AlbumNameRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="AlbumNameTB" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>Release Date: </td>
                <td><asp:TextBox CssClass="textboxsongadd" ID="ReleaseDateTB" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="ReleaseDateRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ReleaseDateTB" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>Genre: </td>
                <td><asp:TextBox CssClass="textboxsongadd" ID="GenreTB" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="GenreRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="GenreTB" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>Song Mood: </td>
                <td><asp:DropDownList CssClass="ddlsongadd" ID="SongMoodDDL" runat="server">
                    <asp:ListItem Text="Choose the best fit..." Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Happy" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Sad" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Angry" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Energetic" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Depsessive" Value="6"></asp:ListItem>
                    </asp:DropDownList></td>
                <td><asp:RequiredFieldValidator ID="SongMoodRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="SongMoodDDL" InitialValue="1" ValidationGroup="SongAddVG"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Button CssClass="buttonsongadd" ID="SaveSongBtn" runat="server" Text="Save!" ValidationGroup="SongAddVG" OnClick="SaveSongBtn_Click"/></td>
                <td><asp:Label ID="SaveSuccessLbl" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
