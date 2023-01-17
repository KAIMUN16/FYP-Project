using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showClass();
                showStudent();
            }
        }


        public void showClass()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from class";
            cmd = new SqlCommand(sql, con);
            Int32 countStandard = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblClass.Text = countStandard.ToString();
            lblClass.ForeColor = Color.LightBlue;
        }

        public void showStudent()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd;
            string sql = "SELECT Count(*) from student";
            cmd = new SqlCommand(sql, con);
            Int32 countStudent = Convert.ToInt32(cmd.ExecuteScalar());
            con.Dispose();
            con.Close();
            lblStudent.Text = countStudent.ToString();
            lblStudent.ForeColor = Color.DarkBlue;
        }
    }
}