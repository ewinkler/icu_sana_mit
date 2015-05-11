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
    public partial class PatientInformation : System.Web.UI.Page
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
                SqlDataSource1.FilterExpression = "ho_id = " + j + "";
            }
            if (fname.Text.Length < 2)
            {

                SqlDataSource1.FilterExpression = "ha_id=999999999";
                SqlDataSource2.FilterExpression = "ha_id=999999999";
                
            }
            else { }
            if (Request.QueryString["hh"] == "l") { }
            else
            {
                if (!IsPostBack)
                {
                    if (x > 1)
                    {
                        this.ReportViewer1.Visible = true;
                        string d = Request.QueryString["hh"];
                        SqlDataSource2.FilterExpression = "ha_id=" + d + " and ho_id="+j+"";
                        this.ReportViewer1.LocalReport.Refresh();
                        ReportViewer1.ShowPrintButton = true;
                    }
                    else {
                        this.ReportViewer1.Visible = true;
                        string d = Request.QueryString["hh"];
                        SqlDataSource2.FilterExpression = "ha_id=" + d + "";
                        this.ReportViewer1.LocalReport.Refresh();
                        ReportViewer1.ShowPrintButton = true;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource2.FilterExpression = "ha_id=0";
            this.ReportViewer1.LocalReport.Refresh();
            HttpCookie cookie = Request.Cookies["userInfo"];
            int x = Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                SqlDataSource1.FilterExpression = "pa_fname like '%" + fname.Text + "%' and pa_lname like '%" + lname.Text + "%' and ho_id="+j+"";
            }
            else { SqlDataSource1.FilterExpression = "pa_fname like '%" + fname.Text + "%' and pa_lname like '%" + lname.Text + "%'"; }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            int x = Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                this.ReportViewer1.Visible = true;
                int d = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                SqlDataSource2.FilterExpression = "ha_id=" + d + " and ho_id="+j+"";
                this.ReportViewer1.LocalReport.Refresh();
                ReportViewer1.ShowPrintButton = true;
            }
            else
            {
                this.ReportViewer1.Visible = true;
                int d = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                SqlDataSource2.FilterExpression = "ha_id=" + d + "";
                this.ReportViewer1.LocalReport.Refresh();
                ReportViewer1.ShowPrintButton = true;
            }
        }


        protected void Button2_Click1(object sender, EventArgs e)
        {
            SqlDataSource2.FilterExpression = "ha_id=0";
            this.ReportViewer1.LocalReport.Refresh();
            HttpCookie cookie = Request.Cookies["userInfo"];
            int x = Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                SqlDataSource1.FilterExpression = "pa_mhr like '"+mhr.Text+"' and ho_id=" + j + "";
            }
            else { SqlDataSource1.FilterExpression = "pa_mhr like '" + mhr.Text + "'"; }
        }


        
    }
}