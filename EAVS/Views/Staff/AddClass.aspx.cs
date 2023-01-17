using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class AddClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showClass();
            }
        }

        public void showClass()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from class", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridClass.DataSource = dr;
                gridClass.DataBind();

            }
        }

        protected void btnSaveClass(object sender, EventArgs e)
        {
            bool found = false;

            if (Page.IsValid)
            {
                if (txtClassName.Text == "")
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");
                }
                else
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        SqlCommand standExist = new SqlCommand();
                        standExist.CommandText = "select * from [class]";
                        standExist.Connection = con;
                        con.Open();
                        SqlDataReader rd = standExist.ExecuteReader();
                        while (rd.Read())
                        {
                            if (rd[1].ToString() == txtClassName.Text.Trim())
                            {
                                found = true;
                                break;
                            }
                        }
                        if (found == true)
                        {
                            Response.Write("<script>alert('Class already exists.');</script>");

                        }
                        con.Close();
                        if (found == false)
                        {
                            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                            SqlCommand cmd = new SqlCommand("insert into class" + "(className) values (@className)", con);
                            cmd.Parameters.AddWithValue("@className", txtClassName.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();


                            Response.Write("<script>alert('New class added Successfully')</script>");
                            showClass();
                            txtClassName.Text = "";
                        }


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
                    }
                }
            }
        }

        protected void btnResetClass(object sender, EventArgs e)
        {
            txtClassName.Text = "";
        }

        protected void gridClass_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridClass.EditIndex = -1;
            showClass();
        }

        protected void gridClass_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridClass.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from class where classID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Class deleted successfully')</script>");
                gridClass.EditIndex = -1;
                showClass();
            }
        }

        protected void gridClass_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridClass.EditIndex = e.NewEditIndex;
            showClass();
        }

        protected void gridClass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridClass.DataKeys[e.RowIndex].Value.ToString());
            string cName = ((TextBox)gridClass.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update class set className='" + cName + "' where classID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Class updated successfully')</script>");
                gridClass.EditIndex = -1;
                showClass();
            }
        }


    }
}