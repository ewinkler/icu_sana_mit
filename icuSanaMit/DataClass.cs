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
using MySql.Data.Common;
using MySql.Data.MySqlClient;

namespace icuSanaMit
{
    public class DataClass
    {
        public static string SelectRecord(string sql, string variable)
        {

            string conn = WebConfigurationManager.ConnectionStrings["icu_sana_mitConnectionString"].ConnectionString;
            MySqlConnection co1 = new MySqlConnection(conn);
            MySqlCommand cmd1 = new MySqlCommand(sql, co1);
            MySqlDataReader reader1;
            co1.Open();
            reader1 = cmd1.ExecuteReader();
            reader1.Read();
            string i = reader1[variable].ToString();
            co1.Close();
            return i;
        }

        public static void insertRecord(string sql)
        {
      
            string conn = WebConfigurationManager.ConnectionStrings["icu_sana_mitConnectionString"].ConnectionString;
           // string conn= "server=localhost;user id=root;password=jariaSenSi0232i;persistsecurityinfo=True;database=icu_sana_mit";
            MySqlConnection co = new MySqlConnection(conn);
            MySqlCommand cmd = new MySqlCommand(sql, co);
            co.Open();
            cmd.ExecuteNonQuery();
            co.Close();
        }
    }
}