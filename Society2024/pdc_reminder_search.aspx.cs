using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using Society;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Web.Configuration;
using System.Configuration;
using DBCode.DataClass;
using BusinessLogic.BL;

namespace Society
{
    partial class pdc_reminder_search : System.Web.UI.Page
    {
        pdc_reminder Reminder = new pdc_reminder();
        BL_Pdc_Reminder BL_Pdc = new BL_Pdc_Reminder();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }else
                society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                pdc_reminder_Gridbind();
                fill_drop();
                btn_delete.Visible = false;
            }

        }

        public void fill_drop()
        {
            String sql_query = "Select wing_id,(name +' '+ w_name) as name from global_society_view";
            BL_Pdc.fill_drop(ddl_build_wing, sql_query, "name", "wing_id");

            String sql_query1 = "Select build_wing_id as wing_id,build_wing as name from customer_flat";
            BL_Pdc.fill_drop(drp_build_wing, sql_query1, "name", "wing_id");

            string sql5 = "select owner_id,(name +' '+ flat_no) as name from customer_flat where society_id='" + society_id.Value + "'";
            BL_Pdc.fill_drop(ddl_owner, sql5, "name", "owner_id");

            string sql6 = "select owner_id,(name +' '+ flat_no) as name from customer_flat where society_id='" + society_id.Value + "'";
            BL_Pdc.fill_drop(drop_owner, sql6, "name", "owner_id");
        }

        public void pdc_reminder_Gridbind()
        {
            DataSet dt = new DataSet();
            Reminder.Sql_Operation = "Grid_Show";
            Reminder.Society_Id = society_id.Value;
            dt = BL_Pdc.getPdcReminder(Reminder);
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
        protected void txt_chq_no_TextChanged(object sender, EventArgs e)
        {
            if (txt_chq_no.Text.Trim() != "")
            {
                if (pdc_rem_id.Value != "")
                    Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value);
                Reminder.Sql_Operation = "check_chq_no_exists";
                Reminder.Chq_No = Convert.ToInt32(txt_chq_no.Text);
                var result = BL_Pdc.chqno_textchanged(Reminder);
                Label2.Text = result.Sql_Result;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(" SELECT TOP (100) PERCENT dbo.global_society_view.w_name, dbo.global_society_view.name, dbo.pdc_reminder.pdc_rem_id,dbo.global_society_view.wing_id , dbo.pdc_reminder.owner_id, dbo.pdc_reminder.o_name,dbo.pdc_reminder.chqno, dbo.pdc_reminder.che_amount, dbo.pdc_reminder.che_date, dbo.pdc_reminder.che_dep, dbo.pdc_reminder.che_ret, dbo.pdc_reminder.che_can, dbo.pdc_reminder.society_id FROM  dbo.pdc_reminder INNER JOIN dbo.global_society_view ON dbo.pdc_reminder.wing_id = dbo.global_society_view.wing_id  WHERE(dbo.pdc_reminder.active_status=0 and dbo.pdc_reminder.society_id = '" + society_id.Value + "')");
            if (drp_build_wing.SelectedValue != "" || drop_owner.SelectedValue != "")
            {
                sb.Append(" AND dbo.pdc_reminder.wing_id='" + drp_build_wing.SelectedValue + "' And dbo.pdc_reminder.owner_id='" + drop_owner.SelectedValue + "'");
            }
            Reminder.Sql_Operation = sb.ToString();
            var result = BL_Pdc.search_reminder(Reminder);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }



        public void runproc_save(string operation1)
        {
            if (pdc_rem_id.Value != "")
                Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value.ToString());
            Reminder.Sql_Operation = operation1;
            Reminder.Society_Id = society_id.Value;
            Reminder.owner_id = Convert.ToInt32(ddl_owner.SelectedValue);
            Reminder.O_Name = ddl_owner.SelectedItem.Text;
            Reminder.wing_id = Convert.ToInt32(ddl_build_wing.SelectedValue);
            Reminder.Chq_No = Convert.ToInt32(txt_chq_no.Text);
            Reminder.Che_Date = Convert.ToDateTime(txt_chq_date.Text);
            Reminder.Che_Amount = float.Parse(txt_chq_amount.Text);
            Reminder.Che_Dep = deposite_chk.Checked == true ? 1 : 0;
            Reminder.Che_Can = bounce_chk.Checked == true ? 1 : 0;
            Reminder.Che_Ret = return_chk.Checked == true ? 1 : 0;
            BL_Pdc.updatePdcReminder(Reminder);

        }

        public void runproc(string operation)
        {
            if (pdc_rem_id.Value != "")
                Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value);
            Reminder.Sql_Operation = operation;

            var result = BL_Pdc.updatePdcReminder(Reminder);

            (pdc_rem_id.Value) = result.pdc_rem_id.ToString();
            society_id.Value = result.Society_Id;
            ddl_owner.SelectedValue = result.owner_id.ToString();

            ddl_build_wing.SelectedItem.Text = result.wing_id.ToString();
            txt_chq_no.Text = result.Chq_No.ToString();
            txt_chq_date.Text = result.Che_Date.ToString("yyyy-MM-dd");
            txt_chq_amount.Text = result.Che_Amount.ToString();

            if (result.Che_Dep != 0)
            {
                deposite_chk.Checked = true;
            }

            if (result.Che_Can != 0)
            {
                bounce_chk.Checked = true;
            }

            if (result.Che_Ret != 0)
            {
                return_chk.Checked = true;
            }

        }

        protected void ddl_owner_SelectedIndexChanged(object sender, EventArgs e)
        {

            Reminder.owner_id = Convert.ToInt32(ddl_owner.SelectedValue);
            Reminder.Sql_Operation = "owner_select";

            var result = BL_Pdc.owner_selectedindexchanged(Reminder);

            txt_pre_addr1.Text = result.Pre_Addr1;
            txt_pre_addr2.Text = result.Pre_Addr2;
            txt_pre_mob.Text = result.Pre_Mob.ToString();
            ddl_build_wing.SelectedValue = result.wing_id.ToString();
            txt_email.Text = result.Email;
            txt_add_mob.Text = result.Alter_Mob.ToString();
            txt_pre_addr1.Enabled = false;
            txt_pre_addr2.Enabled = false;
            txt_pre_mob.Enabled = false;
            txt_add_mob.Enabled = false;
            txt_email.Enabled = false;

        }


        public void save_change()
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            //SqlDataReader sdr = null;

            Label acc_no = new Label(), chq_no = new Label(), pdc_id = new Label(), che_date = new Label(), che_amt = new Label();
            CheckBox depo_chk = new CheckBox(), ret_chk = new CheckBox(), bou_chk = new CheckBox();

            foreach (GridViewRow row in GridView1.Rows)
            {

                data_item.Clear();

                if (pdc_rem_id.Value != "")
                    Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value.ToString());
                Reminder.Sql_Operation = "save_change_rem";
                Reminder.Che_Date = Convert.ToDateTime(txt_chq_date.Text);
                Reminder.Che_Amount = float.Parse(txt_chq_amount.Text);
                Reminder.Che_Dep = deposite_chk.Checked == true ? 1 : 0;
                Reminder.Che_Can = bounce_chk.Checked == true ? 1 : 0;
                Reminder.Che_Ret = return_chk.Checked == true ? 1 : 0;
                BL_Pdc.save_changes(Reminder);

            }
        }


        public void grid_show()
        {
            DataSet dt = new DataSet();
            Reminder.Sql_Operation = "ownerwise_cheq";
            //Reminder.owner_id = Convert.ToInt32(ddl_owner.SelectedValue);
            dt = BL_Pdc.ownergrid(Reminder);
            GridView2.DataSource = dt.Tables[0];
            GridView2.DataBind();
        }
        public void clear()
        {
            txt_chq_no.Text = "";
            txt_chq_date.Text = "";
            txt_chq_amount.Text = "";
            deposite_chk.Checked = false;
            return_chk.Checked = false;
            bounce_chk.Checked = false;
        }


        protected void btn_delete_Click(object sender, System.EventArgs e)
        {
            SqlDataReader sdr = null;
            string status = "";
            if (pdc_rem_id.Value != "")
                Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value);
            Reminder.Sql_Operation = "Delete";
            BL_Pdc.delete(Reminder);
            if (status == "Done")
            {
                if (sdr.Read())
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record Is In Use. Cant Delete!!!');", true);
                    return;
                }
                else
                {
                    runproc_save("Delete");
                    Response.Redirect("pdc_reminder_search.aspx");
                }
            }

            else

                Response.Write(status);

        }

        protected void btn_close_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("pdc_reminder_search.aspx");
        }


        protected void btn_next_Click(object sender, EventArgs e)
        {
            if (txt_chq_no.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Cheque No !!!');", true);
                return;
            }
            if (txt_chq_date.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Cheque Date !!!');", true);
                return;
            }
            if (txt_chq_amount.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Cheque Amount!!!');", true);
                return;
            }

            if (pdc_rem_id.Value != "")
                Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Value);
            Reminder.Chq_No = Convert.ToInt32(txt_chq_no.Text);
            Reminder.Sql_Operation = "chq_no_exist";

            var result = BL_Pdc.next_click(Reminder);

            if (result.Sql_Result == "Exist")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Cheque No Already Exists !!!');", true);
                return;
            }
            else
                runproc_save("Update");
            clear();
            grid_show();

        }



        protected void btn_save_Click(object sender, EventArgs e)
        {
            runproc_save("Update");
            save_change();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
           
        }


        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            pdc_rem_id.Value = id;
            runproc("Select");
            ddl_owner_SelectedIndexChanged(sender, e);
            grid_show();
           
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label pdc_rem_id = (Label)row.FindControl("pdc_rem_id");
            Reminder.Sql_Operation = "Delete";

            Reminder.pdc_rem_id = Convert.ToInt32(pdc_rem_id.Text);
            BL_Pdc.delete(Reminder);
            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            pdc_reminder_Gridbind();
        }

        protected void drp_build_wing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drp_build_wing.SelectedItem.Text.Trim() != "")
            {
                if (drp_build_wing.SelectedItem.Text != "select")
                {
                    string sql2 = "select owner_id,(name +' '+ flat_no) as name from customer_flat where society_id='" + society_id.Value + "' and build_wing='" + drp_build_wing.SelectedItem.Text + "'";
                    BL_Pdc.fill_drop(drop_owner, sql2, "name", "owner_id");
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            pdc_reminder_Gridbind();
        }
    }
}
