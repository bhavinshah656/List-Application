using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace List_Application
{
    public partial class List_Application : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=W27109601XVTY\SQLEXPRESS;Initial Catalog=TaskDemo;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            cn.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = cn;
            cmd1.CommandText = "insert into Task values(@name,@isComplete,@priority)";
            cmd1.Parameters.AddWithValue("@name", txtitem.Text);
            cmd1.Parameters.AddWithValue("@isComplete", false);
            cmd1.Parameters.AddWithValue("@priority", 1);
            int f1 = cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();
            if (f1 > 0)
            {
                txtitem.Text = " ";
            }
            GridView1.DataBind();
            cmd1.Dispose();
            cn.Close();
        }
    }
}