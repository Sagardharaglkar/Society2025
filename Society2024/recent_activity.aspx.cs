using BusinessLogic.MasterBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society
{
    public partial class recent_activity : System.Web.UI.Page
    {

        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }

            if (!IsPostBack)
            {
                GetDataForRecent();
            }
        }

            public void GetDataForRecent()
        {

            details.Sql_Operation = "RecentActivity";
            details.Society_Id = Session["society_id"].ToString();

            var dt = BL_Login.get_recent_chart(details);

            GridView1.DataSource = dt;
            GridView1.DataBind();


        }
    }
}