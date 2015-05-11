using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Configuration;
using System.Drawing.Printing;

namespace icuSanaMit
{
    public partial class ICUMonthlyStatistics : System.Web.UI.Page
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                HttpCookie cookie = Request.Cookies["userInfo"];
                int x = Convert.ToInt16(cookie["group"]);
                int j = Convert.ToInt16(cookie["hosp"]);
                if (x > 1)
                {
                    SqlDataSource1.FilterExpression = "(ha_dis_date>#" + Convert.ToDateTime(fdate.Text).ToString("yyyy-MM-dd") + "# or ha_dis_date is null) and ho_id="+j+"";
                    ReportParameter rp = new ReportParameter("fdate", fdate.Text);
                    this.ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp });
                    ReportParameter rp1 = new ReportParameter("ldate", ldate.Text);
                    this.ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp1 });
                    this.ReportViewer1.LocalReport.Refresh();
                }
                else
                {
                    SqlDataSource1.FilterExpression = "ha_dis_date>#" + Convert.ToDateTime(fdate.Text).ToString("yyyy-MM-dd") + "# or ha_dis_date is null";
                    ReportParameter rp = new ReportParameter("fdate", fdate.Text);
                    this.ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp });
                    ReportParameter rp1 = new ReportParameter("ldate", ldate.Text);
                    this.ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp1 });
                    this.ReportViewer1.LocalReport.Refresh();
                }
            }
            catch (FormatException) { }
        }
    }
}