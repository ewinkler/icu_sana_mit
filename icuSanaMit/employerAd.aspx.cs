using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;
using System.Text;

namespace icuSanaMit
{
    public partial class employerAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            
            if (cookie != null)
            {
                if (Convert.ToInt16(cookie["group"]) > 2 )
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
            Label1.Visible = false;
            int x=Convert.ToInt16(cookie["group"]);
            int j = Convert.ToInt16(cookie["hosp"]);
            if (x > 1)
            {
                SqlDataSource3.FilterExpression = "ho_id = " + j + "";
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt16(DataClass.SelectRecord("SELECT EXISTS(SELECT * FROM employee WHERE em_login='" + loginName.Text + "') as expr", "expr")) == 1) {
                Label1.Visible = true;
            }
            else
            {
                DataClass.insertRecord("insert into employee (em_fname, em_lname, em_login, em_pwd, jo_id, em_mobile, em_status, eg_id, hosp) values('" +
                    firstName.Text + "', '" + lastName.Text + "', '" + loginName.Text + "', '" + pwd.Text + "', " + DropDownList1.SelectedValue + ", '" +
                    mobile.Text + "', " + DropDownList3.SelectedValue + ", " + DropDownList2.SelectedValue + ", " + DropDownList4.SelectedValue + ")");
                Response.Redirect("~/adminPanel.aspx");
            }
        }
    }
}