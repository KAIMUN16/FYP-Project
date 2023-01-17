using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace EAVS.Models
{
    public class Function
    {
        private SqlConnection con;
        private SqlCommand cmd;
        private DataTable dt;
        private string ConStr;
        private SqlDataAdapter sda;
        public Function()
        {
            ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True";
            con = new SqlConnection(ConStr);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }

        public int SetData(string Query)
        {
            int cnt = 0;
            if(con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            cmd.CommandText = Query;
            cnt = cmd.ExecuteNonQuery();
            con.Close();
            return cnt;

        }

        public DataTable GetData(string Query)
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Query, con);
            sda.Fill(dt);
            return dt;
        }

    }
}