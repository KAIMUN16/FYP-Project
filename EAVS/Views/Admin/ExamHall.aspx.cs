using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class ExamHall : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {  
                showHall();
                
            }

        }

        

        protected void showHall()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();

            SqlCommand cmd = new SqlCommand("select * from ExamHall", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridExamHall.DataSource = dr;
                gridExamHall.DataBind();
                
            }
            
        }

        protected void btnSaveHall(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into examHall"+"(hallID, hallName) values (@hallID, @hallName)",con);
            cmd.Parameters.AddWithValue("@hallID", txtHallID.Text);
            cmd.Parameters.AddWithValue("@hallName", txtHallName.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            lblErr.Text = "Added Successfully!";
            showHall();
            txtHallID.Text = "";
            txtHallName.Text = "";

        }


        int Key = 0;

        protected void gridExamHall_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtHallID.Text = gridExamHall.SelectedRow.Cells[2].Text;
            txtHallName.Text = gridExamHall.SelectedRow.Cells[3].Text;

            if (txtHallID.Text == "" || txtHallName.Text == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(gridExamHall.SelectedRow.Cells[1].Text);
                
            }
        }

        protected void gridExamHall_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            string sql = "Delete From examHall Where hallID=@hallID, hallName = @hallName";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@hallID", txtHallID.Text);
            cmd.Parameters.AddWithValue("@hallName", txtHallName.Text);
            con.Open();
            int t = cmd.ExecuteNonQuery();
            if (t != 0)
            {
                lblErr.Text = "Deleted Successfully!";
            }
            con.Close();
            txtHallID.Text = "";
            txtHallName.Text = "";
            showHall();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();

            //string hName = ((TextBox)gridExamHall.Rows.[e.RowIndex].Cells[1].Control[0]).Text;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE examHall SET hallName = '" + txtHallName.Text + "' WHERE hallID = @hallID";
            cmd.Parameters.AddWithValue("@hallID", txtHallID.Text);
            cmd.Parameters.AddWithValue("@hallName", txtHallName.Text);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblErr.Text = "Updated Successfully!";
            showHall();
            txtHallName.Text = "";
        }

        /*
        protected void gridExamHall_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridExamHall.DataKeys[e.RowIndex].Value.ToString());
            string hName = ((TextBox)gridExamHall.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update ExamHall set hallName='" + hName + "' where ehID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                lblErr.Text = "Updated Successfully!";

                //Response.Write("<script>alert('Updated Successfully')</script>");
                gridExamHall.EditIndex = -1;
                showHall();
            }
        }

        protected void gridExamHall_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridExamHall.EditIndex = e.NewEditIndex;
            showHall();
        }

        protected void gridExamHall_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridExamHall.EditIndex = -1;
            showHall();
        }

        */

        /*
        private void BindGrid()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM ExamHall", con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gridExamHall.DataSource = dt;
                        gridExamHall.DataBind();
                    }
                }
        }

        protected void PrintGridView(object sender, EventArgs e)
        {
            //Disable Paging if all Pages need to be Printed.
            if ((sender as Button).CommandArgument == "All")
            {
                //Disable Paging.
                gridExamHall.AllowPaging = false;

                //Re-bind the GridView.
                this.BindGrid();

                //For Printing Header on each Page.
                gridExamHall.UseAccessibleHeader = true;
                gridExamHall.HeaderRow.TableSection = TableRowSection.TableHeader;
                gridExamHall.FooterRow.TableSection = TableRowSection.TableFooter;
                gridExamHall.Attributes["style"] = "border-collapse:separate";
                foreach (GridViewRow row in gridExamHall.Rows)
                {
                    if ((row.RowIndex + 1) % gridExamHall.PageSize == 0 && row.RowIndex != 0)
                    {
                        row.Attributes["style"] = "page-break-after:always;";
                    }
                }
            }
            else
            {
                //Hide the Pager.
                gridExamHall.PagerSettings.Visible = false;
                this.BindGrid();
            }

            using (StringWriter sw = new StringWriter())
            {
                //Render GridView to HTML.
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gridExamHall.RenderControl(hw);

                //Enable Paging.
                gridExamHall.AllowPaging = true;
                this.BindGrid();

                //Remove single quotes to avoid JavaScript error.
                string gridHTML = sw.ToString().Replace(Environment.NewLine, "");
                string gridCSS = gridStyles.InnerText.Replace("\"", "'").Replace(Environment.NewLine, "");


                //Print the GridView.
                string script = "window.onload = function() { PrintGrid('" + gridHTML + "', '" + gridCSS + "'); }";
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", script, true);
            }
        }

        */

        public override void VerifyRenderingInServerForm(Control control)
        {
            /*Verifies that the control is rendered */
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtHallName.Text = "";
        }

    }
}