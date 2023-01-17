using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Student
{
    public partial class ApplyLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Retrieve student data
                    string sql = "Select * from student where username= '" + Session["username"] + "'";
                    using (SqlCommand dmc = new SqlCommand(sql, con))
                    {
                        using (SqlDataReader dr = dmc.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                //string rNo = dr["rollNo"].ToString();
                                string name = dr["username"].ToString();
                                string cName = dr["className"].ToString();

                                //showRoll.Text = rNo;
                                showUname.Text = name;
                                showClass.Text = cName;
                            }
                        }
                    }
                }
            }
        }

        protected void dayDDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txtCal.Text == "" || txtReason.Text == "" || dayDDL.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('Data cannnot be empty')</script>");

                }
                else
                {
                    
                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        string rNo = showRoll.Text;
                        string name = Session["username"].ToString();
                        string cName = showClass.Text;
                        string cdate = txtCal.Text.ToString();
                        string reason = txtReason.Text.ToString();
                        string days = dayDDL.SelectedValue.ToString();
                        string sDate = DateTime.Now.ToString();

                        con.Open();
                        string query = @"insert into leave (username, className, date, message, noDays, sendDate) values (@username, @className, @date, @message, @noDays, @sendDate)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@username", name);
                        cmd.Parameters.AddWithValue("@className", cName);
                        cmd.Parameters.AddWithValue("@date", cdate);
                        cmd.Parameters.AddWithValue("@message", reason);
                        cmd.Parameters.AddWithValue("@noDays", days);
                        cmd.Parameters.AddWithValue("@sendDate", sDate);
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Submit Successfully')</script>");


                                multiview.ActiveViewIndex = -1;
                                txtCal.Text = "";
                                txtReason.Text = "";
                                dayDDL.SelectedIndex = 0;
                        
                        
                                       


                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
                
            }
                  

        }

        protected void btnNewLeave_Click(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 0;
        }

        protected void btnViewApprove_Click(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 1;

        }

        protected void multiview_ActiveViewChanged(object sender, EventArgs e)
        {

        }
        protected void imgCalendar_Click(object sender, ImageClickEventArgs e)
        {
            if (leaveCalendar.Visible)
            {
                leaveCalendar.Visible = false;

            }
            else
            {
                leaveCalendar.Visible = true;

            }

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtCal.Text = leaveCalendar.SelectedDate.ToShortDateString();
            leaveCalendar.Visible = false;
        }
    }
}