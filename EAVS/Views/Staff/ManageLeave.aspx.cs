using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class ManageLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //gridview
        protected void gridStuleave_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            // Get the ID of the leave request from the appropriate cell in the GridView
            GridViewRow row = gridStuleave.Rows[rowIndex];
            int leaveId = Convert.ToInt32(row.Cells[0].Text);

            // Connect to the database
            string connectionString = ConfigurationManager.ConnectionStrings["EavsConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                if (e.CommandName == "Approve")
                {
                    // Update the leave request status in the database
                    string updateSql = "UPDATE leave SET status = 'Approved', username='" + Session["username"].ToString() + "', replyDate='" + DateTime.Now.ToString() + "' WHERE leaveID = @leaveID";
                    using (SqlCommand updateCommand = new SqlCommand(updateSql, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@leaveID", leaveId);
                        updateCommand.ExecuteNonQuery();
                    }
                }
                else if (e.CommandName == "Reject")
                {
                    // Update the leave request status in the database
                    string updateSql = "UPDATE leave SET status = 'Rejected', username='"+Session["username"].ToString()+"', replyDate='"+DateTime.Now.ToString()+"' WHERE leaveID=@leaveID";
                    using (SqlCommand updateCommand = new SqlCommand(updateSql, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@leaveID", leaveId);
                        updateCommand.ExecuteNonQuery();
                    }
                }
            }

            // Remove the row from the GridView
            //gridStuleave.Rows.RemoveAt(rowIndex);
            
        }

        //approve btn
    

       
        protected void linkApprove_Click1(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string commandName = button.CommandName;

            // Perform the appropriate action based on the command name
            if (commandName == "Approve")
            {
                // Get the ID of the leave request from the appropriate cell in the GridView
                GridViewRow row = (GridViewRow)button.NamingContainer;
                int leaveId = Convert.ToInt32(row.Cells[0].Text);

                // Connect to the database
                string connectionString = ConfigurationManager.ConnectionStrings["EavsConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string name = Session["username"].ToString();

                    string updateSql = "UPDATE leave SET status = 'Approved', staffName= @username, replyDate='" + DateTime.Now.ToString() + "' WHERE leaveID = @leaveID";
                    using (SqlCommand updateCommand = new SqlCommand(updateSql, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@username", name);

                        updateCommand.Parameters.AddWithValue("@leaveID", leaveId);
                        updateCommand.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Successfully approved leave.');</script>");

                }
            }

            gridStuleave.DataBind();

        }

        protected void linkReject_Click1(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string commandName = button.CommandName;

            // Perform the appropriate action based on the command name
            if (commandName == "Reject")
            {
                
                GridViewRow row = (GridViewRow)button.NamingContainer;
                int leaveId = Convert.ToInt32(row.Cells[0].Text);

                
                string connectionString = ConfigurationManager.ConnectionStrings["EavsConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string name = Session["username"].ToString();

                    
                    string updateSql = "UPDATE leave SET status = 'Rejected', staffName= @username, replyDate='" + DateTime.Now.ToString() + "' WHERE leaveID = @leaveID";
                    using (SqlCommand updateCommand = new SqlCommand(updateSql, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@username", name);
                        updateCommand.Parameters.AddWithValue("@leaveID", leaveId);
                        updateCommand.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Successfully reject leave.');</script>");

                }
            }

            gridStuleave.DataBind();
        }
    }
}