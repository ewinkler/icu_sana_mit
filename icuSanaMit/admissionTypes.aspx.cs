using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class admissionTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into types (type) values('" + TextBox1.Text + "')");
            Response.Close();
        }
    }
}