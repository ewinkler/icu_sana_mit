using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace icuSanaMit
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            HttpCookie cookie = Request.Cookies["userInfo"];
   
                if (cookie != null)
                {
                    user.Visible = true; hello.Visible = true; signout.Visible = true; error.Visible = false;
                    string j = cookie["name"];
                    user.Text = j;
                    Label2.Text = DataClass.SelectRecord("select eg_id from employee where em_login='" + cookie["Name"] + "'", "eg_id");

                    Table1.Visible = false;
                    if (cookie["goup"]=="3")
                    {
                        MenuItemCollection menuItems = NavigationMenu.Items;
                        MenuItem adminItem = new MenuItem();
                        foreach (MenuItem menuItem in menuItems)
                        {
                            if (menuItem.Text == "Administration panel")
                                adminItem = menuItem;
                        }
                        menuItems.Remove(adminItem);
                    }
                    if (cookie["group"] == "1")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = true;
                        NavigationMenu.Items[3].Enabled = true;
                    }
                    else if (cookie["group"] == "2")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = true;
                        NavigationMenu.Items[3].Enabled = true;
                    }
                    else if (cookie["group"] == "3")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = true;
                    }
                    else if (cookie["group"] == "4")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = false;
                    }
                    else
                    {
                        NavigationMenu.Visible = false;
                        hello.Visible = false; user.Visible = false; Label2.Text = "0"; signout.Visible = false; Table1.Visible = true; error.Visible = false;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = false;
                        NavigationMenu.Items[2].Enabled = false;
                    }
                }
                else
                {

                    NavigationMenu.Visible = false;
                        hello.Visible = false; user.Visible = false; Label2.Text = "0"; signout.Visible = false; Table1.Visible = true; error.Visible = false;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = false;
                        NavigationMenu.Items[2].Enabled = false;
                    
                }
                
        }

        protected void Button1_click(object sender, EventArgs e)
        {
            try
            {
                string x = DataClass.SelectRecord("select em_pwd from employee where em_login='" + textBox1.Text + "'", "em_pwd");
                if (x == pass.Text)
                {
                    //Response.Cookies["userName"].Value = textBox1.Text;
                    //Response.Cookies["userName"].Expires = DateTime.Now.AddHours(1);
                    HttpCookie cookies = new HttpCookie("userInfo");
                    cookies["Name"] = textBox1.Text;
                    cookies["group"] = DataClass.SelectRecord("select eg_id from employee where em_login='" + textBox1.Text + "'", "eg_id");
                    cookies["hosp"] = DataClass.SelectRecord("select hosp from employee where em_login='" + textBox1.Text + "'", "hosp");
                    cookies.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookies);
                    HttpCookie cookie = Request.Cookies["userInfo"];

                    Table1.Visible = false;
                    hello.Visible = true; user.Visible = true;
                    user.Text = DataClass.SelectRecord("select em_fname from employee where em_login='" + cookie["Name"] + "'", "em_fname");
                    signout.Visible = true;
                    Label2.Text = DataClass.SelectRecord("select eg_id from employee where em_login='" + cookie["Name"] + "'", "eg_id");

                    if (cookie["group"] == "1")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = true;
                        NavigationMenu.Items[3].Enabled = true;

                    }
                    else if (cookie["group"] == "2")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = true;
                        NavigationMenu.Items[3].Enabled = true;
                    }
                    else if (cookie["group"] == "3")
                    {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = true;
                    }
                    else if (cookie["group"] == "4") {
                        NavigationMenu.Visible = true;
                        NavigationMenu.Items[2].Enabled = true;
                        NavigationMenu.Items[4].Enabled = false;
                        NavigationMenu.Items[3].Enabled = false;
                    }
                }
                else
                {
                    error.Visible = true; Label2.Text = "0";
                    error.Text = "Password was not typed correctly!";
                }
            }
            catch (Exception)
            {
                error.Visible = true;
                error.Text = "There is no user registered with this name";
            }
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            
            HttpCookie cookie = Request.Cookies["userInfo"];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Label2.Text = "0";
            Response.Redirect("~/Default.aspx");
            NavigationMenu.Items[4].Enabled = false;
            NavigationMenu.Items[3].Enabled = false;
            NavigationMenu.Items[2].Enabled = false;
            NavigationMenu.Visible = false;
        }
    }
}
