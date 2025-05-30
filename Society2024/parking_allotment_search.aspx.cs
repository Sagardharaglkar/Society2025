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
using DBCode.DataClass.Master_Dataclass;
using BusinessLogic.MasterBL;
using BusinessLogic;
using BusinessLogic.BL;
using System.Windows.Forms;

namespace Society
{
    public partial class parking_allotment_search : System.Web.UI.Page
    {
        Parking parking = new Parking();
        BL_Parking_Allotment parking_Allotment = new BL_Parking_Allotment();
      
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Park_Allotment_GridBind();
                fill_drop1();
            }
            
        }
        public void fill_drop1()
        {
            String sql_query = "Select *  from parking where society_id='" + society_id.Value + "'";
            parking_Allotment.fill_drop(ddl_place, sql_query, "parking_no", "place_id");
        }


        public void Park_Allotment_GridBind()
        {
            DataSet dt = new DataSet();
            parking.Sql_Operation = "Grid_Show";
            parking.Society_Id = society_id.Value;
            dt = parking_Allotment.GetParkingAllotment(parking);
           
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
            sb.Append(" Select * from parking_master  where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            parking.Sql_Operation = sb.ToString();
            var result = parking_Allotment.search_park(parking);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();

        }
        public void runproc_save(String operation)
        {
            if (parking_id.Value != "")
                parking.parking_id = Convert.ToInt32(parking_id.Value.ToString());
            parking.Sql_Operation = operation;
            parking.Society_Id = society_id.Value;
            parking.Name = txt_name.Text;
            parking.Park_For = ddl_park_for.SelectedItem.Text;
            parking.Park_Type = ddl_type.Text;
            parking.Contact_No = txt_contact_no.Text;
            parking.Vehicle_No = txt_vehical_no.Text;
            parking.place_id = Convert.ToInt32(ddl_place.SelectedValue.ToString());
            parking_Allotment.UpdateParkingAllotment(parking);

        }

        public void runproc(string operation)
        {
            if (parking_id.Value != "")
                parking.parking_id = Convert.ToInt32(parking_id.Value);
            parking.Sql_Operation = operation;
            var result = parking_Allotment.UpdateParkingAllotment(parking);

            parking_id.Value = result.parking_id.ToString();
            society_id.Value = result.Society_Id;
            txt_name.Text = result.Name;
            ddl_park_for.SelectedValue = result.Park_For;
            ddl_type.Text = result.Park_Type;
            txt_contact_no.Text = result.Contact_No;
            txt_vehical_no.Text = result.Vehicle_No;
            ddl_place.SelectedValue = result.place_id.ToString();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (Label8.Text == "")
            {
                runproc_save("Update");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            }
        }

        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_type.SelectedItem.Text == "Temporary")
            {
                Panel1.Visible = true;
            }
        }
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            parking_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
        }
        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (parking_id.Value != "")
                    parking.parking_id = Convert.ToInt32(parking_id.Value);
                parking.Sql_Operation = "Delete";
                parking_Allotment.Parking_Delete(parking);
          
            Response.Redirect("parking_allotment_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("parking_allotment_search.aspx");
        }

        protected void ddl_park_for_SelectedIndexChanged(object sender, EventArgs e)
        {
            String sql_query = "Select *  from parking where park_for='" + ddl_park_for.SelectedValue + "' and society_id='"+ society_id.Value +"'";
            parking_Allotment.fill_drop(ddl_place, sql_query, "parking_no", "place_id");

        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label parking_id = (System.Web.UI.WebControls.Label)row.FindControl("parking_id");
                parking.Sql_Operation = "Delete";

                parking.parking_id = Convert.ToInt32(parking_id.Text);
                parking_Allotment.Parking_Delete(parking);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
          
            Park_Allotment_GridBind();
        }

        protected void txt_vehical_no_TextChanged(object sender, EventArgs e)
        {
            if (parking_id.Value != "")
                parking.parking_id = Convert.ToInt32(parking_id.Value);
            parking.Sql_Operation = "check_no";
            parking.Vehicle_No = txt_vehical_no.Text;
            var result = parking_Allotment.Vehicle_No_Textchanged(parking);
            Label8.Text = result.Sql_Result;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Park_Allotment_GridBind();
        }
    }

}


    
