using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                attCalendar.Visible = false;
                btnaddatt.Visible = false;
                lblTimer.Text = DateTime.Now.ToLongDateString().ToString() + " " + DateTime.Now.ToShortDateString().ToString();
            }
            
        }

        protected void btnSearchClass(object sender, EventArgs e)
        {
            attCalendar.Visible = false;
            btnaddatt.Visible = false;
            try
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    string cddl = classDDL.SelectedValue.ToString();

                    con.Open();
                    string query = "select rollNo, username, className from student where className like '" + cddl + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gridAttClass.DataSource = ds;
                    gridAttClass.DataBind();

                    attCalendar.Visible = true;

                    btnaddatt.Visible = true;

                    multiviewClass.ActiveViewIndex = 0;
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
                }
            }

        protected void multiviewClass_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void classDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gridAttClass_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void attCalendar_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddAtt(object sender, EventArgs e)
        {
            bool found = false;

            foreach (GridViewRow row in gridAttClass.Rows)
                    {
                        string rollNo = row.Cells[1].Text.ToString();
                        string stuName = row.Cells[2].Text.ToString();
                        string stuClass = row.Cells[3].Text.ToString();
                        RadioButton rP = (row.Cells[0].FindControl("radioPresent") as RadioButton);
                        RadioButton rA = (row.Cells[0].FindControl("radioAbsence") as RadioButton);
                        RadioButton rL = (row.Cells[0].FindControl("radioLeave") as RadioButton);
                        string attDate = attCalendar.SelectedDate.Date.GetDateTimeFormats()[8].ToString();
                        string stfname = Session["username"].ToString();
                        //RadioButtonList status = (row.Cells[0].FindControl("radioStatus") as RadioButtonList);
                        // save status into database based on radiobutton click
                        string status = string.Empty;

                        if (rP.Checked)
                        {
                            status = "Present";
                        }
                        if (rA.Checked)
                        {
                            status = "Absence";
                        }
                        if (rL.Checked)
                        {
                            status = "Leave";
                        }

                        if (status != "" && attDate != "Monday, 1 January, 0001 12:00 AM")
                        {
                            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                            con.Open();
                            string query = "select username from attendance where username='"+ stuName +"' AND date= '"+attDate+"'";
                            SqlCommand dmc = new SqlCommand(query, con);
                    

                            using (SqlDataReader dr = dmc.ExecuteReader())
                            {
                                //if database got record then update
                                if (dr.HasRows)
                                {
                                    string sql = "Update attendance set status= '" + status + "' where username= '"+ stuName +"' AND date= '"+ attDate +"'";

                                    SqlCommand cmd = new SqlCommand(sql, con);

                                    cmd.Parameters.AddWithValue("@rollNo", rollNo);
                                    cmd.Parameters.AddWithValue("@username", stuName);
                                    cmd.Parameters.AddWithValue("@class", stuClass);
                                    cmd.Parameters.AddWithValue("@status", status.ToString());
                                    cmd.Parameters.AddWithValue("@date", attDate);
                                    cmd.Parameters.AddWithValue("@staffName", stfname.ToString());
                                    dr.Close();
                                    cmd.ExecuteNonQuery();

                                    //close multiview & view
                                    multiviewClass.ActiveViewIndex = -1;
                                    found = true;
                                }
                                else
                                {
                                    //when database empty then insert
                                    string sql = "insert into attendance values('" + rollNo + "', '" + stuName + "', '" + stuClass + "', '" + status + "', '" + attDate + "', '" + stfname + "')";
                                    SqlCommand cmd = new SqlCommand(sql, con);

                                    cmd.Parameters.AddWithValue("@rollNo", rollNo);
                                    cmd.Parameters.AddWithValue("@username", stuName);
                                    cmd.Parameters.AddWithValue("@class", stuClass);
                                    cmd.Parameters.AddWithValue("@status", status.ToString());
                                    cmd.Parameters.AddWithValue("@date", attDate);
                                    cmd.Parameters.AddWithValue("@staffName", stfname.ToString());
                                    dr.Close();
                                    cmd.ExecuteNonQuery();

                                    //close multiview & view
                                    multiviewClass.ActiveViewIndex = -1;
                                    found = true;
                                }
                            con.Close();
                        }
                   }     
            }
            //if found from database then alert msg, else mean that not found 
            if (found == true)
            {
                Response.Write("<script>alert('Attendance saved successfully')</script>");

            }
            else
            {
                Response.Write("<script>alert('Something went wrong... Please try again')</script>");

            }


        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //show date & time
            lblTime.Text = DateTime.Now.ToString();
        }

        protected void gridAttClass_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}




