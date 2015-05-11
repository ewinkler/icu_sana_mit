using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class adAdmission1 : System.Web.UI.Page
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
            Label1.Text = DataClass.SelectRecord("select pa_fname from patient where pa_id=" + u + "", "pa_fname");
            Label1.Text += " " + DataClass.SelectRecord("select pa_lname from patient where pa_id=" + u + "", "pa_lname");
            try
            {
                if (Convert.ToInt32(DataClass.SelectRecord("select ha_2sequence from hospital_admission where ha_id=" + i + "", "ha_2sequence")) > 0)
                {
                    befoicu.SelectedValue = DataClass.SelectRecord("select be_id from hospital_admission where ha_id=" + i + "", "be_id");
                    reason.SelectedValue = DataClass.SelectRecord("select re_id from hospital_admission where ha_id=" + i + "", "re_id");
                    temperatureBox.Text = DataClass.SelectRecord("select ha_vitals_temp from hospital_admission where ha_id=" + i + "", "ha_vitals_temp");
                    heartRate.Text = DataClass.SelectRecord("select ha_vitals_heartrate from hospital_admission where ha_id=" + i + "", "ha_vitals_heartrate");
                    systolic.Text = DataClass.SelectRecord("select ha_vitals_sys_bp from hospital_admission where ha_id=" + i + "", "ha_vitals_sys_bp");
                    diastolic.Text = DataClass.SelectRecord("select ha_vitals_dia_bp from hospital_admission where ha_id=" + i + "", "ha_vitals_dia_bp");
                    respRate.Text = DataClass.SelectRecord("select ha_vitals_rr from hospital_admission where ha_id=" + i + "", "ha_vitals_rr");
                    oxigen.Text = DataClass.SelectRecord("select ha_vitals_oxy_sat from hospital_admission where ha_id=" + i + "", "ha_vitals_oxy_sat");
                    oxydrop.SelectedValue = DataClass.SelectRecord("select ha_receiv_oxy from hospital_admission where ha_id=" + i + "", "ha_receiv_oxy");
                    OxyVent.SelectedValue = DataClass.SelectRecord("select ha_receive_oxy_type from hospital_admission where ha_id=" + i + "", "ha_receive_oxy_type");
                    glasgow.SelectedValue = DataClass.SelectRecord("select ha_gcs from hospital_admission where ha_id=" + i + "", "ha_gcs");
                    gcs.SelectedValue = DataClass.SelectRecord("select ha_gcs_score from hospital_admission where ha_id=" + i + "", "ha_gcs_score");
                    gcst.SelectedValue = DataClass.SelectRecord("select ha_gsc_scoreT from hospital_admission where ha_id=" + i + "", "ha_gsc_scoreT");

                }
                else { }
            }
            catch (Exception) { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addRecording(sender, e);
            Response.Redirect("~/adAdmission2.aspx?field1=" + Request.QueryString["field1"] + "&field2=" +
                Request.QueryString["field2"] + "");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            addRecording(sender, e);
            Response.Redirect("~/hospitalAdmission.aspx");
        }

        protected void addRecording(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            string ee = DataClass.SelectRecord("select em_id from employee where em_login='" + cookie["name"] + "'", "em_id");
            string temperature; string heartr; string systol; string diasto; string resp; string oxy;
            if (temperatureBox.Text.Length < 1) { temperature = "0"; } else { temperature = temperatureBox.Text.Replace(',','.'); }
            if (heartRate.Text.Length < 1) { heartr = "0"; } else { heartr = heartRate.Text.Replace(',','.'); }
            if (systolic.Text.Length < 1) { systol = "0"; } else { systol = systolic.Text.Replace(',','.'); }
            if (diastolic.Text.Length < 1) { diasto = "0"; } else { diasto = diastolic.Text.Replace(',', '.'); }
            if (respRate.Text.Length < 1) { resp = "0"; } else { resp = respRate.Text.Replace(',', '.'); }
            if (oxigen.Text.Length < 1) { oxy = "0"; } else { oxy = oxigen.Text.Replace(',', '.'); }
            DataClass.insertRecord("update hospital_admission set be_id=" + Convert.ToInt32(befoicu.SelectedValue) +
                ", re_id=" + Convert.ToInt32(reason.SelectedValue) +
                ", ha_vitals_temp=" + temperature + ", ha_vitals_heartrate=" + heartr +
                ", ha_vitals_sys_bp=" + systol + ", ha_vitals_dia_bp=" + diasto +
                ", ha_vitals_rr=" + resp + ", ha_vitals_oxy_sat=" + oxy +
                ", ha_receiv_oxy='" + oxydrop.SelectedValue +
                "', ha_receive_oxy_type='" + OxyVent.SelectedValue +
                "', ha_gcs='" + glasgow.SelectedValue + "', ha_gcs_score = '" +
                gcs.SelectedValue + "', ha_gsc_scoreT='" + gcst.SelectedValue +
                "', ha_2sequence="+ee+" where ha_id=" + Convert.ToInt32(Request.QueryString["field2"]) + "");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into before_icu (be_desc) values('" + beicutext.Text + "')");
            Table2.Rows[1].Visible = false;
            Response.Redirect(Request.RawUrl);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Table2.Rows[1].Visible == false)
            {
                Table2.Rows[1].Visible = true;
            }
            else { Table2.Rows[1].Visible = false; }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Table2.Rows[3].Visible == false)
            {
                Table2.Rows[3].Visible = true;
            }
            else { Table2.Rows[3].Visible = false; }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into reason_icuadmission (re_description) values('" +
                reasonText.Text + "')");
            Table2.Rows[3].Visible = false;
            Response.Redirect(Request.RawUrl);
        }
    }
}