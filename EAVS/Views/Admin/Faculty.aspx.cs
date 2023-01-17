using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class Faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showFaculty();
            }
        }

        public void showFaculty()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from faculty", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridFaculty.DataSource = dr;
                gridFaculty.DataBind();

            }
        }


        protected void btnSaveHall(object sender, EventArgs e)
        {
            bool found = false;

            if (Page.IsValid)
            {
                if (txtFacultyName.Text == "")
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");
                }
                else
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        SqlCommand facExist = new SqlCommand();
                        facExist.CommandText = "select * from [faculty]";
                        facExist.Connection = con;
                        con.Open();
                        SqlDataReader rd = facExist.ExecuteReader();
                        while (rd.Read())
                        {
                            if (rd[1].ToString() == txtFacultyName.Text.Trim())
                            {
                                found = true;
                                break;
                            }
                        }
                        if (found == true)
                        {
                            Response.Write("<script>alert('Faculty already exists.');</script>");

                        }
                        con.Close();
                        if (found == false)
                        {
                            SqlCommand cmd = new SqlCommand("insert into faculty" + "(facName) values (@facName)", con);
                            cmd.Parameters.AddWithValue("@facName", txtFacultyName.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();


                            Response.Write("<script>alert('New faculty added successfully')</script>");
                            showFaculty();
                            txtFacultyName.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        
                        Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

                    }
                }
            }
        }



        protected void btnResetFaculty(object sender, EventArgs e)
        {
            txtFacultyName.Text = "";
        }

        protected void gridFaculty_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridFaculty.EditIndex = e.NewEditIndex;
            showFaculty();
        }

        protected void gridFaculty_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridFaculty.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from faculty where facultyID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Faculty deleted successfully')</script>");
                gridFaculty.EditIndex = -1;
                showFaculty();
            }
        }
    

        protected void gridFaculty_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridFaculty.EditIndex = -1;
            showFaculty();
        }

        protected void gridFaculty_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridFaculty.DataKeys[e.RowIndex].Value.ToString());
            string fName = ((TextBox)gridFaculty.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update faculty set facName='" + fName + "' where facultyID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Faculty updated successfully')</script>");
                gridFaculty.EditIndex = -1;
                showFaculty();
            }

        }

    }
}