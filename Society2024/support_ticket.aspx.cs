using BusinessLogic.BL;
using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Society
{
    public partial class support_ticket : Page
    {
        Search_Society support = new Search_Society();
        BL_Society_Master bl_support = new BL_Society_Master();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                getTicket();
            }
        }

        protected void getTicket()
        {
            support.Sql_Operation = "SupportTicket";
            support.Society_Id = society_id.Value;
            var dt = bl_support.support_ticket(support);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //GridView1.Visible = dt.Rows.Count >= 1;
            //lblNoDataFound3.Visible = dt.Rows.Count == 0;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

        }
    }
}