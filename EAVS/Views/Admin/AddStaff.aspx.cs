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
    public partial class AddStaff : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showStaff();
            }
        }

        public void showStaff()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from staff", con);
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                gridStaff.DataSource = dr;
                gridStaff.DataBind();

            }
        }

        protected void btnAddStaff(object sender, EventArgs e)
        {

            bool found = false;

            if (Page.IsValid)
            {
                if (txtStaffName.Text == "" || txtStaffEmail.Text == "" || txtStaffQuali.Text == "" || txtStaffUname.Text == "" || txtStaffPass.Text == "" || staffGenderDDL.SelectedItem == null)
                {
                    Response.Write("<script>alert('Data cannot be empty')</script>");

                }
                else
                {
                    
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                    SqlCommand courseExist = new SqlCommand();
                    courseExist.CommandText = "select * from [staff]";
                    courseExist.Connection = con;
                    con.Open();
                    SqlDataReader rd = courseExist.ExecuteReader();
                    while (rd.Read())
                    {
                        if (rd[1].ToString() == txtStaffName.Text.Trim() || rd[3].ToString() == txtStaffEmail.Text.Trim() || rd[8].ToString() == txtStaffUname.Text.Trim())
                        {
                            found = true;
                            break;

                        }
                    }

                    
                    if (found == true)               
                    {                    
                        Response.Write("<script>alert('Details already used by other staff. Please use other details.');</script>");                       
                    }  
                    con.Close();
                    if (found == false)
                    {
                        if (FileUpload1.HasFile)
                        {
                            string imgPath = Path.GetExtension(FileUpload1.PostedFile.FileName);
                            if (imgPath != ".jpg" && imgPath != ".jpeg" && imgPath != ".png" && imgPath != ".gif")
                            {
                                lblErr.Text = "Only Image type .jpg, .jpeg, .png, .gif allowed";
                                lblErr.ForeColor = System.Drawing.Color.Red;
                            }

                            string fileImg = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            string filePath = "../../StaffPhoto/" + fileImg;

                            FileUpload1.SaveAs(Server.MapPath(filePath));
                            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");


                            string name = txtStaffName.Text.Trim();
                            string email = txtStaffEmail.Text.Trim();
                            string qua = txtStaffQuali.Text.Trim();
                            string gender = staffGenderDDL.SelectedItem.Text;
                            string stdNa = staffStandardDDL.SelectedValue.ToString();
                            string facNa = staffFacultyDDL.SelectedValue.ToString();
                            string uname = txtStaffUname.Text.Trim();
                            string pass = txtStaffPass.Text.Trim();

                            string sql = @"insert into staff (name, email, gender, qualification, standName, facName, profilePicture, username, password) values (@name, @email, @gender, @qualification, @standName, @facName, @profilePicture, @username, @password)";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            con.Open();
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@qualification", qua);
                            cmd.Parameters.AddWithValue("@gender", gender);
                            cmd.Parameters.AddWithValue("@standName", stdNa);
                            cmd.Parameters.AddWithValue("@facName", facNa);
                            cmd.Parameters.AddWithValue("@username", uname);
                            cmd.Parameters.AddWithValue("@password", pass);

                            cmd.Parameters.AddWithValue("@profilePicture", fileImg);


                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('New staff " + name + " added successfully')</script>");
                            showStaff();
                            txtStaffName.Text = "";
                            txtStaffEmail.Text = "";
                            txtStaffQuali.Text = "";
                            txtStaffUname.Text = "";
                            txtStaffPass.Text = "";

                        }
                        else
                        {
                            Response.Write("<script>alert('Please choose photo')</script>");

                        }
                    }
                }
            }


            /*
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");

                string name = txtStaffName.Text;
                string email = txtStaffEmail.Text;
                string qua = txtStaffQuali.Text;
                string gender = staffGenderDDL.SelectedValue;

                string stdNa = staffStandardDDL.SelectedValue;
                string facNa = staffFacultyDDL.SelectedValue;
                string uname = txtStaffUname.Text;
                string pass = txtStaffPass.Text;

                FileUpload1.SaveAs(Server.MapPath("~/StaffPhoto/") + Path.GetFileName(FileUpload1.FileName));
                String imgfile = "StaffPhoto/" + Path.GetFileName(FileUpload1.FileName);

                try
                {
                    string sql = @"insert into staff (name, email, gender, qualification, standName, facName, profilePicture, username, password) values (@name, @email, @gender, @qualification, @standName, @facName, @profilePicture, @username, @password)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@qualification", qua);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@standName", stdNa);
                    cmd.Parameters.AddWithValue("@facName", facNa);

                    cmd.Parameters.AddWithValue("@username", uname);
                    cmd.Parameters.AddWithValue("@password", pass);
                    cmd.Parameters.AddWithValue("@profilePicture", "~/ StaffPhoto /" + imgfile);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Staff added successfully')</script>");

                }
                catch(Exception ex)
                {
                    lblErr.Text = ex.Message;
                }

                showStaff();
                txtStaffName.Text = "";
                txtStaffEmail.Text = "";
                txtStaffQuali.Text = "";
                txtStaffUname.Text = "";
                txtStaffPass.Text = "";
                //staffGenderDDL.SelectedIndex = 0;
                //staffStandardDDL.SelectedIndex = 0;
                //staffFacultyDDL.SelectedIndex = 0;

            }
            */

        }

        protected void btnResetStaff(object sender, EventArgs e)
        {
            txtStaffName.Text = "";
            txtStaffEmail.Text = "";
            txtStaffQuali.Text = "";
            txtStaffUname.Text = "";
            txtStaffPass.Text = "";
            staffGenderDDL.SelectedIndex = 0;
            staffStandardDDL.SelectedIndex = 0;
            staffFacultyDDL.SelectedIndex = 0;
        }

        protected void gridStaff_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridStaff.EditIndex = -1;
            showStaff();
        }

        protected void gridStaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridStaff.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from staff where staffID='" + id + "'", con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Staff has been deleted successfully')</script>");
                gridStaff.EditIndex = -1;
                showStaff();
            }
        }

        protected void gridStaff_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridStaff.EditIndex = e.NewEditIndex;
            showStaff();
        }

        protected void gridStaff_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gridStaff.DataKeys[e.RowIndex].Value.ToString());

            TextBox sName = ((TextBox)gridStaff.Rows[e.RowIndex].Cells[1].FindControl("editStaffName")) as TextBox;
            TextBox sEmail = ((TextBox)gridStaff.Rows[e.RowIndex].Cells[2].FindControl("editEmailtxt")) as TextBox;
            DropDownList sGender = gridStaff.Rows[e.RowIndex].Cells[3].FindControl("editGddl") as DropDownList;
            TextBox sQua = ((TextBox)gridStaff.Rows[e.RowIndex].Cells[6].FindControl("editquatxt")) as TextBox;
            DropDownList sStand = gridStaff.Rows[e.RowIndex].Cells[4].FindControl("editstandNameDDL") as DropDownList;
            DropDownList sFac = gridStaff.Rows[e.RowIndex].Cells[5].FindControl("editfacNameDDL") as DropDownList;
            TextBox suname = ((TextBox)gridStaff.Rows[e.RowIndex].Cells[8].FindControl("edituname")) as TextBox;
            String staffName = sName.Text;
            
            FileUpload sPhoto = gridStaff.Rows[e.RowIndex].Cells[7].FindControl("FileUpload2") as FileUpload;
           
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kaimu\source\repos\EAVS\EAVS\App_Data\EavsDB.mdf;Integrated Security=True");
            con.Open();
            if (sPhoto.HasFile)
            {
                string imgPath = Path.GetExtension(sPhoto.PostedFile.FileName);
                if (imgPath != ".jpg" && imgPath != ".jpeg" && imgPath != ".png" && imgPath != ".gif")
                {
                    lblErr.Text = "Only Image type .jpg, .jpeg, .png, .gif allowed";
                    lblErr.ForeColor = System.Drawing.Color.Red;
                }

                string fileImg = Path.GetFileName(sPhoto.PostedFile.FileName);
                string filePath = "../../StaffPhoto/" + fileImg;

                sPhoto.SaveAs(Server.MapPath(filePath));

                //  Response.Write("<script>alert('" + sName + "')</script>");
                SqlCommand cmd = new SqlCommand("Update staff set name='" + sName.Text + "',email='" + sEmail.Text + "', gender='" + sGender.SelectedValue.ToString() + "', standName='" + sStand.SelectedValue.ToString() + "', facName='" + sFac.SelectedValue.ToString() + "', qualification='" + sQua.Text + "', profilePicture='" + fileImg + "', username='" + suname.Text + "' where staffID='" + id + "'", con);
                cmd.ExecuteNonQuery();

            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update staff set name='" + sName.Text + "',email='" + sEmail.Text + "', gender='" + sGender.SelectedValue.ToString() + "', standName='" + sStand.SelectedValue.ToString() + "', facName='" + sFac.SelectedValue.ToString() + "', qualification='" + sQua.Text + "'	, username='" + suname.Text + "' where staffID='" + id + "'", con);
                cmd.ExecuteNonQuery();

            }


            Response.Write("<script>alert('Staff data has been updated successfully')</script>");
            gridStaff.EditIndex = -1;
            showStaff();

        }

      

        protected void gridStaff_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}