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
using DBCode.DataClass;
using BusinessLogic.MasterBL;
using DocumentFormat.OpenXml.Bibliography;
using BusinessLogic.BL;

//using CrystalDecisions.CrystalReports.Engine;
//using CrystalDecisions.Windows.Forms;

namespace Society
{
    public partial class maintenance_search : System.Web.UI.Page
    {
        BL_FillRepeater repeater = new BL_FillRepeater();
        maintenance Maintenance1 = new maintenance();
        BL_Maintenance_Master bL_Maintenance = new BL_Maintenance_Master();

        DataTable dt1 = new DataTable();


   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }else
                society_id.Value = Session["society_id"].ToString();


            if (!IsPostBack)
            {
                //runproc("Select");

                //filldrop();
                maintenance_Gridbind();


                String str1 = "SELECT  * FROM  dbo.building_master where society_id='" + society_id.Value + "'";
                repeater.fill_list(Repeater1, str1);

                String str2 = "SELECT * from wing_master where society_id='" + society_id.Value + "'";
                repeater.fill_list_maintanace(Repeater2, str2);


                if (Request.QueryString["id"] != null)
                {
                    //cust_id.Value = Request.QueryString["id"].ToString();

                }


            }

        }
        protected void Allbound()
        {
            String str1 = "SELECT  * FROM  dbo.building_master where society_id='" + society_id.Value + "'";
            repeater.fill_list(Repeater1, str1);

            String str2 = "Select distinct wing_id,w_name from wing_master where society_id='" + society_id.Value + "' and  build_id='" + building_id.Value + "'";
            repeater.fill_list_maintanace(Repeater2, str2);
        }

        protected void CategoryRepeater_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                building_id.Value = e.CommandArgument.ToString();
                string str1 = "Select distinct wing_id,w_name from wing_master where society_id='" + society_id.Value + "' and  build_id='" + building_id.Value + "'";
                repeater.fill_list_maintanace(Repeater2, str1);
            }

        }

        protected void CategoryRepeater_ItemCommand2(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                wing_id.Value = e.CommandArgument.ToString();
               
            }

        }
        public void filldrop()
        {

            //string sql = "SELECT  * FROM  dbo.building_master where society_id='" + society_id.Value + "'";
            //bL_Maintenance.fill_drop(drop_build, sql, "name", "build_id");

            //string sql2 = "SELECT * from wing_master where society_id='" + society_id.Value + "'";
            //bL_Maintenance.fill_drop(drp_wing, sql2, "w_name", "wing_id");

            //string sql3 = "SELECT distinct  build_id, name FROM  dbo.building_master  where society_id='" + society_id.Value + "' order by name";
            //bL_Maintenance.fill_drop(drp_build, sql3, "name", "build_id");



        }

        public void maintenance_Gridbind()
        {
            DataSet dt = new DataSet();
            Maintenance1.Sql_Operation = "Grid_Show";
            Maintenance1.Society_Id = society_id.Value;
            dt = bL_Maintenance.getMaintenanceDetails(Maintenance1);
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


        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("new_maintenance.aspx");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        public void runproc_save(string operation)
        {

            Maintenance1.Sql_Operation = "exfetch";
            Maintenance1.build_id = Convert.ToInt32(building_id.Value);
            Maintenance1.Date = Convert.ToDateTime(txt_date.Text);
            bL_Maintenance.Add_Click(Maintenance1);


            Maintenance1.Sql_Operation = operation;
            Maintenance1.Society_Id = society_id.Value;
            Maintenance1.build_id = Convert.ToInt32(building_id.Value);
            Maintenance1.M_Date = Convert.ToDateTime(txt_date.Text);
            var flat = Label4.Text.Split(':');


            Maintenance1.Flat = Convert.ToInt32(flat[1]);
            Maintenance1.wing_id = Convert.ToInt32(wing_id.Value);

            Maintenance1.M_Total = Convert.ToDecimal(txt_amount.Text);
            //Maintenance1.Total_Amount = decimal.Parse(txt_total_amt.Text);
            //Maintenance1.Amount_Per_Flat = decimal.Parse(txt_amt_per_ft.Text);
            //Maintenance1.Nature_Of_Charge = txt_nature_charge.Text;
            var result = bL_Maintenance.updateMaintenanceDetails(Maintenance1);
            n_m_id.Value = result.n_m_id.ToString();


        }


        public void runproc(String operation)
        {

            if (n_m_id.Value != "")
                Maintenance1.n_m_id = Convert.ToInt32(n_m_id.Value);
            Maintenance1.Sql_Operation = operation;
            var result = bL_Maintenance.select_maintenance_details(Maintenance1);

            n_m_id.Value = result.n_m_id.ToString();
            building_id.Value = result.build_id.ToString();
            txt_date.Text = result.M_Date.ToString("yyyy-MM-dd");
            if (result.wing_id.ToString() != "0")
                wing_id.Value = result.wing_id.ToString();
            txt_amount.Text = result.M_Total.ToString();

            m_bill_status.Value = result.Status.ToString();

            if (result.Status == 1)
            {
                Panel1.Enabled = false;

            }
            else
                Panel1.Enabled = true;

            Allbound();


        }


        public void final_total()
        {


            int sum = Convert.ToInt32(dt1.Compute("SUM(f_amount)", string.Empty));
            txt_amount.Text = sum.ToString();

        }
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            n_m_id.Value = id;
            Session["n_m_id"] = n_m_id.Value;
            runproc("Select");
            // if (drp_wing.Text != "ALL")
            drp_build_SelectedIndexChanged(sender, e);
            btnAdd_Click(sender, e);
            list_fill();
            

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);

            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (txt_amount.Text != "0")
            {
                Maintenance1.Sql_Operation = "check_already";
                Maintenance1.build_id = Convert.ToInt32(building_id.Value);
                Maintenance1.M_Date = Convert.ToDateTime(txt_date.Text);
                var result = bL_Maintenance.check_already(Maintenance1);
                if (result.Sql_Result == "Exist")
                {


                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Maintenance Already Exist For This Month..!!!');", true);
                }

                else
                {
                    runproc_save("Update");
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Maintenance Bill Only Save Not Generate Maintenance Bill..!!!');", true);
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
                }

            }
            else
                Response.Redirect("maintenance_search.aspx");


        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            if (n_m_id.Value != "")
                Maintenance1.n_m_id = Convert.ToInt32(n_m_id.Value);
            Maintenance1.Sql_Operation = "Delete";
            bL_Maintenance.delete(Maintenance1);
            Response.Redirect("maintenance_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            dt1 = null;
        }


        protected void btn_print_Click(object sender, EventArgs e)
        {

            Response.Redirect("printreport.aspx");

        }

        protected void btn_bill_Click(object sender, EventArgs e)
        {
            Maintenance1.Sql_Operation = "check_date";
            Maintenance1.build_id = Convert.ToInt32(building_id.Value);
            Maintenance1.M_Date = Convert.ToDateTime(txt_date.Text);
            var result = bL_Maintenance.check_date(Maintenance1);
            n_m_id.Value = result.n_m_id.ToString();
            if (result.Sql_Result == "Exist")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Maintenance Already Exist For This Month..!!!');", true);

            }
            else
            {

                if (txt_amount.Text != "0")
                {
                    Maintenance1.Sql_Operation = "check_already";
                    Maintenance1.build_id = Convert.ToInt32(building_id.Value);
                    Maintenance1.M_Date = Convert.ToDateTime(txt_date.Text);
                    var data = bL_Maintenance.check_already(Maintenance1);
                    n_m_id.Value = data.n_m_id.ToString();
                    if (data.Sql_Result != "Exist")


                        runproc_save("Update");

                }



                Maintenance1.Sql_Operation = "generate";
                Maintenance1.M_Date = Convert.ToDateTime(txt_date.Text);
                Maintenance1.wing_id = Convert.ToInt32(wing_id.Value);
                Maintenance1.n_m_id = Convert.ToInt32(n_m_id.Value);
                var result3 = bL_Maintenance.genrate_bill(Maintenance1);

                if (result3.Sql_Result == "Done")
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Maintenance Bill Generated Successfully..!!!');", true);
                else
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + result3.Sql_Result + "');", true);
                Response.Redirect("maintenance_search.aspx");
            }
            btnAdd_Click(sender, e);
        }

        public void list_fill()
        {

            Maintenance1.Sql_Operation = "owner_select";
            Maintenance1.build_id = Convert.ToInt32(building_id.Value);
            var result4 = bL_Maintenance.list_Fill(Maintenance1);


            CheckBoxList1.DataSource = result4;
            CheckBoxList1.DataTextField = "owner_name";
            CheckBoxList1.DataValueField = "owner_id";
            CheckBoxList1.DataBind();


        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label n_m_id = (Label)row.FindControl("n_m_id");
            Maintenance1.Sql_Operation = "Delete";

            Maintenance1.n_m_id = Convert.ToInt32(n_m_id.Text);
            var result = bL_Maintenance.delete(Maintenance1);

            maintenance_Gridbind();

            if (result.Sql_Result == "Done")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Delete()", true);
                Response.Write("<script>alert('building Entry Has Been Registered Successfully')");
                Response.Redirect("maintenance_search.aspx");
            }


        }


        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("Select * from main_search_vw where active_status=0 and society_id='" + society_id.Value + "'");
            if (search_field.SelectedItem.Text != "Select")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '%" + drop_build.SelectedItem.Text + "%'");
            }

            Maintenance1.Sql_Operation = sb.ToString();
            var result = bL_Maintenance.search_maintenance1(Maintenance1);
            GridView1.DataSource = result;
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();


        }
        public void showreport()
        {
            ////fetch_shop_maintenance();
            ////String maintenance_bill = "n_m_id.pdf";
            //CrystalReportViewer reportViewer = new CrystalReportViewer();
            //ReportDocument cryRpt = new ReportDocument();
            //cryRpt.Load(Server.MapPath("~/Report/maintenance_bill_rpt.rpt"));
            //cryRpt.SetParameterValue("m_id", n_m_id.Value);
            //// cryRpt.SetParameterValue("subcode", subcode.Value);
            //cryRpt.SetDatabaseLogon("admin", "admin", "DESKTOP-VR5J462\\SQLEXPRESS", "Society");
            //reportViewer.ReportSource = cryRpt;
            ////reportViewer.RefreshReport();
            //string msg = "";

            //try
            //{
            //    //ExportOptions CrExportOptions;
            //    //DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
            //    //PdfRtfWordFormatOptions CrFormatTypeOptions = new PdfRtfWordFormatOptions();
            //    //CrDiskFileDestinationOptions.DiskFileName = "C:/Report/" + subjectcode;
            //    //CrExportOptions = cryRpt.ExportOptions;
            //    //{
            //    //    CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
            //    //    CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
            //    //    CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
            //    //    CrExportOptions.FormatOptions = CrFormatTypeOptions;
            //    //}
            //    //cryRpt.Export();
            //    cryRpt.PrintToPrinter(1, true, 0, 0);
            //}
            //catch (Exception ex)
            //{
            //    msg = ex.ToString();

            //}
            //finally
            //{
            //    cryRpt.Database.Dispose();
            //    cryRpt.Close();
            //    cryRpt.Dispose();
            //}
            //if (msg.Trim() == "")
            //{
            //    msg = "alert('PDF Created Successfully')";
            //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", msg, true);
            //}
            //else
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", "alert('Error while Printing report')", true);
            //}
        }

        protected void Print_Click(object sender, EventArgs e)
        {

            //showreport();
            Response.Redirect("printreport.aspx");
        }

        protected void CheckAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in CheckBoxList1.Items)
            {
                item.Selected = CheckAll.Checked;
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool isAllChecked = true;
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (!item.Selected)
                {
                    isAllChecked = false;
                    break;
                }
            }

            CheckAll.Checked = isAllChecked;
        }

        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (search_field.SelectedValue == "year")
            {
                string sql2 = "SELECT distinct year FROM maintainance ";
                bL_Maintenance.fill_drop(drop_build, sql2, "year", "year");

            }
            else if (search_field.SelectedValue == "month_name")
            {
                string sql4 = "SELECT distinct month_name FROM maintainance ";
                bL_Maintenance.fill_drop(drop_build, sql4, "month_name", "month_name");


            }
            else if (search_field.SelectedValue == "build_name")
            {
                string sql3 = "SELECT build_id, name FROM  dbo.building_master where society_id='" + society_id.Value + "' order by name";
                bL_Maintenance.fill_drop(drop_build, sql3, "name", "build_id");

            }
        }

        protected void drp_wing_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (drp_wing.Text != "select")
            //{

            //    string sql1 = "Select distinct flat_no,facility_id from dbo.owner_search_vw where  society_id='" + society_id.Value + "' and  w_id='" + drp_wing.SelectedValue + "'";
            //    st.fill_drop(drp_flat_type, sql1, "flat_no", "facility_id");

            //}
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);
        }

        protected void drp_build_SelectedIndexChanged(object sender, EventArgs e)
        {

            //if (building_id.Value != "")
            //{
            //    list_fill();
            //    string sql1 = "Select distinct wing_id,w_name from wing_master where society_id='" + society_id.Value + "' and  build_id='" + drp_build.SelectedValue + "'";
            //    bL_Maintenance.fill_drop_1(drp_wing, sql1, "w_name", "wing_id");
            //    // drp_wing_SelectedIndexChanged(sender, e);
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);

            //}

        }

        protected void drp_flat_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAdd_Click(sender, e);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            maintenance_Gridbind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            int i = 1;
            float total = 0;
            Maintenance1.Sql_Operation = "exfetch";
            Maintenance1.Society_Id = society_id.Value;
            Maintenance1.build_id = Convert.ToInt32(building_id.Value);
            Maintenance1.Date = Convert.ToDateTime(txt_date.Text);
            var result = bL_Maintenance.Add_Click(Maintenance1);
            dt1 = result;
            if (TextBox6.Text == "ALL")
            {
                Maintenance1.Sql_Operation = "check_count";
                Maintenance1.build_id = Convert.ToInt32(building_id.Value);
                Maintenance1.W_Name = wing_id.Value.ToString();
            }
            else

            {
                Maintenance1.Sql_Operation = "check_wing";
                Maintenance1.W_Name = wing_id.Value.ToString();
                Maintenance1.build_id = Convert.ToInt32(building_id.Value);

            }
            var flat = bL_Maintenance.getflat(Maintenance1);
            Label4.Text = "No of Flat :" + flat.Flat.ToString();
            dt1.Columns.Add("amount", typeof(decimal));

            foreach (DataRow row in dt1.Rows)
            {
                row["amount"] = Convert.ToDecimal(row["f_amount"].ToString())/flat.Flat;

                //if (i <= dt1.Rows.Count)
                //{
                //    TextBox txtbox = new TextBox();
                //    TextBox txtbox1 = new TextBox();
                //    TextBox txtbox3 = new TextBox();
                //    txtbox.ClientIDMode = ClientIDMode.Static;
                //    txtbox.ID = "txtcol" + i + "_name";
                //    txtbox.Enabled = false;
                //    txtbox.Text = row["ex_details"].ToString();
                //    txtbox1.ClientIDMode = ClientIDMode.Static;
                //    txtbox1.ID = "txtcol" + i + "_amount";
                //    txtbox1.Enabled = false;
                //    txtbox.ClientIDMode = ClientIDMode.Static;
                //    txtbox3.Enabled = false;
                //    txtbox3.Text = row["f_amount"].ToString();
                //    txt_amount.Text = row["f_amount"].ToString();
                //    if (flat.Flat == 0)
                //    {
                //        txtbox1.Text = (float.Parse(row["f_amount"].ToString())).ToString();
                //        total = total + (float.Parse(row["f_amount"].ToString()));

                //    }
                //    else
                //    {
                //        txtbox1.Text = (float.Parse(row["f_amount"].ToString()) / flat.Flat).ToString();
                //        total = total + float.Parse(row["f_amount"].ToString()) / flat.Flat;
                //    }

                //    pnlTextBoxes.Controls.Add(txtbox);
                //    pnlTextBoxes.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));
                //    pnlTextBoxes.Controls.Add(txtbox3);
                //    pnlTextBoxes.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "));
                //    pnlTextBoxes.Controls.Add(txtbox1);
                //    pnlTextBoxes.Controls.Add(new LiteralControl("<br> <br>")); i++;

                //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", txtbox.Text, true);
                //}

            }
            dt1.AcceptChanges();
            txt_amount.Text= dt1.Compute("SUM(f_amount)", string.Empty).ToString();
            expenseGrid.DataSource = dt1;
            expenseGrid.DataBind();
            Maintenance1.RegularAmount= Convert.ToDecimal(dt1.Compute("SUM(amount)", "Type = 'Regular'"));
            Maintenance1.Add_OnAmount= Convert.ToDecimal(dt1.Compute("SUM(amount)", "Type = 'Add-On'"));

            //int flag = 1;
            // if(dt1.Rows.Count==0)
            //     ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('Expense are Not Approved by Members');", true);
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (building_id.Value != "")
                {
                    var link = (LinkButton)e.Item.FindControl("lnkCategory");
                    if (link.CommandArgument == building_id.Value)
                        TextBox5.Text = link.Text;
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (wing_id.Value != "")
                {
                    var link = (LinkButton)e.Item.FindControl("lnkCategory");
                    if (link.CommandArgument == wing_id.Value)
                        TextBox6.Text = link.Text;
                }
            }
        }

      
    }
}


    
