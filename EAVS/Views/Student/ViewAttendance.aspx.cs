using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Student
{
    public partial class ViewAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showAtt();
            }
        }


        public void showAtt()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            string sql = "Select date, staffName, status FROM attendance where username= '" + Session["username"] + "' ORDER BY date DESC";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gridViewAtt.DataSource = ds;
            gridViewAtt.DataBind();
        }
        /*
        protected void showAtt()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            //string rollNo = lblRoll.Text.ToString();
            string sql = "SELECT * FROM attendance a, student s WHERE a.rollNo LIKE a.rollNo AND username ";
            SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.Parameters.AddWithValue("@rollNo", rollNo);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridAtt.DataSource = dr;
                gridAtt.DataBind();
            }
            con.Close();


           
        }
        */

        protected void gridAtt_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void staffDDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void classDDL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearchClass(object sender, EventArgs e)
        {
            /*
            bool found = false;

            if (Session["username"] == null)
            {
                Response.Redirect("~/Homepage.aspx");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    string dayWeek = dayDDL.SelectedValue.ToString();
                    con.Open();

                    string sql = "Select * FROM attendance where username= '" + Session["username"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sql, con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gridViewAtt.DataSource = ds;
                    gridViewAtt.DataBind();
                    found = true;
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

                }
            }

            if (found == true)
            {
                Response.Write("<script>alert('Your attendance list')</script>");

            }
            else
            {
                Response.Write("<script>alert('Something went wrong... Please try again')</script>");

            }
            */

        }
    }
}