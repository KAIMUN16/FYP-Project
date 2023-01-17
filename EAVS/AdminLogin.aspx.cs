using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace EAVS
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogincheck(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["password"] == null)
            {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    SqlCommand cmd = new SqlCommand("SELECT * from admin where username=@username and password=@password", con);
                    cmd.Parameters.AddWithValue("@username", txtUname.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPwd.Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        Session["username"] = txtUname.Text.Trim();
                        Session["password"] = txtPwd.Text.Trim();
                        Response.Write("Login Successfully! Welcome '" + txtUname.Text + "'");
                        Response.Redirect("~/Views/Admin/AdminDashboard.aspx");
                        Session.RemoveAll();
                    }
                    else
                    {
                        msgLogin.Text = "You're username and password is incorrect";
                        msgLogin.ForeColor = System.Drawing.Color.Red;
                        msgLogin.Text += "<script>setTimeout(function(){window.location = '../Homepage.aspx';}, 3000);</script>";
                    }

            }else
            {
                Response.Redirect("Homepage.aspx");
            }

        }
    }
}