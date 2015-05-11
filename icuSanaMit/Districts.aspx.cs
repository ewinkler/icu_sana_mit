using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class Districts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                if (Convert.ToInt32(cookie["group"]) > 2)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource3.FilterExpression = "co_id=" + DropDownList1.SelectedValue + "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into district (di_province, di_district) values(" + DropDownList2.SelectedValue + ", '" + distr.Text + "')");
            Response.Redirect(Request.RawUrl);
        }
    }
}