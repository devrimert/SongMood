<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/NavBarStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />
        <link href="Styles/ProfileStyle.css" rel="stylesheet" />

    <div>
        <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" />
    </div>
        <div class="topnav">
            
            <asp:Button CssClass="navbarbutton" ID="LogOutBtn" runat="server" Text="Log Out" OnClick="LogOutBtn_Click" />
            <asp:Button CssClass="navbarbutton" ID="InfoUpdateBtn" runat="server" Text="Update/Change" OnClick="InfoUpdateBtn_Click" Width="150px" />
            <asp:HyperLink ID="SongAddHL" runat="server" Text="Add Song!" NavigateUrl="~/SongAdditionPage.aspx"></asp:HyperLink>
        </div>

        <div>
            <h3 class="header">Hello and Welcome <asp:Label ID="UserNameLbl" runat="server"></asp:Label></h3>            
        </div>
        
        <table class="profilepage">
            <tr>
                <td><asp:Image ID="ProfilePicture" runat="server" Height="160px" Width="90px"/></td>
            </tr>

            <tr>
                <td>Name: </td>
                <td><asp:Label ID="NameLbl" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td>Surname: </td>
                <td><asp:Label ID="SurnameLbl" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td>City: </td>
                <td><asp:Label ID="CityLbl" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td>Phone: </td>
                <td><asp:Label ID="PhoneLbl" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td>About: </td>
                <td><asp:Label ID="AboutLbl" runat="server"></asp:Label></td>
            </tr>
        </table>
        <asp:GridView CssClass="gridview" ID="PersonalSongsGV" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>


    </form>
</body>
</html>
