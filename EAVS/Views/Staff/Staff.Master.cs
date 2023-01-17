using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EAVS.Views.Staff
{
    public partial class Staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Homepage.aspx");
            }
            else
            {
                showName.Text = (string)Session["username"];
                showName.ForeColor = Color.OrangeRed;
            }

        }
    }
}