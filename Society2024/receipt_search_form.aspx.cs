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
using Utility.DataClass;
using BusinessLogic.BL;
using System.Windows.Forms;
//using System.IdentityModel.Metadata


namespace Society
{
    public partial class receipt_search_form : System.Web.UI.Page
    {

        receipt Receipt = new receipt();
        BL_Receipt bL_Receipt = new BL_Receipt();

       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
           
            if (!IsPostBack)
            {
                //runproc("Select");
                txt_date.Text = DateTime.Now.ToString("yyyy-MM-dd");
                Receipt_Gridbind();
                fill_dropdowns();
                fetch_receipt();
                panel2.Visible = false;
                btn_delete.Visible = true;

            }

        }

        public void fill_dropdowns()
        {
            //string sql1 = "SELECT * FROM dbo.wing_master where society_id='" + society_id.Value + "'";
            //st.fill_drop(ddl_wing, sql1, "w_name", "w_id");

            //string sql2 = "SELECT * FROM dbo.owner_master where society_id='" + society_id.Value + "'";
            //st.fill_drop(ddl_owner, sql2, "name", "owner_id");

            string sql3 = "SELECT * FROM dbo.building_master where society_id='" + society_id.Value + "'";
            bL_Receipt.fill_drop(ddl_build, sql3, "name", "build_id");
            //string sql1 = "SELECT distinct building_name  FROM  maintainance";
            //st.fill_drop(ddl_build, sql1, "building_name", "building_name");


            string sql4 = "SELECT * FROM dbo.pay_mode";
            bL_Receipt.fill_drop(drp_pay_status, sql4, "pay_mode", "pay_id");


        }

    
        protected void Receipt_Gridbind()
        {
            DataSet dt = new DataSet();
            Receipt.Sql_Operation = "Grid_Show";
            Receipt.Society_Id = society_id.Value;
            dt = bL_Receipt.GetReceipt(Receipt);
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

        public void fetch_receipt()
        {
            Receipt.Sql_Operation = "receipt_fetch";
            Receipt.Society_Id = society_id.Value;
            var result = bL_Receipt.fetch_receipt(Receipt);
            receipt_no.Text = result.Receipt_No;
        }

        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("receipt_search_form.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("Select * from receipt_search_vw where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            
            var result = bL_Receipt.search_receipt(sb.ToString());
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }
        public void runproc_save(string operation)
        {
            if (receipt_id.Value != "")
                Receipt.receipt_id = Convert.ToInt32(receipt_id.Value.ToString());
            Receipt.Sql_Operation = operation;
            Receipt.Society_Id = society_id.Value;
            //Receipt.Receipt_No = Convert.ToInt32(receipt_no_txt.Text);
            Receipt.Pay_Mode = Convert.ToInt32(drp_pay_status.SelectedValue);
            Receipt.Date = Convert.ToDateTime(txt_date.Text);
            Receipt.Owner_Id = Convert.ToInt32(ddl_owner.SelectedValue);
            Receipt.Recivable_Amt = float.Parse(txt_amount.Text);
           
            Receipt.build_id = Convert.ToInt32(ddl_build.SelectedValue);
            Receipt.Owner_Name = ddl_owner.SelectedItem.ToString();
            Receipt.Wing_Id = Convert.ToInt32(ddl_wing.SelectedValue);
            if (drp_pay_status.SelectedValue == "3")
            {
                Receipt.Chqno = ddl_chq.SelectedValue;
                Receipt.Chqdate = Convert.ToDateTime(txt_chqdate.Text);
            }
            if (drp_pay_status.SelectedValue == "2")
            {
                Receipt.Chqdate = Convert.ToDateTime(txt_chqdate.Text);
                Receipt.Chqno = txt_chqno.Text;
            }
            Receipt.Remarks = txt_remarks.Text;
            Receipt.Received_Amount = float.Parse(txt_received_amt.Text);
            Receipt.Balance = txt_pdc_balance.Text;
            bL_Receipt.UpdateReceipt(Receipt);

            //  data_item.Add(st.create_array("bill_no", string.IsNullOrWhiteSpace(ddl_bill.SelectedValue) ? (object)DBNull.Value : ddl_bill.SelectedValue));

        }

        public void runproc(string operation)
        {

            if (receipt_id.Value != "")
                Receipt.receipt_id = Convert.ToInt32(receipt_id.Value);
            Receipt.Sql_Operation = operation;
            var result = bL_Receipt.UpdateReceipt(Receipt);

            receipt_id.Value = result.receipt_id.ToString();
            society_id.Value = result.Society_Id.ToString();
            drp_pay_status.SelectedValue = result.Pay_Mode.ToString();
            txt_date.Text = result.Date.ToString("yyyy-MM-dd");

            txt_amount.Text = result.Recivable_Amt.ToString();
            ddl_build.SelectedValue = result.build_id.ToString();
            owner_id.Value = result.Owner_Id.ToString();
            wing_id.Value = result.Wing_Id.ToString();
            //ddl_bill.SelectedValue = result.Bill_No.ToString();
            if(result.Pay_Mode==3)
           ddl_chq.SelectedValue = result.Chqno;
            txt_chqdate.Text = result.Chqdate.ToString("yyyy-MM-dd");
            if (result.Pay_Mode == 2)
                txt_chqno.Text = result.Chqno;
            txt_remarks.Text = result.Remarks;
            txt_received_amt.Text = result.Received_Amount.ToString();
            txt_pdc_balance.Text = (result.Recivable_Amt - result.Received_Amount).ToString();
        }

        protected void print_save_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            receipt_id.Value = id;
            Session["receipt_no"] = receipt_id.Value;
            Response.Redirect("Receipt_printreport1.aspx");

        }


