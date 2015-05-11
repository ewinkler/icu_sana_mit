using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icuSanaMit
{
    public partial class reasonIcuAdmission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataClass.insertRecord("insert into reason_icuadmission (re_description) values('"+TextBox1.Text+"')");
            Response.Close();
        }
    }
}