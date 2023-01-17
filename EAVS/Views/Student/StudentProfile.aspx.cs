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
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Session["username"] == null)
            {
                Response.Redirect("~/Homepage.aspx");

            }

            /*
            else
            {
            
            if (Request.QueryString["studentID"] != null)
            {
                try
                {
                    // you can use ? in querystring to avoid NullReferenceException
                    int id = Convert.ToInt16(Request.QueryString["studentID"].ToString());
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    String sql = "SELECT * FROM student WHERE studentID=" + id;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblID.Text = ds.Tables[0].Rows[0]["studentID"].ToString();
                        lblName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                        lblRoll.Text = ds.Tables[0].Rows[0]["rollNo"].ToString();
                        lblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        lblYear.Text = ds.Tables[0].Rows[0]["year"].ToString();
                        lblClass.Text = ds.Tables[0].Rows[0]["className"].ToString();
                        lblFac.Text = ds.Tables[0].Rows[0]["facName"].ToString();
                        lblUname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
                }
            }
        */
            /*
                //cmd.Parameters.AddWithValue("@studentID", id);
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Check if the reader has any rows
                    if (reader.HasRows)
                    {
                        // If there are rows, read the first row
                        reader.Read();

                        //int studentID = (int)reader["studentID"];
                        lblID.Text = reader["studentID"].ToString();
                        lblName.Text = reader["name"].ToString();
                        lblRoll.Text = reader["rollNo"].ToString();
                        lblEmail.Text = reader["email"].ToString();
                        lblYear.Text = reader["year"].ToString();
                        lblClass.Text = reader["className"].ToString();
                        lblFac.Text = reader["facName"].ToString();
                        lblUname.Text = reader["username"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
            }
        }
        */





            //}

        }

    
    }
}

        
