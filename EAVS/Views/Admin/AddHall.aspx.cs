using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class AddHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showHall();
            }
        }

        public void showHall()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from examHall", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridHall.DataSource = dr;
                gridHall.DataBind();

            }
        }

        protected void btnSaveHall(object sender, EventArgs e)
        {
            bool found = false;

            if (Page.IsValid)
            {
                if (txtHallName.Text == "")
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");
                }
                else
                {

                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        SqlCommand hallExist = new SqlCommand();
                        hallExist.CommandText = "select * from [examHall]";
                        hallExist.Connection = con;
                        con.Open();
                        SqlDataReader rd = hallExist.ExecuteReader();
                        while (rd.Read())
                        {
                            if (rd[1].ToString() == txtHallName.Text.Trim())
                            {
                                found = true;
                                break;
                            }
                        }
                        if (found == true)
                        {
                            Response.Write("<script>alert('Exam hall already exists.');</script>");

                        }
                        con.Close();
                        if (found == false)
                        {
                            SqlCommand cmd = new SqlCommand("insert into examHall" + "(hallName) values (@hallName)", con);

                            cmd.Parameters.AddWithValue("@hallName", txtHallName.Text.Trim());
                            con.Open();
                            int t = cmd.ExecuteNonQuery();


                            Response.Write("<script>alert('New hall added successfully')</script>");
                            con.Close();
                            showHall();
                            txtHallName.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

                    }
                }
            }
        }

        protected void btnResetHall(object sender, EventArgs e)
        {
            txtHallName.Text = "";

        }

        protected void gridHall_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridHall.EditIndex = -1;
            showHall();
        }

        protected void gridHall_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridHall.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from examHall where hallID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Exam hall deleted successfully')</script>");
                gridHall.EditIndex = -1;
                showHall();
            }
        }

        protected void gridHall_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridHall.EditIndex = e.NewEditIndex;
            showHall();
        }

        protected void gridHall_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridHall.DataKeys[e.RowIndex].Value.ToString());
            string hName = ((TextBox)gridHall.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update examHall set hallName='" + hName + "' where hallID ='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Exam hall updated successfully')</script>");
                gridHall.EditIndex = -1;
                showHall();
            }
        }

        protected void gridHall_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}