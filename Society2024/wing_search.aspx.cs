using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
//using System.Windows.Controls;
//using Azure;
using System.Drawing.Drawing2D;
using Page = System.Web.UI.Page;
using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
using System.Windows.Forms;
//using System.IdentityModel.Metadata;

namespace Society
{
    public partial class wing_search : System.Web.UI.Page
    {
        Wing wing = new Wing();
        BL_Wing_Master bL_Wing = new BL_Wing_Master();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
           {
               fill_drop1();
                Wing_GridBind();
            
            }

        }

        public void fill_drop1()
        {
            String sql_query = "Select *  from building_master where society_id='" + society_id.Value + "'";
            bL_Wing.fill_drop(ddl_build_name, sql_query, "name", "build_id");

        }


        public void Wing_GridBind()
        {
            DataSet dt = new DataSet();
            wing.Sql_Operation = "Grid_Show";
            wing.Society_Id = society_id.Value;
            dt = bL_Wing.getWingDetails(wing);
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataSource = dt.Tables[0];
            GridView1.DataBind();

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

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("Select * from global_society_view where active_status=0 and society_id='" + society_id.Value + "' ");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }

            wing.Sql_Operation = sb.ToString();
            var result = bL_Wing.search_wing(wing);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
    

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Label4.Text == "")
            {
                runproc_save("Update");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

        }

        public void runproc_save(string operation)
        {
            if (wing_id.Value != "")
                wing.wing_id = Convert.ToInt32(wing_id.Value);
            wing.Sql_Operation = operation;
            wing.Society_Id = society_id.Value;
            wing.build_id = Convert.ToInt32(ddl_build_name.SelectedValue);
            wing.W_Name = txt_w_name.Text;
            bL_Wing.updateWingDetails(wing);
        }

        public void runproc(string operation)
        {
            if (wing_id.Value != "")
              wing.wing_id = Convert.ToInt32(wing_id.Value);
            wing.Sql_Operation = operation;
            var result = bL_Wing.updateWingDetails(wing);
            wing_id.Value = result.wing_id.ToString();
            ddl_build_name.SelectedValue = result.build_id.ToString();
            txt_w_name.Text = result.W_Name;
           
            

        }


        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (wing_id.Value != "")
                    wing.wing_id = Convert.ToInt32(wing_id.Value);
                wing.Sql_Operation = "Delete";

                bL_Wing.delete(wing);
           
            Response.Redirect("wing_search.aspx");
        }


        protected void txt_w_name_TextChanged(object sender, EventArgs e)
        {
            if (txt_w_name.Text.Trim() != "")
            {
                if (wing_id.Value != "")
                    wing.wing_id = Convert.ToInt32(wing_id.Value);
                wing.W_Name = txt_w_name.Text;
                wing.build_id = Convert.ToInt32(ddl_build_name.SelectedValue);
                wing.Sql_Operation = "check_name";
                wing.Society_Id = society_id.Value;
                var result = bL_Wing.WingTextChanged(wing);
                Label4.Text = result.Sql_Result;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);
            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label wing_id = (System.Web.UI.WebControls.Label)row.FindControl("wing_id");
                wing.Sql_Operation = "Delete";

                wing.wing_id = Convert.ToInt32(wing_id.Text);

                bL_Wing.delete(wing);
           
            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            Wing_GridBind();
        }


        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            wing_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ScriptManager.RegisterStartupScript(this, wings.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);

            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Wing_GridBind();
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("wing_search.aspx");
        }

       
    } 
}


    
