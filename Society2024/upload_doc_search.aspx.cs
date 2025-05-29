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
using Society2024;
using BusinessLogic.BL;
using Utility.DataClass;

namespace Society
{
    public partial class upload_doc_search : System.Web.UI.Page
    {

        upload_doc doc = new upload_doc();
        BL_Upload_Doc BL_Upload = new BL_Upload_Doc();

      
       
        string path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            if (!IsPostBack)
            {
                fill_drop1();
                upload_doc_gridbind();                
            }

        }
        public void fill_drop1()
        {
            //String sql_query = "Select *  from flat_master where society_id='" + society_id.Value + "'";
            //st.fill_drop(ddl_flatno, sql_query, "flat_no", "facility_id");

            //String sql_query1 = "Select *  from bedroom ";
            //st.fill_drop(ddl_type, sql_query1, "bed", "bed_id");

            String sql_query2 = "Select *  from building_master where society_id='" + society_id.Value + "'";
            BL_Upload.fill_drop(ddl_build, sql_query2, "name", "build_id");

            //String sql_query3 = "Select *  from wing_master where society_id='" + society_id.Value + "'";
            //st.fill_drop(ddl_wing, sql_query3, "w_name", "w_id");

            String sql_query4 = "Select *  from doc_master where society_id='" + society_id.Value + "'";
            BL_Upload.fill_drop(ddl_doc_type, sql_query4, "doc_name", "doc_id");
        }
        public void uplaod_doc()
        {
            string createfolder = Server.MapPath("~/Documents") + "/" + ddl_build.SelectedItem.Text + "/" + ddl_wing.SelectedItem.Text + "/" + ddl_flatno.SelectedItem.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/";
            Directory.CreateDirectory(createfolder);

            if (file_name.HasFiles)
            {

                foreach (HttpPostedFile file_name in file_name.PostedFiles)
                {
                    file_name.SaveAs(Path.Combine(Server.MapPath(("~/Documents") + "/" + ddl_build.SelectedItem.Text + "/" + ddl_wing.SelectedItem.Text + "/"+ ddl_flatno.SelectedItem.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/" + file_name.FileName)));
                    listofuploadedfiles.Text += file_name.FileName + "<br/>";
                }

                path = Path.Combine(Server.MapPath(("~/Documents") + "/" + ddl_build.SelectedItem.Text + "/" + ddl_wing.SelectedItem.Text + "/"  + ddl_flatno.SelectedItem.Text + "/" + (ddl_doc_type.SelectedItem.Text) + "/" + file_name.FileName));
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
        }


        public void runproc(string operation)
        {

            if (file_id.Value!= "")
                doc.File_Id = Convert.ToInt32(file_id.Value);
            doc.Sql_Operation = operation;

            var result = BL_Upload.updatedocsearch(doc);

            //(parking_id.Value) = result.parking_id.ToString();
            society_id.Value = result.Society_Id;
            listofuploadedfiles.Text = Path.GetFileName(result.File_Save_Path);
            ddl_doc_type.SelectedValue = result.doc_id.ToString();
            ddl_build.SelectedValue = result.build_id.ToString();
            txt_wing.Text = result.W_Name.ToString();
            txt_no.Text = result.Flat_No.ToString();
            
            txt_date.Text = result.Date.ToString("yyyy-MM-dd");
            
        }
        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            file_id.Value = id;
            runproc("Select");
            txt_wing.Visible = true;
            ddl_wing.Visible = false;
            
            txt_no.Visible = true;
            ddl_flatno.Visible = false;
            Label2.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
        }
        public void runproc_save(string operation)
        {
            if (file_id.Value != "")
                doc.File_Id = Convert.ToInt32(file_id.Value);
            doc.Sql_Operation = operation;
            doc.Society_Id = society_id.Value;
            doc.File_Save_Path = path;
            doc.doc_id = Convert.ToInt32(ddl_doc_type.SelectedValue.ToString());
            doc.build_id = Convert.ToInt32(ddl_build.SelectedValue.ToString());
            doc.wing_id = Convert.ToInt32(ddl_wing.SelectedValue.ToString());
          
            doc.flat_id = Convert.ToInt32(ddl_flatno.SelectedValue.ToString());
            doc.Date = Convert.ToDateTime(txt_date.Text);
            BL_Upload.updatedocsearch(doc);
   
        }





        protected void upload_Click(object sender, EventArgs e)
        {
            //    uplaod_doc();
            //    runproc("Update");
            //    Response.Redirect("upload_doc_search.aspx");
            if (!file_name.HasFile)
            {
               
                listofuploadedfiles.Text = "Please select a file before uploading.";
                listofuploadedfiles.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (Label7.Text == "")
            {
                uplaod_doc();
                runproc_save("Update");
                Response.Redirect("upload_doc_search.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            }
        }

        protected void upload_doc_gridbind()
        {
            DataSet dt = new DataSet();
            doc.Sql_Operation= "Grid_Show";
            doc.Society_Id = society_id.Value;
            dt = BL_Upload.GetUploadDoc(doc);
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
            sb.Append("Select * from upload_doc_vw  where active_status=0 and society_id='" + society_id.Value+ "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }

            doc.Sql_Operation = sb.ToString();
            var result = BL_Upload.search_upload_doc(doc);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
           
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("upload_doc_search.aspx");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "HideModal", "$('#edit_model').modal('hide');", true);
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label file_id = (Label)row.FindControl("file_id");
            doc.Sql_Operation = "Delete";
            doc.File_Id = Convert.ToInt32(file_id.Text);
            BL_Upload.delete(doc);
            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            upload_doc_gridbind();

        }

        protected void ddl_flatno_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_flatno.Text.Trim() != "")
            {
                if (file_id.Value != "")
                {
                    doc.File_Id = Convert.ToInt32(file_id.Value);
                    doc.Sql_Operation = "check_no";
                    //owner.owner_id = Convert.ToInt32(owner_id.Value);
                    doc.Society_Id = society_id.Value;
                    doc.doc_id = Convert.ToInt32(ddl_doc_type.SelectedValue.ToString());
                    doc.flat_id = Convert.ToInt32(ddl_flatno.SelectedValue.ToString());


                    var result = BL_Upload.flat_no_selectedIndexChanged(doc);
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
                    Label7.Text = result.Sql_Result;
                }
            }
        }

        protected void ddl_build_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_build.Text != "select")
            {

                string sql1 = "Select distinct w_name,wing_id from dbo.flat_types where  society_id='" + society_id.Value + "' and  name='" + ddl_build.SelectedItem.Text + "' ";
                BL_Upload.fill_drop(ddl_wing, sql1, "w_name", "wing_id");
                ddl_wing_SelectedIndexChanged(sender, e);

            }

        }

        protected void ddl_wing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_wing.Text != "select")
            {

                string sql1 = "Select distinct flat_no,flat_id from dbo.flat_types where  society_id='" + society_id.Value + "' and build_id=" + ddl_build.SelectedValue + " and wing_id=" + ddl_wing.SelectedValue;
                BL_Upload.fill_drop(ddl_flatno, sql1, "flat_no", "flat_id");

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            upload_doc_gridbind();
        }
    }
}

    
