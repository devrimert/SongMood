<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordResetPage.aspx.cs" Inherits="PasswordResetPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/PassResetStyle.css" rel="stylesheet" />
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" />
        <link href="Styles/DropDownListStyle.css" rel="stylesheet" />

        <div>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
        </div>

        <h3 class="header">Song Mood - Password Reset</h3>

        <table class="passreset">
            <tr>
                <td>User Name: </td>
                <td><asp:TextBox CssClass="textboxpassreset" ID="UserNameChckTB" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameChckRFV" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="UserNameChckTB" ValidationGroup="SecretQA_VG"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td><asp:Label ID="secretQLbl" runat="server" Text="Secret Question: "></asp:Label></td>
                <td><asp:DropDownList CssClass="ddlpassreset" ID="secretQDDL" runat="server">
                <asp:ListItem Text="Choose a question..." Selected="True" Value="1" />
                <asp:ListItem Text="What is the name of your pet?" Value="2" />
                <asp:ListItem Text="What is the name of your favorite book?" Value="3" />
                <asp:ListItem Text="What is the name of your best friend's name?" Value="4" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="SecretQRequired" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="secretQDDL" InitialValue="1" ValidationGroup="SecretQA_VG"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td><asp:Label ID="secretALbl" runat="server" Text="Secret Answer: "></asp:Label></td>
                <td><asp:TextBox CssClass="textboxpassreset" ID="secretATxt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SecretARequired" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="secretATxt" ValidationGroup="SecretQA_VG"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Button CssClass="buttonpassreset" ID="resetPassBtn" runat="server" Text="Reset!" OnClick="resetPassBtn_Click" ValidationGroup="SecretQA_VG" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="ResetSuccessLbl" runat="server" Text=""></asp:Label></td>
                <td><asp:Label ID="ResetRedirectLbl" runat="server" Text=""></asp:Label></td>
            </tr>

        </table>
    </form>
</body>
</html>
