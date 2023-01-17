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
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showStudent();
            }
        }

        public void showStudent()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from student", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridStudent.DataSource = dr;
                gridStudent.DataBind();

            }
        }

        protected void btnAddStu(object sender, EventArgs e)
        {
            bool found = false;

            if (Page.IsValid)
            {
                if (txtStuRoll.Text == "" || txtStuName.Text == "" || txtStuEmail.Text == "" || txtStuUname.Text == "" || txtStuPass.Text == "" || stuYear.SelectedItem == null || stuClassDDL.SelectedValue == null)
                {
                    Response.Write("<script>alert('Data cannnot be empty')</script>");

                }
                else
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    SqlCommand courseExist = new SqlCommand();
                    courseExist.CommandText = "select * from [student]";
                    courseExist.Connection = con;
                    con.Open();
                    SqlDataReader rd = courseExist.ExecuteReader();
                    while (rd.Read())
                    {
                        if (rd[1].ToString() == txtStuRoll.Text.Trim() || rd[6].ToString() == txtStuEmail.Text.Trim() || rd[7].ToString() == txtStuUname.Text.Trim())
                        {
                            found = true;
                            break;

                        }
                    }


                    if (found == true)
                    {
                        Response.Write("<script>alert('Details already used by other student. Please use other details.');</script>");
                    }
                    con.Close();
                    if (found == false)
                    {
                        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        string roll = txtStuRoll.Text.Trim();
                        string name = txtStuName.Text.Trim();
                        string email = txtStuEmail.Text.Trim();
                        string year = stuYear.SelectedItem.Text;
                        string stuClass = stuClassDDL.SelectedValue.ToString();


                        string facNa = stuFacDDL.SelectedValue;
                        string uname = txtStuUname.Text.Trim();
                        string pass = txtStuPass.Text.Trim();

                        string sql = @"insert into student (rollNo, name, email, year, facName, className, username, password) values (@rollNo, @name, @email, @year, @facName, @className, @username, @password)";
                        SqlCommand cmd = new SqlCommand(sql, con);

                        cmd.Parameters.AddWithValue("@rollNo", roll);

                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@year", year);
                        cmd.Parameters.AddWithValue("@facName", facNa);
                        cmd.Parameters.AddWithValue("@className", stuClass);

                        cmd.Parameters.AddWithValue("@username", uname);
                        cmd.Parameters.AddWithValue("@password", pass);
                        con.Open();


                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('New student " + name + " added successfully')</script>");
                        showStudent();
                        txtStuRoll.Text = "";
                        txtStuName.Text = "";
                        txtStuEmail.Text = "";
                        stuYear.SelectedIndex = 0;
                        stuFacDDL.SelectedIndex = 0;
                        txtStuEmail.Text = "";
                        txtStuUname.Text = "";
                        txtStuPass.Text = "";
                    }
                }
            }

        }

        protected void btnResetStu(object sender, EventArgs e)
        {
            txtStuRoll.Text = "";
            txtStuName.Text = "";
            txtStuEmail.Text = "";
            stuYear.SelectedIndex = 0;
            stuFacDDL.SelectedIndex = 0;
            txtStuEmail.Text = "";
            txtStuUname.Text = "";
            txtStuPass.Text = "";
        }

        protected void gridStudent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridStudent.EditIndex = -1;
            showStudent();
        }

        protected void gridStudent_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridStudent.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from student where studentID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Student has been deleted successfully')</script>");
                gridStudent.EditIndex = -1;
                showStudent();
            }
        }

        protected void gridStudent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridStudent.EditIndex = e.NewEditIndex;
            showStudent();
        }

        protected void gridStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridStudent.DataKeys[e.RowIndex].Value.ToString());
            TextBox sRoll = ((TextBox)gridStudent.Rows[e.RowIndex].Cells[1].FindControl("editRoll")) as TextBox;
            TextBox sName = ((TextBox)gridStudent.Rows[e.RowIndex].Cells[2].FindControl("editName")) as TextBox;
            DropDownList sFac = gridStudent.Rows[e.RowIndex].Cells[3].FindControl("editFacddl") as DropDownList;
            DropDownList sClass = gridStudent.Rows[e.RowIndex].Cells[4].FindControl("editClassddl") as DropDownList;
            DropDownList year = gridStudent.Rows[e.RowIndex].Cells[5].FindControl("editYearddl") as DropDownList;
            TextBox sEmail = ((TextBox)gridStudent.Rows[e.RowIndex].Cells[6].FindControl("editEmail")) as TextBox;
            TextBox suname = ((TextBox)gridStudent.Rows[e.RowIndex].Cells[7].FindControl("editUname")) as TextBox;
            String stuName = sName.Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update student set rollNo='"+ sRoll.Text+ "', name='" + stuName + "',email='" + sEmail.Text + "', year='"+ year.SelectedItem.Value.ToString() +"' , className='" + sClass.SelectedItem.Value.ToString() + "', facName='" + sFac.SelectedItem.Value.ToString() + "', username='" + suname.Text + "' where studentID='" + id + "'", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Student data has been updated successfully')</script>");
            gridStudent.EditIndex = -1;
            showStudent();
        }

        protected void gridStudent_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridStudent_PageIndexChanged(object sender, EventArgs e)
        {

        }
    }
}