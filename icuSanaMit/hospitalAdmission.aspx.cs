using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class hospitalAdmission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                if ( Convert.ToInt32(cookie["group"]) > 4)
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
            Button2.Visible = false;
            stage3.Visible = false;
            stage4.Visible = false;
            Button3.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adAdmission.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button2.Visible = true;
            Button3.Visible = true;
            stage3.Visible = true;
            stage4.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string d = DataClass.SelectRecord("select pa_id from hospital_admission where ha_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text) + "", "pa_id");
            Response.Redirect("~/adAdmission1.aspx?field1=" + d + "&field2=" + GridView1.SelectedRow.Cells[2].Text + "");

        }

        protected void stage3_Click(object sender, EventArgs e)
        {
            string d = DataClass.SelectRecord("select pa_id from hospital_admission where ha_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text) + "", "pa_id");
            Response.Redirect("~/adAdmission2.aspx?field1=" + d + "&field2=" + GridView1.SelectedRow.Cells[2].Text + "");

        }

        protected void stage4_Click(object sender, EventArgs e)
        {
            string d = DataClass.SelectRecord("select pa_id from hospital_admission where ha_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text) + "", "pa_id");
            Response.Redirect("~/adAdmission3.aspx?field1=" + d + "&field2=" + GridView1.SelectedRow.Cells[2].Text + "");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string d = DataClass.SelectRecord("select pa_id from hospital_admission where ha_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text) + "", "pa_id");
            Response.Redirect("~/adAdmission.aspx?field1=" + d + "&field2=" + GridView1.SelectedRow.Cells[2].Text + "&field3=0");
        }
    }
}