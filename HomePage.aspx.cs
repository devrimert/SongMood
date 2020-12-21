using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            SignInHL.Visible = true;
            SignUpHL.Visible = true;
            ProfileHL.Visible = false;
            LogOutBtn.Visible = false;
        }
        else
        {
            UserNameLbl.Text = Session["UserName"].ToString();
            SignInHL.Visible = false;
            SignUpHL.Visible = false;
            ProfileHL.Visible = true;
            LogOutBtn.Visible = true;
        }
    }

    protected void HomePageRedirect(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True"))
        {
            conn.Open();
            string tsql = "SELECT SongName AS 'Song Name', SongArtist AS 'Artist', SongAlbum AS 'Album', SongYear AS 'Release Date', SongGenre AS 'Genre', EditorName AS 'Editor' FROM AllSongs WHERE SongMood LIKE '" + MoodsDDL.SelectedItem.Text + "'";
            SqlCommand cmd = new SqlCommand(tsql, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            SongData.DataSource = dt;
            SongData.DataBind();
            conn.Close();            
        }
    }
} 