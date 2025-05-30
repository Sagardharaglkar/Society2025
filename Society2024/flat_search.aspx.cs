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
using System.IO;
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Windows.Forms;
using System.Web.Services.Description;

namespace Society
{
    public partial class flat_search : System.Web.UI.Page
    {
        Flat flat = new Flat();
        BL_Flat_Master bL_Flat = new BL_Flat_Master();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }else
                society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                Flat_Gridbind();
                filldrop();
            }
        }
        public void filldrop()
        {
            String sql_query = "Select wing_id,(name + w_name) as name from global_society_view where society_id='" + society_id.Value + "'";
            bL_Flat.fill_drop(ddl_build_wing, sql_query, "name", "wing_id");

            String sql_query1 = "Select *  from types ";
            bL_Flat.fill_drop(ddl_type, sql_query1, "flat_type", "flat_type_id");

            String sql_query2 = "Select *  from flat_usage";
            bL_Flat.fill_drop(ddl_usage, sql_query2, "usage", "usage_id");

            String sql_query3 = "Select *  from bedroom";
            bL_Flat.fill_drop(ddl_bed, sql_query3, "bed", "bed_id");

        }


        public void Flat_Gridbind()
        {
            DataSet dt = new DataSet();
            dt = bL_Flat.getFlatDetails(society_id.Value);
            GridView1.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
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
            sb.Append(" Select * from flat where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }

            flat.Sql_Operation = sb.ToString();
            var result = bL_Flat.search_flat(flat);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }


        public void runproc_save(string operation)
        {
            if (flat_id.Value != "")
                flat.flat_id = Convert.ToInt32(flat_id.Value);
            flat.Sql_Operation = operation;
            flat.Society_Id = society_id.Value;
            flat.Flat_No = txt_no.Text;
            flat.wing_id = Convert.ToInt32(ddl_build_wing.SelectedValue.ToString());
            flat.flat_type_id = ddl_type.SelectedValue;
            flat.Usage_Id = Convert.ToInt32(ddl_usage.SelectedValue.ToString());
            flat.bed_id = Convert.ToInt32(ddl_bed.SelectedValue.ToString());
            flat.Sq_Ft = txt_feet.Text;
            flat.Terrace_Sq_Ft = txt_terrace.Text;
            flat.Intercom_No = txt_intercom.Text;
            bL_Flat.updateFlatDetails(flat);
        }

        public void runproc(string operation)
        {
          
            if (flat_id.Value != "")
                flat.flat_id = Convert.ToInt32(flat_id.Value);
            flat.Sql_Operation = operation;

            var result1 = bL_Flat.updateFlatDetails(flat);
            flat_id.Value = result1.flat_id.ToString();
            society_id.Value = result1.Society_Id;
            txt_no.Text = result1.Flat_No;
            ddl_build_wing.SelectedValue = result1.wing_id.ToString();
            ddl_type.SelectedValue = result1.flat_type_id.ToString();
            ddl_usage.SelectedValue = result1.Usage_Id.ToString();
            ddl_bed.SelectedValue = result1.bed_id.ToString();
            txt_feet.Text = result1.Sq_Ft;
            txt_terrace.Text = result1.Terrace_Sq_Ft;
            txt_intercom.Text = result1.Intercom_No;
        }

       
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            flat_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Label20.Text == "")
            {
                runproc_save("Update");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (flat_id.Value != "")
                    flat.flat_id = Convert.ToInt32(flat_id.Value);
                flat.Sql_Operation = "Delete";
                bL_Flat.FlatDelete(flat);
           
            Response.Redirect("flat_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("flat_search.aspx");
        }
      

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void txt_no_TextChanged(object sender, EventArgs e)
        {
            if (txt_no.Text.Trim() != "")
            {

                if (flat_id.Value != "")
                    flat.flat_id = Convert.ToInt32(flat_id.Value);
                flat.Society_Id = society_id.Value;
                flat.wing_id = Convert.ToInt32(ddl_build_wing.SelectedValue);
                flat.Sql_Operation = "check_no";
                flat.Flat_No = txt_no.Text;
                var result = bL_Flat.FlatTextChange(flat);
                Label20.Text = result.Sql_Result;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label flat_id = (System.Web.UI.WebControls.Label)row.FindControl("flat_id");
                flat.Sql_Operation = "Delete";

                flat.flat_id = Convert.ToInt32(flat_id.Text);
                bL_Flat.FlatDelete(flat);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
         
            Flat_Gridbind();

        }

        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Flat_Gridbind();
        }
    }
}


