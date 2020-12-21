using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUpPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void HomePage(object sender, ImageClickEventArgs e)
    {
            Response.Redirect("HomePage.aspx");
    }

    protected void PPUpload_Click(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
                        string tsqlCompare = "INSERT INTO RegisteredUsers ('UserProfilePicture') VALUES('" + picName + "')";
                        SqlCommand compareCmd = new SqlCommand(tsqlCompare, conn);
                        compareCmd.ExecuteNonQuery();
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
    }
        

    protected void SignUpBtn_Click(object sender, EventArgs e)
    {
        bool chck = false;
        string usrName = UserNameTxt.Text;
        string usrPass = PasswordTxt.Text;
        string usrPassChck = PasswordChckTxt.Text;
        string realName = NameTxt.Text;
        string realSurname = SurnameTxt.Text;
        string city = CityTxt.Text;
        string phone = PhoneTxt.Text;
        string aboutUsr = AboutUsrTxt.Text;
        string secretQstn = secretQuesDDL.SelectedValue.ToString();
        string secretAnswr = secretAnswrTxt.Text;

        SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\enver\Desktop\Final Version of SongMood\SongMood\App_Data\SongMood.mdf; Integrated Security = True");
        conn.Open();
        string tsqlCompare = "SELECT UserName FROM RegisteredUsers";
        SqlCommand compareCmd = new SqlCommand(tsqlCompare, conn);
        SqlDataReader compareRD = compareCmd.ExecuteReader();

        while (compareRD.Read())
        {
            if (compareRD[0].ToString() == usrName)
            {
                chck = true;
                SignUpSuccessLbl.Text = "This username has already taken!";
                Response.AddHeader("Refresh", "2, url = SignUpPage.aspx");
            }
        }

        if (chck == false)
        {
            DataTable dt = new DataTable();
            {
                string tsql = "INSERT INTO RegisteredUsers (UserName, UserPassword, SecretQuestion, SecretAnswer, Name, Surname, City, Phone, About) " +
                    "VALUES (@usrName, @usrPass, @secretQstn, @secretAnswr, @realName, @realSurname, @city, @phone, @aboutUsr)";
                SqlCommand cmd = new SqlCommand(tsql, conn);
                cmd.Parameters.AddWithValue("@usrName", usrName);
                cmd.Parameters.AddWithValue("@usrPass", usrPass);
                cmd.Parameters.AddWithValue("@secretQstn", secretQstn);
                cmd.Parameters.AddWithValue("@secretAnswr", secretAnswr);
                cmd.Parameters.AddWithValue("@realName", realName);
                cmd.Parameters.AddWithValue("@realSurname", realSurname);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@aboutUsr", aboutUsr);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                conn.Close();
                da.Fill(dt);
                SignUpSuccessLbl.Text = "Sign up secceded!";
                Response.AppendHeader("Refresh", "3; url = SignInPage.aspx");
                RedirectLbl.Text = "Redirecting to the Sign In Page...";
            }
        }
    conn.Close();
    }
}