using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PasswordResetPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void resetPassBtn_Click(object sender, EventArgs e)
    {
        bool chck = false;
        string usrNameChck = UserNameChckTB.Text;
        string secretQRecover = secretQDDL.SelectedValue.ToString();
        string secretARecover = secretATxt.Text;

        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();
        string tsqlCommpare = "SELECT UserName,SecretQuestion,SecretAnswer FROM RegisteredUsers";
        SqlCommand compareCmd = new SqlCommand(tsqlCommpare, conn);
        SqlDataReader compareDR = compareCmd.ExecuteReader();

        while (compareDR.Read())
        {
            if (compareDR[0].ToString() == usrNameChck && compareDR[1].ToString() == secretQRecover && compareDR[2].ToString() == secretARecover)
            {
                chck = true;
                ResetSuccessLbl.Text = "Succeded!";
                Session["PageCheck"] = "Pass!";
                Session["UserNameCheck"] = usrNameChck;
                Response.AddHeader("Refresh", "2, url = NewPasswordPage.aspx");
                ResetRedirectLbl.Text = "Redirecting to new password page...";                               
            }
        }

        if (chck == false)
        {
            ResetSuccessLbl.Text = "Wrong username, secret question or secret answer!";
            Response.AddHeader("Refresh", "2, url = PasswordResetPage.aspx");
        }
    }
}