using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                countStandard();
                //countDivision();
                countFaculty();
                countStaff();
                countStudent();
                countCourse();
                countClass();
                countHall();
            }
        }

        public void countStandard()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from standard";
            cmd = new SqlCommand(sql, con);
            Int32 countStandard = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblStandard.Text = countStandard.ToString();
            lblStandard.ForeColor = Color.LightBlue;
            
        }

        /*
        public void countDivision()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from division";
            cmd = new SqlCommand(sql, con);
            Int32 countDivision = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblDivision.Text = countDivision.ToString();
            lblDivision.ForeColor = Color.DarkBlue;

        }
        */

        public void countFaculty()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from faculty";
            cmd = new SqlCommand(sql, con);
            Int32 countFaculty = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblFaculty.Text = countFaculty.ToString();
            lblFaculty.ForeColor = Color.LightGreen;

        }

        public void countStaff()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from staff";
            cmd = new SqlCommand(sql, con);
            Int32 countStaff = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblStaff.Text = countStaff.ToString();
            lblStaff.ForeColor = Color.Yellow;

        }

        
        public void countStudent()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from student";
            cmd = new SqlCommand(sql, con);
            Int32 countStudent = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblStudent.Text = countStudent.ToString();
            lblStudent.ForeColor = Color.LightBlue;
        }
        

        public void countCourse()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from course";
            cmd = new SqlCommand(sql, con);
            Int32 countCourse = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblCourse.Text = countCourse.ToString();
            lblCourse.ForeColor = Color.DarkBlue;
        }
        

        public void countClass()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from class";
            cmd = new SqlCommand(sql, con);
            Int32 countClass = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblClass.Text = countClass.ToString();
            lblClass.ForeColor = Color.LightGreen;
        }

        public void countHall()
        {
            //Using cmd as new SqlCommand("SELECT Count(*) from standard", con);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from examHall";
            cmd = new SqlCommand(sql, con);
            Int32 countStaff = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblHall.Text = countStaff.ToString();
            lblHall.ForeColor = Color.Yellow;

        }
    }
}