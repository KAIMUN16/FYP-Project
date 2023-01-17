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
    public partial class MasterViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
                string sql = "select * from " + showdatagrid.SelectedItem.Text;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (showdatagrid.SelectedItem.Text == "Standard")
                {
                    gridStandard.Visible = true;
                    gridStudent.Visible = false;
                    gridFac.Visible = false;
                    gridStaff.Visible = false;
                    gridLeave.Visible = false;

                    gridStandard.DataSource = dt;
                    gridStandard.DataBind();
                }
                else if (showdatagrid.SelectedItem.Text == "Student")
                {
                    gridStandard.Visible = false;
                    gridStudent.Visible = true;
                    gridFac.Visible = false;
                    gridStaff.Visible = false;
                    gridLeave.Visible = false;

                    gridStudent.DataSource = dt;
                    gridStudent.DataBind();
                }
                else if (showdatagrid.SelectedItem.Text == "Faculty")
                {
                    gridStandard.Visible = false;
                    gridStudent.Visible = false;
                    gridFac.Visible = true;
                    gridStaff.Visible = false;
                    gridLeave.Visible = false;
                    gridFac.DataSource = dt;
                    gridFac.DataBind();
                }
                else if (showdatagrid.SelectedItem.Text == "Leave")
                {
                    //leave
                    gridStandard.Visible = false;
                    gridStudent.Visible = false;
                    gridFac.Visible = false;
                    gridStaff.Visible = false;
                    gridLeave.Visible = true;
                    gridLeave.DataSource = dt;
                    gridLeave.DataBind();
                }
                
                else
                {
                    //staff
                    gridStandard.Visible = false;
                    gridStudent.Visible = false;
                    gridFac.Visible = false;
                    gridLeave.Visible = false;
                    gridStaff.Visible = true;
                    gridStaff.DataSource = dt;
                    gridStaff.DataBind();
                }

                con.Close();
            }
        }

        protected void gridStandard_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridStandard.EditIndex = -1;
        }

        protected void gridStandard_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridStandard.Rows[e.RowIndex];
            int standID = Convert.ToInt32(gridStandard.DataKeys[e.RowIndex].Values[0]);
            string standname = (row.Cells[2].Controls[0] as TextBox).Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            string sql = "UPDATE standard SET standName=@standName WHERE standID=@standID";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@standID",standID);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void gridStandard_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridStandard.EditIndex = e.NewEditIndex;
        }

        protected void gridStandard_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridStandard.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            //string sql = "DELETE from standard WHERE standID=@standID";

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from standard where standID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Standard deleted successfully')</script>");
                gridStandard.EditIndex = -1;
            }
        }
    }
}