        public void paystatus_check()
        {
            if (Decimal.Parse(drp_pay_status.SelectedValue) == 1)
            {
                panel2.Visible = false;
                panel3.Visible = false;
                // adv_pay_settlement();
            }
            else if (Decimal.Parse(drp_pay_status.SelectedValue) == 2)
            {
                // panel1.Visible = False
                panel2.Visible = true;
                panel3.Visible = false;
                txt_chqno.Visible = true;
                ddl_chq.Visible = false;
                txt_chqdate.Enabled = true;
                che_amount.Enabled = true;


            }
            else if (Decimal.Parse(drp_pay_status.SelectedValue) == 3)
            {
                // panel1.Visible = True
                panel2.Visible = true;
                panel3.Visible = false;
                txt_chqno.Visible = false;
                ddl_chq.Visible = true;
                txt_chqdate.Enabled = false;
                che_amount.Enabled = false;


            }
            else if (Decimal.Parse(drp_pay_status.SelectedValue) == 4)
            {
                panel2.Visible = false;
                panel3.Visible = true;
                //adv_pay_settlement();
            }
        }
        public void pending()
        {

            Receipt.Sql_Operation = "pending_dues";
            Receipt.Owner_Id = Convert.ToInt32(ddl_owner.SelectedValue);
            Receipt.Balance = txt_pdc_balance.Text;
            Receipt.Received_Amount = float.Parse(txt_received_amt.Text);
            bL_Receipt.Pending_Receipt(Receipt);

        }
        public void adv_pay_settlement()
        {
            Receipt.Sql_Operation = "Settlement";
            Receipt.Owner_Id = Convert.ToInt32(ddl_owner.SelectedValue);
            var result = bL_Receipt.Advance_Pay_Settlement(Receipt);



            txt_pdc_balance.Text = result.Balance.ToString();



            if (Decimal.Parse(txt_pdc_balance.Text) > Decimal.Parse(txt_amount.Text))

                txt_received_amt.Text = txt_amount.Text;
            else
                txt_received_amt.Text = txt_pdc_balance.Text;

        }
        protected void btn_save_Click(object sender, System.EventArgs e)
        {

            //if (Decimal.Parse(txt_amount.Text) <= 0)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('InValid Amount');", true);
            //    txt_amount.Focus();
            //    return;
            //}



            if ((Decimal.Parse(drp_pay_status.SelectedValue) == 2))
            {
                if (txt_chqno.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Enter Cheque No.');", true);
                    txt_chqno.Focus();
                    return;
                }
            }
            
            runproc_save("Update");
            pending();
            // allsub.case_log_save(Session.Item("UserID"), "Insert Update In Receipt For " & receipt_no_txt.Text, "Receipt")
            Response.Redirect("receipt_search_form.aspx");
        }

        protected void btn_delete_Click(object sender, System.EventArgs e)
        {
                Receipt.Sql_Operation = "Delete";
                Receipt.receipt_id = Convert.ToInt32(receipt_id.Value);
                bL_Receipt.Delete_Receipt(Receipt);
           
            Response.Redirect("receipt_search_form.aspx");

        }

