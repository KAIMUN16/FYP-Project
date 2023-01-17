using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Homepage.aspx");
                }
            }
        }

        protected void btnUpdatePass(object sender, EventArgs e)
        {
            bool found = false;

            if (txtOldpass.Text == "" || txtNewpass.Text == "" || txtConpass.Text == "")
            {
                Response.Write("<script>alert('Please complete required field before submit')</script>");
            }
            else
            {
                if (txtNewpass.Text != txtConpass.Text)
                {
                    Response.Write("<script>alert('New password and confirm password must be match!')</script>");

                }
                else
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    //string uname = Session["username"].ToString();
                    string oldpass = txtOldpass.Text.Trim().ToString();
                    string newpass = txtNewpass.Text.Trim().ToString();
                    string conpass = txtConpass.Text.Trim().ToString();

                    con.Open();
                    string sql = "select * from staff where username='" + Session["username"] + "'";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        if (txtOldpass.Text == dr["password"].ToString())
                        {
                            found = true;

                        }
                    }
                    dr.Close();
                    con.Close();


                    if (found == true)
                    {
                        con.Open();
                        string query = "Update staff set password= '" + newpass + "' where username='" + Session["username"].ToString() + "'";
                        SqlCommand dmc = new SqlCommand(query, con);
                        dmc.Parameters.AddWithValue("@password", newpass);
                        dmc.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Your password updated successfully')</script>");
                        txtOldpass.Text = "";
                        txtNewpass.Text = "";
                        txtConpass.Text = "";

                    }
                    else
                    {
                        Response.Write("<script>alert('Old password is incorrect')</script>");
                    }


                }

            }
        }

        protected void btnResetAll(object sender, EventArgs e)
        {
            txtOldpass.Text = "";
            txtNewpass.Text = "";
            txtConpass.Text = "";
        }
    }
}