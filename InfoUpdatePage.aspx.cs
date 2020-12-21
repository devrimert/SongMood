using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InfoUpdatePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("SignInWarningPage.aspx");
        else if(!IsPostBack)
        {
            ProfilePicture.ImageUrl = Session["ProfilePicture"].ToString();
            UsrInfoNameTB.Text = Session["RealName"].ToString();
            UsrInfoSurnameTB.Text = Session["RealSurname"].ToString();
            UsrInfoCityTB.Text = Session["City"].ToString();
            UsrInfoPhoneTB.Text = Session["Phone"].ToString();
            UsrInfoAbout.Text = Session["About"].ToString();
            UserNameLbl.Text = Session["UserName"].ToString();
        }
        
    }

    protected void PPUpload_Click(object sender, EventArgs e)
    {
            if (ProfilePictureUpload.HasFile)
            {
                if (ProfilePictureUpload.PostedFile.ContentType == "image/jpeg")
                {
                    if (ProfilePictureUpload.PostedFile.ContentLength < 1024000)
                    {
                        string picName = Guid.NewGuid().ToString();
                        ProfilePictureUpload.SaveAs(Server.MapPath("~/UserPictures/") + picName + ".jpeg");
                        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
                        conn.Open();
                        string tsqlPPUpdate = "UPDATE RegisteredUsers SET UserProfilePicture = '" + picName + "' WHERE UserName = '" + Session["UserName"].ToString() + "'";
                        SqlCommand ppUptCmd = new SqlCommand(tsqlPPUpdate, conn);
                        ppUptCmd.ExecuteNonQuery();
                        conn.Close();
                        PPUplSuccessLbl.Text = "File has uploaded.";
                    }
                    else
                        PPUplSuccessLbl.Text = "File size can not exceed over 1MB.";
                }
                else
                    PPUplSuccessLbl.Text = "Only files with jpeg extension can be updated!";
            }
            else
                PPUplSuccessLbl.Text = "Please choose a picture.";
    }
        

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("HomePage.aspx");
    }

    protected void SaveChangesBtn_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();
        string tsqlInfoUpdate = "UPDATE RegisteredUsers SET Name = '" + UsrInfoNameTB.Text.ToString() + "', Surname = '" + UsrInfoSurnameTB.Text.ToString() + "', City = '" + UsrInfoCityTB.Text.ToString() + "', Phone = '" + UsrInfoPhoneTB.Text.ToString() + "', About = '" + UsrInfoAbout.Text.ToString() + "' WHERE UserName = '" + Session["UserName"].ToString() + "'";
        SqlCommand usrInfoUpdateCmd = new SqlCommand(tsqlInfoUpdate, conn);
        SqlDataReader usrInfoUpdateDR = usrInfoUpdateCmd.ExecuteReader();
        InfoChangeSuccessLbl.Text = "You have changed/updated your infos successfully";

        conn.Close();
    }
}