using Society;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using Microsoft.Reporting.WebForms;
using DBCode.DataClass.Master_Dataclass;
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.EnterpriseServices;
using System.Globalization;
using System.Data.SqlTypes;
using Society2024;
using System.Security.Cryptography;
using System.Web;
using System.IO;
using System.Windows.Forms;

namespace Society
{
    partial class visitor_search : Page
    {
        Visitor visitor = new Visitor();
        BL_Visitor_Master BL_Visitor = new BL_Visitor_Master();
        string path = null;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {

                btn_in.Visible = true;
                filldrop();
                Visitor_Gridbind();
                txt_in_date.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                txt_in_time.Text = DateTime.Now.ToShortTimeString().ToString();
                txt_out_date.Enabled = false;
                txt_out_time.Enabled = false;
            }


        }
        public void filldrop()
        {

            String sql_query2 = "Select *  from building_master where society_id ='" + society_id.Value + "'";
            BL_Visitor.fill_drop(ddl_build, sql_query2, "name", "build_id");

            String sql_query4 = "Select * from owner_search_vw where society_id ='" + society_id.Value + "'";
            BL_Visitor.fill_drop(ddl_flat, sql_query4, "unit", "flat_id");
        }


        public void Visitor_Gridbind()
        {
            DataSet dt = new DataSet();
            visitor.Sql_Operation = "Grid_Show";
            visitor.Society_Id = society_id.Value;
            dt = BL_Visitor.getVisitorDetails(visitor);
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
            sb.Append("Select * from visitor where society_id='" + society_id.Value + "'");
            if (drp_visiting_type.SelectedIndex != 0)
            {
                sb.Append(" and type = '" + drp_visiting_type.SelectedItem.Text + "'");
            }

            // From and To date conditions
            if (!string.IsNullOrWhiteSpace(txt_from.Text) && !string.IsNullOrWhiteSpace(txt_to.Text))
            {
                sb.Append(" And in_date BETWEEN cast('" + txt_from.Text + "' as smalldatetime) AND cast('" + txt_to.Text + "' as smalldatetime)");
            }
            
            visitor.Sql_Operation = sb.ToString();
            var result = BL_Visitor.search_visitor(visitor);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
        public void runproc_save(string operation)
        {

            if (FileUpload1.HasFiles)
            {

                foreach (HttpPostedFile file_name in FileUpload1.PostedFiles)
                {
                    file_name.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Documents") +  file_name.FileName));


                }

                path = System.IO.Path.Combine(Server.MapPath("~/Documents") + FileUpload1.FileName);


            }




            if (visitor_id.Value != "")
                visitor.visitor_id = Convert.ToInt32(visitor_id.Value);
            visitor.Sql_Operation = operation;
            visitor.V_Name = txt_v_name.Text;
            visitor.Society_Id = society_id.Value;
            visitor.V_Type = ddl_visiting_type.SelectedValue;
            visitor.In_Date = Convert.ToDateTime(txt_in_date.Text);
            if (txt_out_date.Text != "")
                visitor.Out_Date = Convert.ToDateTime(txt_out_date.Text);
            visitor.In_Time = Convert.ToDateTime(txt_in_time.Text);
            if (txt_out_time.Text != "")
                visitor.Out_Time = Convert.ToDateTime(txt_out_time.Text);
            visitor.Contact_No = txt_contact.Text;
            visitor.build_id = Convert.ToInt32(ddl_build.SelectedValue);
            visitor.flat_id = Convert.ToInt32(ddl_flat.SelectedValue);
            visitor.Vehical_No = txt_vehical_no.Text;
            visitor.Visiting_Purpose = txt_visiting_purpose.Text;
            visitor.Image = path;

            BL_Visitor.updateVisitorDetails(visitor);
        }

        public void runproc(string operation)
        {
            if (visitor_id.Value != "")
                visitor.visitor_id = Convert.ToInt32(visitor_id.Value);
            visitor.Sql_Operation = operation;
            var result = BL_Visitor.updateVisitorDetails(visitor);

            (visitor_id.Value) = result.visitor_id.ToString();
            society_id.Value = result.Society_Id;
            txt_v_name.Text = result.V_Name;
            ddl_visiting_type.SelectedValue = result.V_Type;
            txt_in_date.Text = result.In_Date.ToString("yyyy-MM-dd");
            if (result.Out_Date != DateTime.MinValue)
                txt_out_date.Text = result.Out_Date.ToString("yyyy-MM-dd");
            txt_in_time.Text = result.In_Time.ToString("hh:mm tt");
            if (result.Out_Time != DateTime.MinValue)
                txt_out_time.Text = result.Out_Time.ToString("hh:mm:ss");
            ddl_build.SelectedValue = result.build_id.ToString();
            ddl_flat.SelectedValue = result.flat_id.ToString();
            txt_contact.Text = result.Contact_No;
            txt_vehical_no.Text = result.Vehical_No;
            txt_visiting_purpose.Text = result.Visiting_Purpose;
            path = Path.GetFileName(result.Image);
            image.Text = path;
        }

        protected void btn_in_Click(object sender, EventArgs e)
        {
            runproc_save("Update");
            Response.Redirect("visitor_search.aspx");
        }

        protected void btn_out_Click(object sender, EventArgs e)
        {

            runproc_save("Update");
            Response.Redirect("visitor_search.aspx");
        }
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            visitor_id.Value = id;
            runproc("Select");
            if (txt_out_date.Text != "" || txt_out_time.Text != "")
            {
                btn_in.Visible = false;
                btn_out.Visible = false;
            }
            else
            {
                btn_in.Visible = false;
                btn_out.Visible = true;
            }
            txt_out_date.Enabled = true;
            txt_out_time.Enabled = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label visitor_id = (System.Web.UI.WebControls.Label)row.FindControl("visitor_id");
            visitor.Sql_Operation = "Delete";

            visitor.visitor_id = Convert.ToInt32(visitor_id.Text);
            BL_Visitor.deletevisitor(visitor);

            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            Visitor_Gridbind();

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("visitor_search.aspx");
        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            Response.Redirect("printvisitor.aspx");

        }

        protected void ddl_build_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_build.SelectedValue != "select")
            {
                string sql1 = "Select unit, flat_id from owner_search_vw where  society_id='" + society_id.Value + "'and  build_id=" + ddl_build.SelectedValue;
                BL_Visitor.fill_drop(ddl_flat, sql1, "unit", "flat_id");
            }
        }

        protected void ddl_visiting_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_visiting_type.SelectedValue == "Delivery")
            {
                delivary.Visible = true;


            }
            else
            {
                delivary.Visible = false;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Visitor_Gridbind();

        }
    }
}



