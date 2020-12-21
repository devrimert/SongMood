using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignInPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
            Response.Redirect("HomePage.aspx");
    }

    protected void SignInBtn_Click(object sender, EventArgs e)
    {
        bool check = false;
        string UserName, UserPassword;

        UserName = UserNameTxt.Text;
        UserPassword = PasswordTxt.Text;

        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
       
        conn.Open();
        string tsqlUsrChck = "SELECT UserName,UserPassword FROM RegisteredUsers";
        SqlCommand chckCmd = new SqlCommand(tsqlUsrChck, conn);
        SqlDataReader chckDR = chckCmd.ExecuteReader();

        while(chckDR.Read())
        {
            if(chckDR[0].ToString() == UserName && chckDR[1].ToString() == UserPassword)
            {
                check = true;
                SignInSuccessLbl.Text = "Succeded!";
                Response.AddHeader("Refresh", "3, url=ProfilePage.aspx");
                SignInRedirectLbl.Text = "You'are redirecting to your profile page...";
                Session["UserName"] = UserName;
            }
        }

        if(check == false)
        {
            SignInSuccessLbl.Text = "Wrong username or password!";
            Response.AddHeader("Refresh", "2, url = SignInPage.aspx");
        }

        conn.Close();
    }
}