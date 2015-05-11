using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class Discharged : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                if (Convert.ToInt32(cookie["group"]) > 4)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
            int x = Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                SqlDataSource1.FilterExpression = "ho_id = " + j + "";

            }
            Button1.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string i=DataClass.SelectRecord("select pa_id from hospital_admission where ha_id="+GridView1.SelectedRow.Cells[1].Text+"", "pa_id");
            Response.Redirect("~/PatientInformation.aspx?pp=" + i + "&hh=" + GridView1.SelectedRow.Cells[1].Text + "");
        }
    }
}