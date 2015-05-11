using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class Insurance1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into insurance (in_name, co_id) values('" + TextBox1.Text + "', " + DropDownList1.SelectedValue + ")");
            Response.Redirect(Request.RawUrl);
        }
    }
}