using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showCourse();
            }
        }

        public void showCourse()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from course", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridCourse.DataSource = dr;
                gridCourse.DataBind();

            }
        }

        protected void btnSaveCourse(object sender, EventArgs e)
        {
            bool found = false;

            if (Page.IsValid)
            {
                if (txtCourseCode.Text == "" || txtCourseName.Text == "")
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");
                }
                else
                {

                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        SqlCommand courseExist = new SqlCommand();
                        courseExist.CommandText = "select * from [course]";
                        courseExist.Connection = con;
                        con.Open();
                        SqlDataReader rd = courseExist.ExecuteReader();
                        while (rd.Read())
                        {
                            if (rd[1].ToString() == txtCourseCode.Text.Trim() || rd[2].ToString() == txtCourseName.Text.Trim())
                            {
                                found = true;
                                break;
                            }
                        }
                        if (found == true)
                        {
                            Response.Write("<script>alert('Course already exists.');</script>");

                        }
                        con.Close();
                        if (found == false)
                        {
                            SqlCommand cmd = new SqlCommand("insert into course" + "(crsCode, crsName) values (@crsCode, @crsName)", con);

                            cmd.Parameters.AddWithValue("@crsCode", txtCourseCode.Text.Trim());
                            cmd.Parameters.AddWithValue("@crsName", txtCourseName.Text.Trim());
                            con.Open();
                            int t = cmd.ExecuteNonQuery();


                            Response.Write("<script>alert('New course added successfully')</script>");
                            con.Close();
                            showCourse();
                            txtCourseCode.Text = "";
                            txtCourseName.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

                    }
                }
            }
        }

        protected void btnResetCourse(object sender, EventArgs e)
        {
            txtCourseCode.Text = "";
            txtCourseName.Text = "";
        }

        protected void gridCourse_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridCourse.EditIndex = -1;
            showCourse();
        }

        protected void gridCourse_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridCourse.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from course where courseID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Course deleted successfully')</script>");
                gridCourse.EditIndex = -1;
                showCourse();
            }
        }

        protected void gridCourse_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridCourse.EditIndex = e.NewEditIndex;
            showCourse();
        }

        protected void gridCourse_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridCourse.DataKeys[e.RowIndex].Value.ToString());
            string courseCode = ((TextBox)gridCourse.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string cName = ((TextBox)gridCourse.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update course set crsCode='" + courseCode + "', crsName='" + cName + "' where courseID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Course updated successfully')</script>");
                gridCourse.EditIndex = -1;
                showCourse();
            }
        }

    }
}