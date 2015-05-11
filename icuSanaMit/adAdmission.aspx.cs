using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace icuSanaMit
{
    public partial class adAdmission : System.Web.UI.Page
    {
        int s; 
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
            if (referDistrHosp.SelectedValue == "Y") { distrHospitals.Visible = true; }
            else { distrHospitals.Visible = false; }
            //this.adDate.Text = DateTime.Today.ToString("MM/dd/yyyy");
            adDate.Text = System.DateTime.Today.ToString("yyyy-MM-dd");
            adTime.Text = DateTime.Now.ToString("HH:mm");
            icuhdudatebox.Text = System.DateTime.Today.ToString("yyyy-MM-dd");
            if (!IsPostBack)
            {
                SqlDataSource5.FilterExpression = "pa_lname like 'cccccccccccccccccccccc'";
                SqlDataSource5.FilterExpression = "pa_mhr like 'ccccccccccccc'";
            }
            //birth.Text = Server.HtmlEncode("" + (Convert.ToInt16(DateTime.Now.Year) - Convert.ToInt16(age.Text)).ToString() + "-01-01");
            try
            {
                int pid = Convert.ToInt32(Request.QueryString["field1"]);
                int hid = Convert.ToInt32(Request.QueryString["field2"]);

                if (Request.QueryString["field1"].Length > 0)
                {
                    SqlDataSource5.FilterExpression = "pa_id=" + pid + "";
                    fname.Text = DataClass.SelectRecord("select pa_fname from patient where pa_id=" + pid + "", "pa_fname");
                    lname.Text = DataClass.SelectRecord("select pa_lname from patient where pa_id=" + pid + "", "pa_lname");
                    mhr.Text = DataClass.SelectRecord("select pa_mhr from patient where pa_id=" + pid + "", "pa_mhr");
                    DropDownList5.SelectedValue = DataClass.SelectRecord("select pa_gender from patient where pa_id=" + pid + "", "pa_gender");
                    age.Text = DataClass.SelectRecord("select pa_age from patient where pa_id=" + pid + "", "pa_age");
                    birth.Text = Convert.ToDateTime(DataClass.SelectRecord("select pa_birth from patient where pa_id=" + pid + "", "pa_birth")).ToString("yyyy-MM-dd");
                    TextBox1.Text = DataClass.SelectRecord("select pa__address from patient where pa_id=" + pid + "", "pa__address");
                    DropDownList6.SelectedValue = DataClass.SelectRecord("select pa_province from patient where pa_id=" + pid + "", "pa_province");
                    DropDownList3.SelectedValue = DataClass.SelectRecord("select pa_district from patient where pa_id=" + pid + "", "pa_district");

                    hospitalBox.SelectedValue = DataClass.SelectRecord("select ho_id from hospital_admission where ha_id=" + hid + "", "ho_id");
                    icuHdu.SelectedValue = DataClass.SelectRecord("select ha_icu_hdu from hospital_admission where ha_id=" + hid + "", "ha_icu_hdu");
                    adDate.Text = Convert.ToDateTime(DataClass.SelectRecord("select ha_date from hospital_admission where ha_id=" + hid + "", "ha_date")).ToString("yyyy-MM-dd");
                    adTime.Text = Convert.ToDateTime(DataClass.SelectRecord("select ha_date from hospital_admission where ha_id=" + hid + "", "ha_date")).ToString("HH:mm");
                    icuhdudatebox.Text = Convert.ToDateTime(DataClass.SelectRecord("select ha_ICU_HDU_date from hospital_admission where ha_id=" + hid + "", "ha_ICU_HDU_date")).ToString("yyyy-MM-dd");
                    DropDownList1.SelectedValue = DataClass.SelectRecord("select ha_type from hospital_admission where ha_id=" + hid + "", "ha_type");
                    //if (referDistrHosp.AutoPostBack) { }
                    //else
                    //{
                    if (!IsPostBack){
                        if (DataClass.SelectRecord("select ha_ref_district_hospital from hospital_admission where ha_id=" + hid + "", "ha_ref_district_hospital") == "Y")
                        {

                            referDistrHosp.SelectedValue = DataClass.SelectRecord("select ha_ref_district_hospital from hospital_admission where ha_id=" + hid + "", "ha_ref_district_hospital");

                            distrHospitals.Visible = true;
                            distrHospitals.SelectedValue = DataClass.SelectRecord("select ha_district_hospital from hospital_admission where ha_id=" + hid + "", "ha_district_hospital");

                        }
                        else { distrHospitals.Visible = false; }
                    }
                }
                    DropDownList2.SelectedValue = DataClass.SelectRecord("select in_id from hospital_admission where ha_id=" + hid + "", "in_id");
                //}
                //else { }
            }
            catch (NullReferenceException) { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addRecord(sender, e);
//            string ee = DataClass.SelectRecord("select em_id from employee where em_login='" + cookie["name"] + "'", "em_id");
//                DataClass.insertRecord("insert into patient (pa_fname, pa_lname, pa_mhr, pa_gender, pa_age, pa_birth, pa_status, pa__address, pa_province) values('" +
//                       fname.Text + "', '" + lname.Text + "', '" + mhr.Text + "', '" + DropDownList5.SelectedValue +
//                       "', " + age.Text + ", '" + birth.Text + "', " + patientstatus.SelectedValue + ", '" + TextBox1.Text + "', " +
//                       DropDownList6.SelectedValue + ")");
//                string f = DataClass.SelectRecord("select max(pa_id) as expr from patient", "expr");
//                DataClass.insertRecord(
//"insert into hospital_admission (ho_id, pa_id, ha_date, ha_ICU_HDU_date, ha_type, ha_ref_district_hospital, ha_district_hospital, in_id, be_id, re_id, ha_vitals_temp, ha_vitals_heartrate, ha_vitals_sys_bp, ha_vitals_dia_bp, ha_vitals_rr, ha_vitals_oxy_sat, ha_receiv_oxy, ha_receive_oxy_type, ha_gcs, ha_gcs_score, ha_gsc_scoreT, ha_sepsis_body_temp, ha_sepsis_hr, ha_sepsis_resp_rate, ha_sepsis_wbc, ha_sepsis_infection, is_id, ha_interv_surgery, ha_interv_ventilation, ha_interv_vasopressors, ha_interv_inv_monitoring, ha_interv_hemodyalis, ha_interv_tpn, ha_qi_new_bed, ha_qi_have_bed, ha_qi_fever, ha_qi_culture, ha_dis_date, ha_dis_die, ha_dis_referred, ha_dis_diagnosis, em_id) values(" +
//                    hospitalBox.SelectedValue + ", " + f + ", '" + adDate.Text + " " + adTime.Text + "', '" + icuhdudatebox.Text + "', " + DropDownList1.SelectedValue + ", " + referDistrHosp.SelectedValue + ", '" + distrHospital.Text + "', " +
//                    DropDownList2.SelectedValue + ", " + DropDownList3.SelectedValue + ", " + DropDownList4.SelectedValue + ", "+temperatureBox.Text+", "+heartRate.Text+", "+systolic.Text+", "+diastolic.Text+", "+respRate.Text+", "+oxigen.Text+", '"+oxydrop.SelectedValue+"', '"+OxyVent.SelectedValue+"', '"+glasgow.SelectedValue+"', "+gcs.SelectedValue+", "+gcst.SelectedValue+", "+bodytemp.SelectedValue+", "+heartRateSep.SelectedValue+", "+respRateSep.SelectedValue+", "+wbcSep.SelectedValue+", "+suspinfection.SelectedValue+", "+infection.SelectedValue+", "+surgery.SelectedValue+", "+ventilation.SelectedValue+", "+vasopressor.SelectedValue+", "+invmonitoring.SelectedValue+", "+hemodyalisis.SelectedValue+", "+
//                    tpn.SelectedValue+", "+newbed.SelectedValue+", "+havebed.SelectedValue+", "+fever.SelectedValue+", "+culture.SelectedValue+", '"+disDate.Text+"', "+die.SelectedValue+", '"+referred.SelectedValue+"', '"+TextBox2.Text+"', "+ee+")");
//                string h = DataClass.SelectRecord("select max(ha_id) as ha from hospital_admission", "ha");
                Response.Redirect("~/hospitalAdmission.aspx");
           
            
        }

        protected void fname_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void addRecord(object sender, EventArgs e)
        {
            string j;
            if (referDistrHosp.SelectedValue=="N") { j = "null"; }
            else { j = distrHospitals.SelectedValue; }
            HttpCookie cookie = Request.Cookies["userInfo"];
            string ee = DataClass.SelectRecord("select em_id from employee where em_login='" + cookie["name"] + "'", "em_id");
            if(Request.RawUrl.Contains("field"))
            
            {
                DataClass.insertRecord(
    "update patient set pa_fname='" + fname.Text + "', pa_lname='" + lname.Text + "', pa_mhr='" + mhr.Text + "', pa_gender='" + DropDownList5.SelectedValue +
    "', pa_age=" + age.Text + ", pa_birth='" + birth.Text + "', pa__address='" + TextBox1.Text + "', pa_province=" + DropDownList6.SelectedValue +
    ", pa_district=" + DropDownList3.SelectedValue + " where pa_id=" + Convert.ToInt32(Request.QueryString["field1"]) + "");
                DataClass.insertRecord(
                "update hospital_admission set ho_id=" + Convert.ToInt32(hospitalBox.SelectedValue) + ", ha_icu_hdu=" + Convert.ToInt32(icuHdu.SelectedValue) + ", ha_date='" + adDate.Text + " " + adTime.Text +
    "', ha_ICU_HDU_date='" + icuhdudatebox.Text + "', ha_type=" + Convert.ToInt32(DropDownList1.SelectedValue) +
    ", ha_ref_district_hospital='" + referDistrHosp.SelectedValue + "', ha_district_hospital=" + j + ", in_id=" + Convert.ToInt32(DropDownList2.SelectedValue) +
    ", ha_1sequence=" + Convert.ToInt32(ee) + " where ha_id=" + Convert.ToInt32(Request.QueryString["field2"]) + "");

                
            }
            else{
                if (GridView1.Rows.Count > 0)
                {

                    s = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                    DataClass.insertRecord(
                  "insert into hospital_admission (ho_id, pa_id, ha_icu_hdu, ha_date, ha_ICU_HDU_date, ha_type, ha_ref_district_hospital, ha_district_hospital, in_id, em_id, ha_patient_age, ha_1sequence) values("
                  + Convert.ToInt32(hospitalBox.SelectedValue) + ", "
                  + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + ", " + Convert.ToInt32(icuHdu.SelectedValue) + ", '"
                  + adDate.Text + " " + adTime.Text + "', '" + icuhdudatebox.Text + "', " + Convert.ToInt32(DropDownList1.SelectedValue) + ", '" + referDistrHosp.SelectedValue + "', " + j + ", " + Convert.ToInt32(DropDownList2.SelectedValue) + ", " + Convert.ToInt32(ee) + ", " + Convert.ToInt32(age.Text) + ", " + Convert.ToInt32(ee) + ")");
                }

                else
                {
                    DataClass.insertRecord(
    "insert into patient (pa_fname, pa_lname, pa_mhr, pa_gender, pa_age, pa_birth, pa__address, pa_province, pa_district) values('" +
    fname.Text + "', '" + lname.Text + "', '" + mhr.Text + "', '" + DropDownList5.SelectedValue + "', "+age.Text+", '" + birth.Text + "', '" + TextBox1.Text + "', " + Convert.ToInt32(DropDownList6.SelectedValue) + ", " + Convert.ToInt32(DropDownList3.SelectedValue) + ")");
                    s = Convert.ToInt32(DataClass.SelectRecord("select max(pa_id) as pa from patient", "pa"));
                    DataClass.insertRecord(
    "insert into hospital_admission (ho_id, pa_id, ha_icu_hdu, ha_date, ha_ICU_HDU_date, ha_type, ha_ref_district_hospital, ha_district_hospital, in_id, em_id, ha_patient_age, ha_1sequence) values("
    + Convert.ToInt32(hospitalBox.SelectedValue) + ", " + s + ", " + Convert.ToInt32(icuHdu.SelectedValue) + ", '"
    + adDate.Text + " " + adTime.Text + "', '" + icuhdudatebox.Text + "', " + Convert.ToInt32(DropDownList1.SelectedValue) + ", '" + referDistrHosp.SelectedValue + "', " + j + ", " + Convert.ToInt32(DropDownList2.SelectedValue) + ", " + Convert.ToInt32(ee) + ", " + Convert.ToInt32(age.Text) + ", " + Convert.ToInt32(ee) + ")");

                }
            }
        }

        
        protected void Button2_Click1(object sender, EventArgs e)
        {
            //Response.Redirect("~/Default.aspx");
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('Default.aspx');", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime j=Convert.ToDateTime(DataClass.SelectRecord("select pa_birth from patient where pa_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + "", "pa_birth"));
            fname.Text = GridView1.SelectedRow.Cells[2].Text;
            lname.Text = GridView1.SelectedRow.Cells[3].Text;
            DropDownList5.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
            mhr.Text = DataClass.SelectRecord("select pa_mhr from patient where pa_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + "", "pa_mhr");
            birth.Text = j.ToString("yyyy-MM-dd");
            age.Text = (DateTime.Now.Year - j.Year).ToString();
            TextBox1.Text = DataClass.SelectRecord("select pa__address from patient where pa_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + "", "pa__address");
            DropDownList6.SelectedValue = DataClass.SelectRecord("select pa_province from patient where pa_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + "", "pa_province");
            DropDownList3.SelectedValue = DataClass.SelectRecord("select pa_district from patient where pa_id=" + Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text) + "", "pa_district");
            s = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            addRecord(sender, e);
            Response.Redirect("~/hospitalAdmission.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //if (s < 1) {
            //s=Convert.ToInt32(DataClass.SelectRecord("select max(pa_id) as ma from patient", "ma"); 
            //}
            addRecord(sender, e);
            int w; int z;
            if(Request.RawUrl.Contains("field")){
                w = Convert.ToInt32(Request.QueryString["field2"]);
                z = Convert.ToInt32(Request.QueryString["field1"]);
                
           }
            else {
                w = Convert.ToInt32(DataClass.SelectRecord("select max(ha_id) as ha from hospital_admission", "ha"));
                z = Convert.ToInt32(DataClass.SelectRecord("select max(pa_id) as pa from patient", "pa"));
               
            }
            

            Response.Redirect("~/adAdmission1.aspx?field1=" + z + "&field2=" + w + "");
        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into insurance (in_name, co_id) values('" +
                TextBox2.Text + "', " + DropDownList4.SelectedValue + ")");
            Table1.Rows[8].Visible = false;
            Response.Redirect(Request.RawUrl);
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            if (Table1.Rows[8].Visible == false)
            {
                Table1.Rows[8].Visible = true;
            }
            else { Table1.Rows[8].Visible = false; }
        }

        protected void birth_TextChanged(object sender, EventArgs e)
        {
            //age.Text = ( DateTime.Now - Convert.ToDateTime((Convert.ToDateTime(birth.Text)).ToString("yyyy-MM-dd"))).TotalDays.ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
            birth.Text = Server.HtmlEncode("" + (Convert.ToInt16(DateTime.Now.Year) - Convert.ToInt16(age.Text)).ToString() + "-01-01");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DateTime zeroTime = new DateTime(1, 1, 1);
            TimeSpan diff = DateTime.Now.Subtract(Convert.ToDateTime(birth.Text));
            int years = (zeroTime + diff).Year - 1;
            age.Text = years.ToString();
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0) { }
            else
            {
                SqlDataSource4.FilterExpression = "di_province=" + DropDownList6.SelectedValue + "";
            }
        }

        protected void referDistrHosp_SelectedIndexChanged(object sender, EventArgs e)
        {
            
         
            if (referDistrHosp.SelectedValue == "Y")
            {
                distrHospitals.Visible = true;
            }
            else { distrHospitals.Visible = false; }
        }

        protected void lname_TextChanged(object sender, EventArgs e)
        {
            if (lname.Text.Length > 1)
            {
                SqlDataSource5.FilterExpression = "pa_lname like '" + lname.Text + "%'";
            }
            else {
                SqlDataSource5.FilterExpression = "pa_lname like 'cccccccccccccccccccccc'";
            }
        }

        protected void mhr_TextChanged(object sender, EventArgs e)
        {
            if (mhr.Text.Length > 1)
            {
                SqlDataSource5.FilterExpression = "pa_mhr like '" + mhr.Text + "%'";
            }
            else
            {
                SqlDataSource5.FilterExpression = "pa_mhr like 'ccccccccccccc'";
            }
        }

    }
}