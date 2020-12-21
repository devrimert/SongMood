<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SongMood - Home Page</title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/NavBarStyle.css" rel="stylesheet" />
        <link href="Styles/HomePageStyle.css" rel="stylesheet" />
        <link href="Styles/DropDownListStyle.css" rel="stylesheet" />

        <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodHomePageLogo.png" Height="140px" Width="250px" OnClick="HomePageRedirect" /> 

        <div class="topnav">
            <asp:HyperLink ID="SignUpHL" runat="server" Text="Sign Up" NavigateUrl="SignUpPage.aspx"></asp:HyperLink>
            <asp:HyperLink ID="SignInHL" runat="server" Text="Sign In" NavigateUrl="SignInPage.aspx"></asp:HyperLink>
            <asp:Button CssClass="navbarbutton" ID="LogOutBtn" runat="server" Text="Log Out" OnClick="LogOutBtn_Click" />
            <asp:HyperLink ID="ProfileHL" runat="server" NavigateUrl="~/ProfilePage.aspx"><asp:Label ID="UserNameLbl" runat="server"></asp:Label></asp:HyperLink>
        </div>

        <h3 class="header">Song Mood - Home Page</h3>

    <table>           
            <tr>
                <td>
                    <asp:DropDownList CssClass="ddlhomepage" ID="MoodsDDL" runat="server" OnTextChanged="OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="Choose your current mood..." Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Happy" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Angry" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Sad" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Depressive" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Energetic" Value="6"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td><asp:DataGrid CssClass="gridview" ID="SongData" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <EditItemStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
