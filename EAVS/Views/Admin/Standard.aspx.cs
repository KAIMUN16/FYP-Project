using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class Standard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showStandard();
            }
        }

        public void showStandard()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from standard", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridStandard.DataSource = dr;
                gridStandard.DataBind();

            }
        }

        void clear()
        {
            txtstandardName.Text = "";

        }
        protected void btnSaveStandard(object sender, EventArgs e)
        {
            bool found = false;


            if (Page.IsValid)
            {
                if (txtstandardName.Text == "")
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");

                }
                else
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                        SqlCommand standExist = new SqlCommand();
                        standExist.CommandText = "select * from [standard]";
                        standExist.Connection = con;
                        con.Open();
                        SqlDataReader rd = standExist.ExecuteReader();
                        while (rd.Read())
                        {
                            if (rd[1].ToString() == txtstandardName.Text.Trim())
                            {
                                found = true;
                                break;
                            }
                        }
                        if (found == true)
                        {
                            Response.Write("<script>alert('Standard already exists.');</script>");

                        }
                        con.Close();
                        if (found == false)
                        {
                            SqlCommand cmd = new SqlCommand("insert into standard" + "(standName) values (@standName)", con);
                            cmd.Parameters.AddWithValue("@standName", txtstandardName.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Write("<script>alert('New standard added successfully')</script>");
                            showStandard();
                            txtstandardName.Text = "";
                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

                    }
                }
            }
        }

        protected void btnResetStandard(object sender, EventArgs e)
        {
            clear();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void gridStandard_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridStandard.EditIndex = -1;
            showStandard();
        }

        protected void gridStandard_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridStandard.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from standard where standID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Deleted Successfully')</script>");
                gridStandard.EditIndex = -1;
                showStandard();
            }
        }

        protected void gridStandard_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridStandard.EditIndex = e.NewEditIndex;
            showStandard();
        }

        protected void gridStandard_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridStandard.DataKeys[e.RowIndex].Value.ToString());
            string sName = ((TextBox)gridStandard.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update standard set standName='" + sName + "' where standID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Standard updated Successfully')</script>");
                gridStandard.EditIndex = -1;
                showStandard();
            }
        }
    }
}