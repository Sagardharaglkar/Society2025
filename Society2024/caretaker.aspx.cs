using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using Page = System.Web.UI.Page;
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Windows.Forms;
using System.Web.UI;
using BusinessLogic.BL;
//using System.IdentityModel.Metadata;

namespace Society
{
    public partial class caretaker : Page
    {
        BL_FillRepeater repeater = new BL_FillRepeater();
        BL_CareTaker_Master bL_Caretaker = new BL_CareTaker_Master();
        Caretaker care = new Caretaker();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }else
                society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                String str1 = "Select wing_id,(name + w_name) as name from global_society_view";
                repeater.fill_list(Repeater1, str1);

                String str2 = "Select *  from doc_master";
                repeater.fill_list(Repeater2, str2);

                String str3 = "Select *  from state";
                repeater.fill_list(Repeater3, str3);

                Caretaker_Gridbind();
                //fill_drop1();
            }
        }

        protected void CategoryRepeater_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                building_wing_id.Value = e.CommandArgument.ToString();
            }

        }

        protected void CategoryRepeater_ItemCommand2(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                doc_id.Value = e.CommandArgument.ToString();

            }

        }


        protected void CategoryRepeater_ItemCommand3(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                state_id.Value = e.CommandArgument.ToString();

            }
        }
        public void fill_drop1()
        {

            //String sql_query = "Select *  from doc_master";
            //bL_Caretaker.fill_drop(ddl_doc_name, sql_query, "doc_name", "doc_id");

            //String sql_query1 = "Select *  from state";
            //bL_Caretaker.fill_drop(ddl_state, sql_query1, "state", "state_id");

            //String sql_query2 = "Select wing_id,(name + w_name) as name from global_society_view";
            //bL_Caretaker.fill_drop(ddl_build_wing1, sql_query2, "name", "wing_id");
        }

        public void Caretaker_Gridbind()
        {
            DataSet dt = new DataSet();
            dt = bL_Caretaker.CareTakerDetails(society_id.Value);
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
            sb.Append(" Select * from caretaker_master where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '%" + txt_search.Text + "%'");
            }
            care.Sql_Operation = sb.ToString();
            var result = bL_Caretaker.search_caretaker(care);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }

        public void runproc_save(string operation)
        {
            if (caretaker_id.Value != "")
                care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
            care.Sql_Operation = operation;
            care.Society_Id = society_id.Value;
            care.Wing_Id = Convert.ToInt32(building_wing_id.Value.ToString());
            care.Flat_No = txt_flat_no.Text;
            care.C_Name = txt_c_name.Text;
            care.doc_id = Convert.ToInt32(doc_id.Value.ToString());
            care.C_Address = txt_c_address.Text;
            care.Area = txt_area.Text;
            care.Mobile_No = txt_mobile_no.Text;
            care.Email = txt_email.Text;
            care.City = txt_city.Text;
            care.State_Id = Convert.ToInt32(state_id.Value.ToString());
            care.Pincode = txt_pincode.Text;
            //care.Doc_Executed = txt_doc_executed.Text;
            bL_Caretaker.updateCareTakerDetails(care);
        }

        public void runproc(string operation)
        {
            if (caretaker_id.Value != "")
               care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
            care.Sql_Operation = operation;
            var result = bL_Caretaker.updateCareTakerDetails(care);

            caretaker_id.Value = result.Caretaker_Id.ToString();
            society_id.Value = result.Society_Id;
            wing_id.Value = result.Wing_Id.ToString();
            txt_flat_no.Text = result.Flat_No;
            txt_c_name.Text = result.C_Name;
            doc_id.Value = result.doc_id.ToString();
            txt_c_address.Text = result.C_Address;
            txt_area.Text = result.Area;
            txt_mobile_no.Text = result.Mobile_No;
            txt_email.Text = result.Email;
            txt_city.Text = result.City;
            state_id.Value = result.State_Id.ToString();
            txt_pincode.Text = result.Pincode;
            //txt_doc_executed.Text = result.Doc_Executed;

        }


        protected void btn_save_Click(object sender, EventArgs e)
        {
            //if (Label13.Text == "")
            //{
                runproc_save("Update");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            //}
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("caretaker.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
                if (caretaker_id.Value != "")
                    care.Caretaker_Id = Convert.ToInt32(caretaker_id.Value);
                care.Sql_Operation = "Delete";
                bL_Caretaker.delete(care);
            
            Response.Redirect("caretaker.aspx");

        }



        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            caretaker_id.Value = id;
            runproc("Select");
            btn_delete.Visible = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label c_id = (System.Web.UI.WebControls.Label)row.FindControl("caretaker_id");
                care.Sql_Operation = "Delete";

                care.Caretaker_Id = Convert.ToInt32(c_id.Text);
                bL_Caretaker.delete(care);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
          
            Caretaker_Gridbind();
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
            Caretaker_Gridbind();
        }
    }
}
