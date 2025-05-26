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
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Web.Services.Description;
using System.EnterpriseServices;
using System.IO;
using System.Windows.Forms;

namespace Society
{
    public partial class owner_search : System.Web.UI.Page
    {

        BL_Owner_Master bL_Owner = new BL_Owner_Master();
        Owner owner = new Owner();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {

                Owner_Gridbind();
                fill_drop1();
            }
        }
        public void fill_drop1()
        {
            String sql_query = "Select *  from married_status ";
            bL_Owner.fill_drop(drp_married, sql_query, "married_name", "married_id");

            String sql_query1 = "Select society_id,flat_id,(flat_no +'  '+ usage+'  '+ bed +'  '+ sq_ft) as flat_type  from flat where  society_id='" + society_id.Value + "'";
            bL_Owner.fill_drop(ddl_flat, sql_query1, "flat_type", "flat_id");

            String sql_query2 = "Select wing_id,(name + w_name) as name from global_society_view where society_id='" + society_id.Value + "'";
            bL_Owner.fill_drop(ddl_build_wing, sql_query2, "name", "wing_id");

            String sql_query3 = "Select *  from types ";
            bL_Owner.fill_drop(ddl_type, sql_query3, "flat_type", "flat_type_id");

            String sql_query4 = "Select * from doc_master where society_id='" + society_id.Value + "'";
            bL_Owner.fill_drop(ddl_doc_type, sql_query4, "doc_name", "doc_id");
        }
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            owner_id.Value = id;
            runproc("Select");
            //runproc_Family("Select_Family");
            Family_Details_Gridbind();
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        public void Owner_Gridbind()
        {
            DataSet dt = new DataSet();
            owner.Sql_Operation = "Grid_Show";
            owner.Type = "Owner";
            owner.Society_Id = society_id.Value;
            dt= bL_Owner.getOwnerDetails(owner);
            OwnerGrid.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            OwnerGrid.DataBind();

        }

        public void Family_Details_Gridbind()
        {
            DataSet dt = new DataSet();
            owner.Sql_Operation = "Grid_Show_Family";
            owner.owner_id = Convert.ToInt32(owner_id.Value);
            owner.Type = "Owner";
            dt = bL_Owner.getFamilyDetails(owner);
            FamilyGrid.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            FamilyGrid.DataBind();

        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(" Select *  from owner_search_vw where active_status=0 and type='Owner' And society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            sb.Append(" order by name");
            owner.Sql_Operation = sb.ToString();
            var result = bL_Owner.search_rental(owner);
            OwnerGrid.DataSource = result;
            ViewState["dirState"] = result;
            OwnerGrid.DataBind();

        }
        public void runproc_save(string operation)
        {
            string type = "Owner";
            if (owner_id.Value != "")
                owner.owner_id = Convert.ToInt32(owner_id.Value);
            owner.Sql_Operation = operation;
            owner.Society_Id = society_id.Value;
            owner.wing_id = Convert.ToInt32(ddl_build_wing.SelectedValue.ToString());
            owner.Poss_Date = Convert.ToDateTime(txt_poss_date.Text.ToString());
            owner.Name = txt_name.Text;
            owner.Pre_Mob = txt_pre_mob.Text;
            owner.Dob = Convert.ToDateTime(txt_dob.Text);
            owner.married_id = Convert.ToInt32(drp_married.SelectedValue.ToString());
            owner.Occup = txt_occup.Text;
            owner.Monthly_Income = txt_monthly_income.Text;
            owner.Off_Addr1 = txt_off_addr1.Text;
            owner.Off_Tel = txt_off_tel.Text;
            owner.Email = txt_email.Text;
            owner.Alter_Mob = txt_add_mob.Text;
            owner.flat_id = Convert.ToInt32(ddl_flat.SelectedValue.ToString());
            owner.Flat_type_Id = Convert.ToInt32(ddl_type.SelectedValue.ToString());
            owner.Photo_Name =uploadphotopath.Text;
            owner.Id_Proof = uploadidproof.Text;
            owner.Type = type;
            var result = bL_Owner.updateOwnerDetails(owner);
            owner_id.Value = result.owner_id.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }



        public void runproc_F_save(string operation)
        {
            if (o_ex_id.Value != "")
                owner.O_Ex_Id = Convert.ToInt32(o_ex_id.Value);
            owner.Sql_Operation = operation;
            owner.owner_id = Convert.ToInt32(owner_id.Value);
            owner.Society_Id = society_id.Value;
            owner.F_Name = txt_fam_mem_name.Text;
            owner.Relation = txt_owner_rel.Text;
            owner.F_Occu = txt_f_occu.Text;
            owner.F_Dob = txt_f_dob.Text;
            bL_Owner.updateFamilyOwnerDetails(owner);
        }


        public void runproc(string operation)
        {
            if (owner_id.Value != "")
                owner.owner_id = Convert.ToInt32(owner_id.Value);
            owner.Sql_Operation = operation;

            var result = bL_Owner.runproc(owner);
            if (operation == "Select")
            {

                (owner_id.Value) = result.owner_id.ToString();
                society_id.Value = result.Society_Id;
                ddl_build_wing.SelectedValue = result.wing_id.ToString();
                txt_poss_date.Text = result.Poss_Date.ToString("yyyy-MM-dd");
                txt_name.Text = result.Name;
                txt_pre_mob.Text = result.Pre_Mob;
                txt_dob.Text = result.Dob.ToString("yyyy-MM-dd");
                drp_married.SelectedValue = result.married_id.ToString();
                txt_occup.Text = result.Occup;
                txt_monthly_income.Text = result.Monthly_Income;
                txt_off_addr1.Text = result.Off_Addr1;
                txt_off_tel.Text = result.Off_Tel;
                txt_email.Text = result.Email;
                txt_add_mob.Text = result.Alter_Mob;
                ddl_flat.SelectedValue = result.flat_id.ToString();
                ddl_type.SelectedValue = result.Flat_type_Id.ToString();
                listofuploadedfiles.Text = Path.GetFileName(result.Photo_Name);
                listofuploadedfiles1.Text = Path.GetFileName(result.Id_Proof);
               
            }
        }


        protected void btn_save_Click1(object sender, EventArgs e)
        {
            runproc_save("Update");
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        protected void btn_photo_upload_Click(object sender, EventArgs e)
        {

                string createfolder = Server.MapPath("~/Documents") + "/" + txt_name.Text + "/";


                System.IO.Directory.CreateDirectory(createfolder);

                if (FileUpload1.HasFiles)
                {

                    foreach (HttpPostedFile file_name in FileUpload1.PostedFiles)
                    {
                        file_name.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + file_name.FileName));
                        listofuploadedfiles.Text += file_name.FileName + "<br/>";
                    }

                    uploadphotopath.Text = System.IO.Path.Combine(Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + FileUpload1.FileName);
                }
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }

