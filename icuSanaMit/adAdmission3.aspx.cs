using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class adAdmission3 : System.Web.UI.Page
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
            GridView1.Visible = false;
            diagnosis.Enabled = true;
            Button1.Visible = false;
            Label2.Text = DataClass.SelectRecord("select pa_fname from patient where pa_id=" + u + "", "pa_fname");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int z; int r;
            if (die.SelectedValue == "N" & referred.SelectedValue == "No") { z = 1; } else { z = 0; }
            if (referred.SelectedValue != "No") { r = 1; } else { r = 0; }
            HttpCookie cookie = Request.Cookies["userInfo"];
            string ee = DataClass.SelectRecord("select em_id from employee where em_login='" + cookie["name"] + "'", "em_id");
            DataClass.insertRecord("update hospital_admission set ha_interv_surgery='"+
                surgery.SelectedValue+"', ha_interv_ventilation='"+ventilation.SelectedValue+
                "', ha_interv_vasopressors='"+vasopressor.SelectedValue+"', ha_interv_inv_monitoring='"+
                invmonitoring.SelectedValue+"', ha_interv_hemodyalis='"+hemodyalisis.SelectedValue+
                "', ha_interv_tpn='"+tpn.SelectedValue+"', ha_qi_new_bed='"+newbed.SelectedValue+
                "', ha_qi_have_bed='"+havebed.SelectedValue+"', ha_qi_fever='"+fever.SelectedValue+
                "', ha_qi_culture='"+culture.SelectedValue+"', ha_dis_date='"+disDate.Text+
                "', ha_dis_die='"+die.SelectedValue+"', ha_dis_referred='"+referred.SelectedValue+
                "', ha_dis_diagnosis='"+diagnosis.Text+"', ha_4sequence="+ee+", ha_disch="+z+", ha_ref="+r+" where ha_id="+
                Convert.ToInt32(Request.QueryString["field2"]) + "");

            Response.Redirect("~/hospitalAdmission.aspx");
        }

        protected void diagnosis_TextChanged(object sender, EventArgs e)
        {
            
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            diagnosis.Text = GridView1.SelectedRow.Cells[1].Text;
            diagnosis.Enabled = false;
            GridView1.Visible = false;
            Button1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (diagnosis.Text.Length < 4) { }
            else
            {
                if (diagnosis.Enabled == false) { diagnosis.Enabled = true; Button1.Visible = false; }
                else
                {
                    GridView1.Visible = true;
                    int count = diagnosis.Text.Count(x => x == ' ');
                    if (count < 1)
                    {
                        
                        
                        SqlDataSource1.FilterExpression = "icd10Desc like '%" + diagnosis.Text + "%'";
                    }
                    else if (count==1) {
                        int index = diagnosis.Text.IndexOf(' ');
                        string t = diagnosis.Text.Substring(0, index);
                        string tt = diagnosis.Text.Substring(index + 1, diagnosis.Text.Length - index-1);
                        SqlDataSource1.FilterExpression = "icd10Desc like '%" + t + "%' and icd10Desc like '%"+tt+"%'";

                    }
                    else if (count > 1) {

                        string z = "icd10Desc like '%";        //count=5
                        int t = diagnosis.Text.IndexOf(' ', 0);   //t=5
                        int v=t+1;
                        z+= ""+diagnosis.Text.Substring(0,t)+"%'";
                        for(int i=0; i<count-1; i++)
                        {
                            t = diagnosis.Text.IndexOf(' ', v);
                            z += " and icd10Desc like '%" + diagnosis.Text.Substring(v, t-v) + "%'";
                            v = t + 1;
                        }
                        z += " and icd10Desc like '%" + diagnosis.Text.Substring(v, diagnosis.Text.Length - v - 1) + "%'";

                        SqlDataSource1.FilterExpression = z;

                    }

                }
                
            }
            
        }

        
    }
}