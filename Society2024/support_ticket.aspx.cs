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
            }else
                society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                getTicket();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "ShowComments")
            //{
            //    int helpdeskId = Convert.ToInt32(e.CommandArgument);
            //    hfHelpdeskId.Value = helpdeskId.ToString();
            //    BindComments(helpdeskId);
            //    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#edit_model').modal('show');", true);
            //}
        }

        private void BindComments(int helpdeskId)
        {
            // Fetch comments from DB for this helpdeskId
            // Example: var comments = YourDataAccess.GetComments(helpdeskId);
            // rptComments.DataSource = comments;
            // rptComments.DataBind();
        }
        //protected void btnAddComment_Click(object sender, EventArgs e)
        //{

        //    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "$('#edit_model').modal('show');", true);
        //}

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