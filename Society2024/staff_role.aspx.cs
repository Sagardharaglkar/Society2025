using BusinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Utility.DataClass;

namespace Society2024
{
    public partial class staff_role : System.Web.UI.Page
    {
        staff getstaff = new staff();
        BL_Staff bL_Staff = new BL_Staff();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                Role_GridBind();

            }

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
                runproc_save("Role_Update");
                Response.Redirect("staff_role.aspx");

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        public void Role_GridBind()
        {
            DataSet dt = new DataSet();
            getstaff.Sql_Operation = "Role_Show";
            getstaff.Society_Id = society_id.Value;
            dt = bL_Staff.getrole(getstaff);
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataSource = dt.Tables[0];
            GridView1.DataBind();
        }
        public void runproc_save(string operation)
        {
            if (role_id.Value != "")
                getstaff.role_id = Convert.ToInt32(role_id.Value);
            getstaff.Sql_Operation = operation;
            getstaff.Society_Id = society_id.Value;
            getstaff.role = txt_role.Text;
            bL_Staff.role_update(getstaff);
        }

        public void runproc(string operation)
        {
            if (role_id.Value != "")
                getstaff.role_id = Convert.ToInt32(role_id.Value);
            getstaff.Sql_Operation = operation;
            var result = bL_Staff.role_update(getstaff);
            txt_role.Text = result.role.ToString();
        }
        protected void btn_delete_Click(object sender, EventArgs e)
        {

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("staff_role.aspx");
        }

        protected void search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("select * from staff_role where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            getstaff.Sql_Operation = sb.ToString();
            var result = bL_Staff.search_staff(getstaff);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridView1.DataSource = dtrslt;
                GridView1.DataBind();
            }
        }

        protected void edit1_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            role_id.Value = id;
            runproc("Role_Select");
            //btn_delete.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
 
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label role_id = (System.Web.UI.WebControls.Label)row.FindControl("role_id");
            getstaff.Sql_Operation = "Role_Delete";

            getstaff.role_id = Convert.ToInt32(role_id.Text);
           bL_Staff.role_delete(getstaff);
           Role_GridBind();

        }

        protected void txt_role_TextChanged(object sender, EventArgs e)
        {
            if (txt_role.Text.Trim() != "")
            {
                if (role_id.Value != "")
                    getstaff.role_id = Convert.ToInt32(role_id.Value);
                getstaff.Sql_Operation = "check_role";
                getstaff.role = txt_role.Text;
                getstaff.Society_Id = society_id.Value;
                var result = bL_Staff.RoleTextChanged(getstaff);
                Label4.Text = result.Sql_Result;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Role_GridBind();
        }
    }
}