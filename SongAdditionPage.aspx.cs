using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SongAdditionPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("SignInWarningPage.aspx");
        else
            UserNameLbl.Text = Session["UserName"].ToString();
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

    protected void SaveSongBtn_Click(object sender, EventArgs e)
    {
        bool check = false;
        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();

        string tsqlSongCheck = "SELECT SongName,SongArtist FROM AllSongs";
        SqlCommand songAddCmd = new SqlCommand(tsqlSongCheck, conn);
        SqlDataReader songDR = songAddCmd.ExecuteReader();

        while(songDR.Read())
        {
            if(songDR[0].ToString() == SongNameTB.Text && songDR[1].ToString() == ArtistNameTB.Text)
            {                
                SaveSuccessLbl.Text = "This song is already in the database!";
                Response.AddHeader("Refresh", "2, url = SongAdditionPage.aspx");
                check = false;
            }
            else
            {
                check = true;
            }
        }
        conn.Close();

        if (check == true)
        {
            conn.Open();
            string tsqlAddSong = "INSERT INTO AllSongs VALUES('" + SongNameTB.Text + "', '" + ArtistNameTB.Text + "', '" + AlbumNameTB.Text + "', '" + ReleaseDateTB.Text + "', '" + GenreTB.Text + "', '" + Session["UserName"].ToString() + "', '" + SongMoodDDL.SelectedItem.ToString() + "')";
            songAddCmd = new SqlCommand(tsqlAddSong, conn);
            songAddCmd.ExecuteNonQuery();
            SaveSuccessLbl.Text = "Succeded! Thanks for your collaboration";
            Response.AddHeader("Refresh", "3, url = SongAdditionPage.aspx");
            conn.Close();
        }        
    }
}