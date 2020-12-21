<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpPage.aspx.cs" Inherits="SignUpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SongMood - Sign Up</title>
</head>
<body>
    <form id="form1" runat="server">

        <link href="Styles/NavBarStyle.css" rel="stylesheet" />               
        <link href="Styles/TextBoxStyle.css" rel="stylesheet" />
        <link href="Styles/ButtonStyle.css" rel="stylesheet" /> 
        <link href="Styles/SignUpStyle.css" rel="stylesheet" />

        <div>
            <asp:ImageButton ID="Logo" runat="server" ImageUrl="Pictures/SongMoodPagesLogo.png" Height="70px" Width="125px" OnClick="HomePage" /> 
        </div>
    <table class="signup">   
        <tr>
            <td><asp:Label ID="UserNameLbl" runat="server" Text="User Name: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="UserNameTxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="UserNameTxt" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="PasswordLbl" runat="server" Text="Password: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="PasswordTxt" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserPasswordRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="PasswordTxt" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="PasswordCheckLbl" runat="server" Text="Password Again: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="PasswordChckTxt" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordChckRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="PasswordChckTxt" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
            <td><asp:CompareValidator ID="PasswordCV" runat="server" ControlToValidate="PasswordChckTxt" ControlToCompare="PasswordTxt" ErrorMessage="Passwords should be match!" ForeColor="Red"></asp:CompareValidator></td>
        </tr>

        <tr>
            <td><asp:Label ID="sQuesLbl" runat="server" Text="Secret Question: "></asp:Label></td>
            <td><asp:DropDownList CssClass="textboxsignup" ID="secretQuesDDL" runat="server">
                <asp:ListItem Text="Choose a question..." Selected="True" Value="1" />
                <asp:ListItem Text="What is the name of your pet?" Value="2" />
                <asp:ListItem Text="What is the name of your favorite book?" Value="3" />
                <asp:ListItem Text="What is the name of your best friend's name?" Value="4" />
                </asp:DropDownList>
            <asp:RequiredFieldValidator ID="SecretQstnRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="secretQuesDDL" InitialValue="1" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td><asp:Label ID="secretAnswrLbl" runat="server" Text="Secret Answer: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="secretAnswrTxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="SecretAnswrRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="secretAnswrTxt" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td>Profile Picture: </td>
            <td><asp:FileUpload ID="ProfilePictureUpload" runat="server" />
                <asp:RequiredFieldValidator ID="PPUploadRFV" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" ControlToValidate="ProfilePictureUpload" ValidationGroup="SignUpVG"></asp:RequiredFieldValidator></td>
            <td><asp:Button ID="PPUpload" runat="server" Text="Upload" OnClick="PPUpload_Click"/></td>
                <td><asp:Image ID="ProfilePicture" runat="server" Height="160px" Width="90px"/></td>
        </tr>

        <tr>
            <td><asp:Label ID="NameLbl" runat="server" Text="Name: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="NameTxt" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="SurnameLbl" runat="server" Text="Surname: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="SurnameTxt" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="CityLbl" runat="server" Text="City: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="CityTxt" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="PhoneLbl" runat="server" Text="Phone: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="PhoneTxt" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="AboutUserLbl" runat="server" Text="About You: "></asp:Label></td>
            <td><asp:TextBox CssClass="textboxsignup" ID="AboutUsrTxt" runat="server" TextMode="MultiLine" Height="75px"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Button CssClass="buttonsignup" ID="SignUpBtn" runat="server" Text="Sign Up" ValidationGroup="SignUpVG" OnClick="SignUpBtn_Click" /><asp:Label ID="SignUpSuccessLbl" runat="server"></asp:Label></td>
            <td><asp:HyperLink ID="SignInRedirect" runat="server" Text="I already have an account" NavigateUrl="~/SignInPage.aspx" ForeColor="Wheat" ></asp:HyperLink></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="PPUplSuccessLbl" runat="server"></asp:Label></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Label ID="RedirectLbl" runat="server"></asp:Label></td>
        </tr>         
    </table>
    </form>
</body>
</html>
