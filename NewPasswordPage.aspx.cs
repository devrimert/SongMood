using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewPasswordPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PageCheck"] == null)
            Response.Redirect("SignInWarningPage.aspx");
    }

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void PassChangeBtn_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();

        string tsqlNewPass = "UPDATE RegisteredUsers SET UserPassword = '" + NewPassTB.Text + "' WHERE UserName = '" + Session["UserNameCheck"] + "'";
        SqlCommand passChckCmd = new SqlCommand(tsqlNewPass, conn);
        passChckCmd.ExecuteNonQuery();

        PassChangeSuccessLbl.Text = "Succeded!";
        RedirectionLbl.Text = "Redirecting to Sign in page...";
        Response.AddHeader("Refresh", "3, url = SignInPage.aspx");

        conn.Close();
    }
}