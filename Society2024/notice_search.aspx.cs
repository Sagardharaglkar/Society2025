using System;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System.Web.UI;
using System.Windows.Forms;
using Society2024;
using System.Threading.Tasks;
//using System.IdentityModel.Metadata;

namespace Society
{
    public partial class notice_search : System.Web.UI.Page
    {
        BL_Notice_Master bL_Notice = new BL_Notice_Master();
        Notice notice = new Notice();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();


            if (!IsPostBack)
            {
             
                Notice_Gridbind();
                fill_drop();

                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
           
        }
        public void fill_drop()
        {
            list_fill();
            String sql_query = "Select *  from notice_recipients ";
            bL_Notice.fill_drop(ddl_recipients, sql_query, "recipients", "recipients_id");
        }
        public void Notice_Gridbind()
        {
            DataSet dt = new DataSet();
            notice.Sql_Operation = "Grid_Show";
            if (notice_id.Value != "")
                notice.notice_id = Convert.ToInt32(notice_id.Value);
            notice.Society_Id = society_id.Value;
            dt = bL_Notice.getNotice(notice);
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
            sb.Append(" Select * from notice_master  where active_status= 0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '%" + txt_search.Text.Trim() + "%'");
            }
            notice.Sql_Operation = sb.ToString();
            var result = bL_Notice.search_notice(notice);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }

        public  void  runproc_save(string operation)
        {
            if (notice_id.Value != "")
                notice.notice_id = Convert.ToInt32(notice_id.Value.ToString());
            notice.Sql_Operation = operation;
            notice.Society_Id = society_id.Value;
            notice.Name = txt_sub.Text;
            notice.Recipients_id = Convert.ToInt32(ddl_recipients.SelectedValue);
            notice.Description = txt_desc.Text;
            notice.Valid_To = Convert.ToDateTime(txt_valid_to.Text.ToString());
            var result=bL_Notice.updateNoticeDetails(notice);
            foreach(DataRow row in result.Rows)
            {
                notice.User_Id = Convert.ToInt32(row["user_id"].ToString());
                notice.UserType = row["type"].ToString();
                notice.Notification_id = notice.notice_id;
                notice.Notification_Type = "Notice";
                notice.Body = txt_sub.Text;
                bL_Notice.send_notification(notice);
                generate_notification(row["token"].ToString());
            }
        }

        protected async void generate_notification(string token)
        {
            var Fcm = new FirebaseCloudMessaging();
            await Fcm.SendNotificationAsync(token, "New Announcement", txt_sub.Text);
        }
        public void runproc_notice(string operation)
        {
            if (notice_id.Value != "")
                notice.notice_id = Convert.ToInt32(notice_id.Value);
            notice.Sql_Operation = operation;
            var result = bL_Notice.getNoticeDetails(notice);

            (notice_id.Value) = result.notice_id.ToString();
            society_id.Value = result.Society_Id;
            txt_sub.Text = result.Name;
           ddl_recipients.SelectedValue = result.Recipients_id.ToString();
            txt_desc.Text = result.Description;
            txt_valid_to.Text = result.Valid_To.ToString("yyyy-MM-dd");
            
        }

        protected void btn_save_Click1(object sender, EventArgs e)
        {
           
                runproc_save("Update");
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            
                if (notice_id.Value != "")
                    notice.notice_id = Convert.ToInt32(notice_id.Value);
                notice.Sql_Operation = "Delete";
                bL_Notice.delete(notice);
          
            Response.Redirect("notice_search.aspx");
        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("notice_search.aspx");
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            notice_id.Value = id;
            runproc_notice("Select");
            list_fill();
            btn_delete.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label notice_id = (System.Web.UI.WebControls.Label)row.FindControl("notice_id");
                notice.Sql_Operation = "Delete";

                notice.notice_id = Convert.ToInt32(notice_id.Text);
                bL_Notice.delete(notice);
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
          
            Notice_Gridbind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (search_field.SelectedValue == "date")
            {
                txt_search.TextMode = TextBoxMode.Date;
            }
            else
                txt_search.TextMode = TextBoxMode.SingleLine;
            txt_search.Text = "";
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

        protected void CheckAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in CheckBoxList1.Items)
            {
                item.Selected = CheckAll.Checked;
            }
        }

        public void list_fill()
        {

            notice.Sql_Operation = "owner_select";
            notice.Society_Id =society_id.Value;
            var result4 = bL_Notice.list_Fill(notice);


            CheckBoxList1.DataSource = result4;
            CheckBoxList1.DataTextField = "name";
            CheckBoxList1.DataValueField = "owner_id";
            CheckBoxList1.DataBind();


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Notice_Gridbind();
        }
    }
}


