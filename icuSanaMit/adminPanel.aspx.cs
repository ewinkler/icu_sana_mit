using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class adminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                if (Convert.ToInt16(cookie["group"]) > 2)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else {
                Response.Redirect("~/Default.aspx");
            }
            int x = Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                SqlDataSource1.FilterExpression = "hosp = " + j + "";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/employerAd.aspx");
        }
    }
}