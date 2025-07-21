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
using System.Drawing.Drawing2D;
using Page = System.Web.UI.Page;
using DBCode.DataClass.Master_Dataclass;
using BusinessLogic.MasterBL;
using System.Windows.Forms;
using BusinessLogic.BL;
using Society2024;
using DBCode.DataClass;




namespace Society
{
    public partial class society_member_search : System.Web.UI.Page
    {
        BL_FillRepeater repeater = new BL_FillRepeater();
        Owner owner = new Owner();
        BL_Owner_Master bl_owner = new BL_Owner_Master();
        Society_Member member = new Society_Member();
        BL_Society_Member_Master bL_Society = new BL_Society_Member_Master();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                 Response.Redirect("login1.aspx");
            }
            else
                society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                String str = "Select *  from UserType where type=1";
                repeater.fill_list(categoryRepeater2, str);
                String str2 = "SELECT * FROM owner_master WHERE  login_status=0 and active_status=0 and type = 'owner' AND society_id='" + Session["society_id"].ToString() + "'";
                repeater.fill_list(categoryRepeater1, str2);
                Society_Member_Gridbind();

            }

        }
        protected void CategoryRepeater_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                name_id.Value = e.CommandArgument.ToString();
                owner.owner_id = Convert.ToInt32(e.CommandArgument);
                owner.Sql_Operation = "Select";
                var result = bl_owner.runproc(owner);
                txt_contact_no.Text = result.Pre_Mob;
                txt_email.Text = result.Email;
                txt_username.Text = result.Email;

            }
        }

        protected void CategoryRepeater_ItemCommand2(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                Designation_id.Value = e.CommandArgument.ToString();



            }
        }


        protected void Society_Member_Gridbind()
        {
            DataTable dt = new DataTable();
            member.Sql_Operation = "Grid_Show";
            member.Society_Id = society_id.Value;
            dt = bL_Society.getSocietyMemberDetails(member);
            GridView1.DataSource = dt;
            ViewState["dirState"] = dt;
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
            Response.Redirect("society_member_search.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            member.Name = txt_search.Text;
            member.Sql_Operation = "Search";
            var result = bL_Society.search_member(member);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Refocus", "refocusAfterPostback();", true);
        }

        public string runproc_save(string operation)
        {

            if (user_id.Value != "")
                member.UserId = Convert.ToInt32(user_id.Value);
            member.Sql_Operation = operation;
            member.Society_Id = society_id.Value;
            member.Name = TextBox1.Text;
            member.Designation = Convert.ToInt32(Designation_id.Value);
            member.UserName = txt_username.Text;
            member.Password = txt_password.Text;
            member.Status = 0;
            
            var result = bL_Society.updateSocietyMemberDetails(member);
            return result.Sql_Result;
        }


        public void runproc_edit_society_member(String operation)
        {
            if (user_id.Value != "")
                member.UserId = Convert.ToInt32(user_id.Value);
            member.Sql_Operation = operation;

            var result = bL_Society.updateSocietyMemberDetails(member);


            (user_id.Value) = result.UserId.ToString();
            society_id.Value = result.Society_Id;
            TextBox1.Text = result.Name.ToString();
            Designation_id.Value = result.Designation.ToString();
            TextBox1.Text = result.Name;
            //txt_address1.Text = result.Address1.ToString();
            //txt_address2.Text = result.Address2.ToString();
            txt_contact_no.Text = result.Contact_No.ToString();
            txt_email.Text = result.Email.ToString();
            txt_username.Text = result.UserName.ToString();
            txt_password.Text = result.Password.ToString();

            String str = "Select *  from UserType";
            repeater.fill_list(categoryRepeater2, str);

        }


        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (Label25.Text == "")
            {
               // btn_save.Visible = false;
                string str = runproc_save("Update");
                if(str=="Done")
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "FailedEntry();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);

                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {

            if (user_id.Value != "")
                member.UserId = Convert.ToInt32(user_id.Value);
            member.Sql_Operation = "Delete";
            member.Name = TextBox1.Text;
            member.Designation = Convert.ToInt32(Designation_id.Value);
            //member.Address1 = txt_address1.Text;
            //member.Address2 = txt_address2.Text;
            //member.Contact_No = txt_contact_no.Text;
            //member.Email = txt_email.Text;
            member.UserName = txt_username.Text;
            member.Password = txt_password.Text;
            member.Status = 0;
            bL_Society.delete(member);

            Response.Redirect("society_member_search.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {


            Response.Redirect("society_member_search.aspx");
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            user_id.Value = id;
            runproc_edit_society_member("Select");
            passPanel.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "openModal();", true);
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "OpenModal()", "<script>$('#mymodal').modal('show');</script>", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            System.Web.UI.WebControls.Label user_id = (System.Web.UI.WebControls.Label)row.FindControl("user_id");
            member.Sql_Operation = "Delete";

            member.UserId = Convert.ToInt32(user_id.Text);
            bL_Society.delete(member);
            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);

            Society_Member_Gridbind();


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void txt_contact_no_TextChanged(object sender, EventArgs e)
        {
            if (txt_contact_no.Text.Trim() != "")
            {
                if (user_id.Value != "")
                    member.UserId = Convert.ToInt32(user_id.Value);
                member.Contact_No = txt_contact_no.Text;
                member.Society_Id = society_id.Value;
                member.Sql_Operation = "chk_name";
                var result = bL_Society.SocietyMemberTextChange(member);
                Label25.Text = result.Sql_Result;
            }
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {

            txt_username.Text = txt_email.Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Society_Member_Gridbind();
        }


        protected void categoryRepeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (name_id.Value != "")
                {
                    var link = (LinkButton)e.Item.FindControl("lnkCategory");
                    if (link.CommandArgument == name_id.Value)
                        TextBox1.Text = link.Text;
                }
            }
        }

        protected void categoryRepeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (Designation_id.Value != "")
                {
                    var link = (LinkButton)e.Item.FindControl("lnkCategory");
                    if (link.CommandArgument == Designation_id.Value)
                        Textbox2.Text = link.Text;

                }
            }
        }

        protected void showPass(object sender, EventArgs e)
        {
            passPanel.Visible = true;
        }

    }
}

