using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class adAdmission2 : System.Web.UI.Page
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
            string u = Request.QueryString["field1"];
            string i = Request.QueryString["field2"];
            Label2.Text = DataClass.SelectRecord("select pa_fname from patient where pa_id=" + u + "", "pa_fname");
            Label2.Text += " " + DataClass.SelectRecord("select pa_lname from patient where pa_id=" + u + "", "pa_lname");
            try
            {
                if (Convert.ToInt32(DataClass.SelectRecord("select ha_3sequence from hospital_admission where ha_id=" + i + "", "ha_3sequence")) > 0)
                {
                    if (!IsPostBack)
                    {
                        bodytemp.SelectedValue = DataClass.SelectRecord("select ha_sepsis_body_temp from hospital_admission where ha_id=" + i + "", "ha_sepsis_body_temp");
                        heartRateSep.SelectedValue = DataClass.SelectRecord("select ha_sepsis_hr from hospital_admission where ha_id=" + i + "", "ha_sepsis_hr");
                        respRateSep.SelectedValue = DataClass.SelectRecord("select ha_sepsis_resp_rate from hospital_admission where ha_id=" + i + "", "ha_sepsis_resp_rate");
                        wbcSep.SelectedValue = DataClass.SelectRecord("select ha_sepsis_wbc from hospital_admission where ha_id=" + i + "", "ha_sepsis_wbc");
                        suspinfection.SelectedValue = DataClass.SelectRecord("select ha_sepsis_infection from hospital_admission where ha_id=" + i + "", "ha_sepsis_infection");
                        infection.SelectedValue = DataClass.SelectRecord("select is_id from hospital_admission where ha_id=" + i + "", "is_id");
                    }
                }
                else { }
            }
            catch (Exception) { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addingRecord(sender, e);
            Response.Redirect("~/hospitalAdmission.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            addingRecord(sender, e);
            Response.Redirect("~/adAdmission3.aspx?field1=" + Request.QueryString["field1"] + "&field2=" +
    Request.QueryString["field2"] + "");
        }

        protected void addingRecord(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            string ee = DataClass.SelectRecord("select em_id from employee where em_login='" + cookie["name"] + "'", "em_id");
            DataClass.insertRecord("update hospital_admission set ha_sepsis_body_temp='" + bodytemp.SelectedValue +
                "', ha_sepsis_hr='" + heartRateSep.SelectedValue +
                "', ha_sepsis_resp_rate='" + respRateSep.SelectedValue +
                "', ha_sepsis_wbc='" + wbcSep.SelectedValue +
                "', ha_sepsis_infection='" + suspinfection.SelectedValue +
                "', is_id=" + infection.SelectedValue +
                ", ha_3sequence=" + ee + " where ha_id=" + Convert.ToInt32(Request.QueryString["field2"]) + "");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Table1.Rows[6].Visible == false)
            {
                Table1.Rows[6].Visible = true;
            }
            else { Table1.Rows[6].Visible = false; }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into infection_site (is_desc) values('" + infsite.Text + "')");
            Table1.Rows[6].Visible = false;
            Response.Redirect(Request.RawUrl);
        }
    }
}