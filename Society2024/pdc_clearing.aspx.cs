using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Reflection.Emit;
using System.Web.Services.Description;
using DBCode.DataClass;
using BusinessLogic.BL;

namespace Society
{
    public partial class pdc_clearing : System.Web.UI.Page

    {
        pdc_reminder Reminder = new pdc_reminder();
        BL_Pdc_Reminder BL_Pdc = new BL_Pdc_Reminder();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    id.Value = Request.QueryString["id"].ToString();
                    runproc_save("Select");
                }
            }
        }
        
        public void runproc_save(string operation)
        {
            DataSet dt = new DataSet();
            Reminder.Sql_Operation = operation;
            Reminder.Start_Date = Convert.ToDateTime(txt_form_date.Text);
            Reminder.End_Date = Convert.ToDateTime(txt_to_date.Text);
           
            dt = BL_Pdc.updatePdcClearing(Reminder);
            GridView1.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataBind();

        }

        public void save_change()
        {
            
            
            foreach (GridViewRow row in GridView1.Rows)
            {
                Reminder.Sql_Operation = "save_change_rem";
                if (row.RowType == DataControlRowType.DataRow)
                {

                    CheckBox chk_deposit = (CheckBox)row.Cells[4].FindControl("chk_depo");
                    CheckBox chk_return = (CheckBox)row.Cells[5].FindControl("chk_ret");
                    CheckBox chk_cancel = (CheckBox)row.Cells[6].FindControl("chk_can");
                    System.Web.UI.WebControls.Label pid = (System.Web.UI.WebControls.Label)row.Cells[1].FindControl("parking_id");

                    Reminder.pdc_rem_id = Convert.ToInt32(pid.Text);
                    Reminder.Che_Dep = chk_deposit.Checked == true ? 1 : 0;
                    Reminder.Che_Ret = chk_return.Checked == true ? 1 : 0;
                    Reminder.Che_Can = chk_cancel.Checked == true ? 1 : 0;
                    BL_Pdc.save_change(Reminder);
                }
               
            }
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);










            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    data_item.Add(st.create_array("operation", "save_change_rem"));
            //    if (row.RowType == DataControlRowType.DataRow)
            //    {
            //        CheckBox chk_deposit = (CheckBox)row.Cells[4].FindControl("chk_depo");
            //        CheckBox chk_return = (CheckBox)row.Cells[5].FindControl("chk_ret");
            //        CheckBox chk_cancel = (CheckBox)row.Cells[6].FindControl("chk_can");
            //        System.Web.UI.WebControls.Label pid = (System.Web.UI.WebControls.Label)row.Cells[1].FindControl("parking_id");    
            //        data_item.Add(st.create_array("parking_id", string.IsNullOrWhiteSpace(pid.Text) ? (object)DBNull.Value : pid.Text));                    
            //        data_item.Add(st.create_array("che_dep", chk_deposit.Checked == true ? 1 : 0));
            //        data_item.Add(st.create_array("che_ret", chk_return.Checked == true ? 1 : 0));
            //        data_item.Add(st.create_array("che_can", chk_cancel.Checked == true ? 1 : 0));

            //    }
            //    status1 = st.run_query(data_item, "Update", "sp_pdc_reminder", ref sdr);
            //    data_item.Clear();
            //}

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
        protected void btn_save_Click(object sender, EventArgs e)
        {
            save_change();
            runproc_save("pdc_clear_grid_show");
        }
               
        protected void search_button_Click(object sender, EventArgs e)
        {
           runproc_save("pdc_clear_grid_show");
        }

        protected void chk_depo_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox activeCheckBox = sender as CheckBox;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk_deposit = (CheckBox)row.Cells[4].FindControl("chk_depo");
                CheckBox chk_return = (CheckBox)row.Cells[5].FindControl("chk_ret");
                CheckBox chk_cancel = (CheckBox)row.Cells[6].FindControl("chk_can");
                if (chk_deposit == activeCheckBox)
                {
                    chk_deposit.Checked = true;
                    chk_return.Checked = false;
                    chk_cancel.Checked = false;
                }
            }
        }

        protected void chk_ret_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox activeCheckBox = sender as CheckBox;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk_deposit = (CheckBox)row.Cells[4].FindControl("chk_depo");
                CheckBox chk_return = (CheckBox)row.Cells[5].FindControl("chk_ret");
                CheckBox chk_cancel = (CheckBox)row.Cells[6].FindControl("chk_can");
                if (chk_return == activeCheckBox)
                {
                    chk_deposit.Checked = false;
                    chk_return.Checked = true;
                    chk_cancel.Checked = false;
                }
            }
        }

        protected void chk_can_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox activeCheckBox = sender as CheckBox;

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk_deposit = (CheckBox)row.Cells[4].FindControl("chk_depo");
                CheckBox chk_return = (CheckBox)row.Cells[5].FindControl("chk_ret");
                CheckBox chk_cancel = (CheckBox)row.Cells[6].FindControl("chk_can");
                if (chk_cancel == activeCheckBox)
                {   
                    chk_deposit.Checked = false;
                    chk_return.Checked = false;
                    chk_cancel.Checked = true;
                }
            }
        }
    }
}