            protected void btnotice_id_upload_Click(object sender, EventArgs e)
            {
                string createfolder = Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/";

                System.IO.Directory.CreateDirectory(createfolder);

                if (FileUpload2.HasFiles)
                {

                    foreach (HttpPostedFile file_name in FileUpload2.PostedFiles)
                    {
                        file_name.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Documents") + "/" + txt_name.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/" + file_name.FileName));
                        listofuploadedfiles1.Text += file_name.FileName + "<br/>";

                    }

                    uploadidproof.Text = System.IO.Path.Combine(Server.MapPath("~/Documents") + "\\" + txt_name.Text + "\\" + (ddl_doc_type.SelectedItem.Text) + "\\" + FileUpload2.FileName);

                }
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);



          
        }


        public void cleardata()
        {
            txt_fam_mem_name.Text = "";
            txt_f_dob.Text = "";
            txt_f_occu.Text = "";
            txt_owner_rel.Text = "";
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            runproc_save("Update");
            runproc_F_save("D_Update");
            Family_Details_Gridbind();
            cleardata();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void FamilyGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
                GridViewRow row = (GridViewRow)FamilyGrid.Rows[e.RowIndex];

                System.Web.UI.WebControls.Label id = (System.Web.UI.WebControls.Label)row.FindControl("o_ex_id");
                owner.Sql_Operation = "D_delete";

                owner.O_Ex_Id = Convert.ToInt32(id.Text);
                bL_Owner.FamilyDelete(owner);
          
            Family_Details_Gridbind();
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("owner_search.aspx");
        }


        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                runproc("Delete");
           
            Response.Redirect("owner_search.aspx");

        }
        protected void OwnerGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show("Are you sure want to delete", "delete", buttons);
            if (result == DialogResult.Yes)
            {
                GridViewRow row = (GridViewRow)OwnerGrid.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label owner_id = (System.Web.UI.WebControls.Label)row.FindControl("owner_id");
                owner.Sql_Operation = "Delete";

                owner.owner_id = Convert.ToInt32(owner_id.Text);
                bL_Owner.OwnerDelete(owner);
            }
            Owner_Gridbind();
        }

        protected void OwnerGrid_Sorting(object sender, GridViewSortEventArgs e)
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
                OwnerGrid.DataSource = dtrslt;
                OwnerGrid.DataBind();


            }
        }

        protected void OwnerGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void txt_pre_mob_TextChanged(object sender, EventArgs e)
        {
            //if (owner_id.Value != "")
            //    owner.owner_id = Convert.ToInt32(owner_id.Value);
            //owner.Sql_Operation = "cust_sel";
            //owner.Pre_Mob = txt_pre_mob.Text;
            //var result = bL_Owner.MobileTextchanged(owner);
            ////ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            //Label16.Text = result.Sql_Result;
        }

      

        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
         {
           
                if (ddl_type.Text != "select")
                {

                    string sql1 = "Select distinct flat_type,flat_id from dbo.flat_types where flat_status=0 and society_id='" + society_id.Value + "' and  wing_id='" + ddl_build_wing.SelectedValue + "' and flat_type_id='" + ddl_type.SelectedValue +"'";
                    bL_Owner.fill_drop(ddl_flat, sql1, "flat_type", "flat_id");

                }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#edit_model').modal('show');", true);
        }

        protected void FamilyGrid_Sorting(object sender, GridViewSortEventArgs e)
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
                FamilyGrid.DataSource = dtrslt;
                FamilyGrid.DataBind();


            }
        }

        protected void FamilyGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void OwnerGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            OwnerGrid.PageIndex = e.NewPageIndex;
            Owner_Gridbind();
        }
    }
}




