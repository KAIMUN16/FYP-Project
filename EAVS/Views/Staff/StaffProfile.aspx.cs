using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class StaffProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                /*
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
                bool found = false;

                string id = Request.QueryString["staffID"] ?? "";

                string sql = "SELECT * FROM staff WHERE staffID = @staffID";


                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@staffID", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    found = true;
                    lblID.Text = (string)dr["staffID"];
                    txtName.Text = (string)dr["name"];
                    lblStd.Text = (string)dr["standName"];
                    lblFac.Text = (string)dr["facName"];
                    txtEmail.Text = (string)dr["email"];
                    txtQua.Text = (string)dr["qualification"];
                    txtUname.Text = (string)dr["username"];
                    txtPass.Text = (string)dr["password"];

                }
                dr.Close();
                con.Close();
                */
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Homepage.aspx");
                }
                //ScriptManager.GetCurrent(this).RegisterPostBackControl(this.btnUpload);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
                con.Open();
                if (uploadNew.HasFile)
                {
                    string imgPath = Path.GetExtension(uploadNew.PostedFile.FileName);
                    if (imgPath != ".jpg" && imgPath != ".jpeg" && imgPath != ".png" && imgPath != ".gif")
                    {
                        Response.Write("<script>alert('Only Image type .jpg, .jpeg, .png, .gif allowed')</script>");
                    }
                    else
                    {
                        int fileSize = uploadNew.PostedFile.ContentLength;
                        // no more than 10mb                    
                        if (fileSize > 10485760)
                        {
                            Response.Write("<script>alert('Maximum file size (10mb) exceeded')</script>");
                        }
                        else
                        {
                            string fileImg = Path.GetFileName(uploadNew.PostedFile.FileName);
                            string filePath = "../../StaffPhoto/" + fileImg;
                            uploadNew.SaveAs(Server.MapPath(filePath));
                            string uname = Session["username"].ToString();
                            SqlCommand cmd = new SqlCommand("Update staff set profilePicture='" + fileImg + "' where username='" + uname + "'", con);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    Response.Write("<script>alert('New profile photo has been updated successfully')</script>");


                }
                else
                {
                    Response.Write("<script>alert('Please choose photo before submit')</script>");
                }
            }
                
               
            
        }
    }
}