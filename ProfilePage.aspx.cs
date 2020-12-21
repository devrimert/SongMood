using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("SignInWarningPage.aspx");
        else
            UserNameLbl.Text = Session["UserName"].ToString();

        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();
        string tsqlUsrInfo = "SELECT UserProfilePicture,Name,Surname,City,Phone,About FROM RegisteredUsers WHERE UserName LIKE '" + UserNameLbl.Text + "'";
        SqlCommand usrInfoCmd = new SqlCommand(tsqlUsrInfo, conn);
        SqlDataReader usrInfoDR = usrInfoCmd.ExecuteReader();

        while (usrInfoDR.Read())
        {
            ProfilePicture.ImageUrl = "UserPictures/" + usrInfoDR[0].ToString() + ".jpeg";
            Session["ProfilePicture"] = ProfilePicture.ImageUrl;
            NameLbl.Text = usrInfoDR[1].ToString();
            Session["RealName"] = NameLbl.Text;
            SurnameLbl.Text = usrInfoDR[2].ToString();
            Session["RealSurname"] = SurnameLbl.Text;
            CityLbl.Text = usrInfoDR[3].ToString();
            Session["City"] = CityLbl.Text;
            PhoneLbl.Text = usrInfoDR[4].ToString();
            Session["Phone"] = PhoneLbl.Text;
            AboutLbl.Text = usrInfoDR[5].ToString();
            Session["About"] = AboutLbl.Text;
        }
        conn.Close();

        conn.Open();
        string tsqlShowPersonalSongs = "SELECT SongName AS 'Song Name', SongArtist AS 'Artist', SongAlbum 'Album', SongYear AS 'Release Date', SongGenre AS 'Genre', SongMood AS 'Mood' FROM AllSongs WHERE EditorName = '" + Session["UserName"] + "'";
        SqlCommand showSongCmd = new SqlCommand(tsqlShowPersonalSongs, conn);
        SqlDataAdapter sqlDA = new SqlDataAdapter();
        sqlDA.SelectCommand = showSongCmd;
        DataTable sqlDT = new DataTable();
        sqlDA.Fill(sqlDT);
        PersonalSongsGV.DataSource = sqlDT;
        PersonalSongsGV.DataBind();
    }

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void InfoUpdateBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("InfoUpdatePage.aspx");
    }

    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("HomePage.aspx");
    }
}