        protected void btn_close_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("receipt_search_form.aspx");
            //Response.Redirect("owner_detailsDataSet.aspx?view_id=" + Request.QueryString["view_id"]);

        }



        protected void drp_pay_status_SelectedIndexChanged(object sender, EventArgs e)
        {
            paystatus_check();
        }

        protected void txt_chqno_TextChanged(object sender, EventArgs e)
        {
            
        }
    


        public string generate_body()
        {
            System.Text.StringBuilder mymessage = new System.Text.StringBuilder();
            string new_date = "";
            if (txt_date.Text != "")
            {
                txt_date.Text = DateTime.Today.ToString("yyyy-MM-dd"); ;
                new_date = txt_date.Text.ToString();
            }

            mymessage.Append("<div style=\"font-size:100%\"><b>Hello Sir/Mam,</b></div>" + "</br>" + "<DIV><BR> </DIV>" + "Please Find Maintenance Bill Payment Receipt Attachment for <b> " + new_date + " " + DateTime.Now.Year + "</b>");
            return (mymessage.ToString());
        }

        protected void txt_che_amt_TextChanged(object sender, EventArgs e)
        {
            adv_pay_settlement();
        }

      

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            receipt_id.Value = id;
            Session["receipt_no"] = receipt_id.Value;
            runproc("Select");
            ddl_build_SelectedIndexChanged(sender, e);
            ddl_wing.SelectedValue = wing_id.Value;
            ddl_wing_SelectedIndexChanged(sender, e);
            ddl_owner.SelectedValue = owner_id.Value;
            ddl_owner_SelectedIndexChanged(sender, e);
            paystatus_check();
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

       

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_print_Click(object sender, EventArgs e)
        {

           
            Response.Redirect("Receipt_printreport1.aspx");
        }

        protected void txt_received_amt_TextChanged(object sender, EventArgs e)
        {
            
            txt_pdc_balance.Text = (Decimal.Parse(txt_amount.Text) - Decimal.Parse(txt_received_amt.Text)).ToString();
        }



        protected void ddl_owner_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_owner.SelectedValue != "select")
            {
                string sql1 = "Select  chqno from pdc_reminder where che_dep=1 and owner_id='" + ddl_owner.SelectedValue + "' ";
                bL_Receipt.fill_drop(ddl_chq, sql1, "chqno", "chqno");

                Receipt.Sql_Operation = "pending_balance";
                Receipt.Owner_Id = Convert.ToInt32(ddl_owner.SelectedValue);
                shop_maint_id.Value = ddl_owner.SelectedValue;
                var result = bL_Receipt.Owner_Pending_Balance(Receipt);

               
                txt_amount.Text = result.Balance ==null ?  "0": result.Balance.ToString() ;

               
            }
        }

        protected void ddl_build_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_build.Text != "select")
            {

                string sql1 = "Select distinct w_name,wing_id from global_society_view where  society_id='" + society_id.Value + "' and  build_id='" + ddl_build.SelectedValue + "' ";
                bL_Receipt.fill_drop(ddl_wing, sql1, "w_name", "wing_id");
                ddl_wing_SelectedIndexChanged(sender, e);

            }
           
        }

        protected void ddl_wing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_wing.Text != "select")
            {
                string sql1 = "Select distinct owner_id,name from owner_search_vw where society_id='" + society_id.Value + "' and wing_id='" + ddl_wing.SelectedValue + "' and  build_id='" + ddl_build.SelectedValue + "' ";
                bL_Receipt.fill_drop(ddl_owner, sql1, "name", "owner_id");
                ddl_owner_SelectedIndexChanged(sender, e);
            }
           
        }

      
        protected void txt_chqno_SelectedIndexChanged(object sender, EventArgs e)
        {
            Receipt.Sql_Operation = "cheque_select";
            Receipt.Chqno = ddl_chq.SelectedValue;
            Receipt.Owner_Id = Convert.ToInt32(ddl_owner.SelectedValue);
            var result = bL_Receipt.Cheque_Select(Receipt);

            txt_chqdate.Text = result.Chqdate.ToString("yyyy-MM-dd");
            che_amount.Text = result.Che_Amount.ToString();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Receipt_Gridbind();

        }

        protected void btn_email_Click(object sender, EventArgs e)
        {
        

        }

        //protected void print_save_Command(object sender, CommandEventArgs e)
        //{
        //    string id = e.CommandArgument.ToString();
        //    receipt_id.Value = id;
        //    Session["receipt_no"] = receipt_id.Value;
        //    Response.Redirect("Receipt_printreport1.aspx");
        //}
    }
}

    
