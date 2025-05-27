using BusinessLogic.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Utility.DataClass;

namespace Society2024
{
    public partial class Staff_Master : System.Web.UI.Page
    {
        staff Staff = new staff();
        BL_Staff bL_Staff = new BL_Staff();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();


            if (!IsPostBack)
            {
                fill_drop1();
                staff_Gridbind();
            }

        }

        public void fill_drop1()
        {
            String sql_query = "Select *  from staff_role where active_status=0 and society_id='" + society_id.Value + "'";
            bL_Staff.fill_drop(ddl_role, sql_query, "role", "role_id");

        }
        public void staff_Gridbind()
        {
            DataSet dt = new DataSet();
            Staff.Sql_Operation = "Grid_Show";
            Staff.Society_Id = society_id.Value;
            dt = bL_Staff.getstaffdetails(Staff);
            GridView1.DataSource = dt.Tables[0];
            ViewState["dirState"] = dt.Tables[0];
            GridView1.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            runproc_save("Update");
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        public void runproc_save(string operation)
        {
            if (staff_id.Value != "")
                Staff.staff_id = Convert.ToInt32(staff_id.Value);
            Staff.Sql_Operation = operation;
            Staff.Society_Id = society_id.Value;
            
            Staff.Name = txt_name.Text;
            Staff.Address = txt_address.Text;
            Staff.Contact_No = txt_contact.Text;
            Staff.Email = txt_email.Text;
            Staff.Date_Of_Join = Convert.ToDateTime(txt_doj.Text);
            
            Staff.role_id = Convert.ToInt32(ddl_role.SelectedValue);
            bL_Staff.update_staff(Staff);
            staff_Gridbind();
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

        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (staff_id.Value != "")
                    Staff.staff_id = Convert.ToInt32(staff_id.Value);
                Staff.Sql_Operation = "Delete";
                bL_Staff.delete(Staff);
           
            Response.Redirect("Staff_Master.aspx");

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label notice_id = (System.Web.UI.WebControls.Label)row.FindControl("staff_id");
                Staff.Sql_Operation = "Delete";

                Staff.staff_id = Convert.ToInt32(notice_id.Text);
                bL_Staff.delete(Staff);
          
              staff_Gridbind();

            

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Master.aspx");
        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            staff_id.Value = id;
            runproc_staff("Select");
            btn_delete.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        private void runproc_staff(string operation)
        {
            if (staff_id.Value != "")
                Staff.staff_id = Convert.ToInt32(staff_id.Value.ToString());

            Staff.Sql_Operation = operation;
            var result = bL_Staff.update_staff(Staff);

            (staff_id.Value) = result.staff_id.ToString();
            society_id.Value = result.Society_Id;
           
            txt_name.Text = result.Name;
            txt_address.Text = result.Address;
            txt_contact.Text = result.Contact_No;
            txt_email.Text = result.Email;
            txt_doj.Text = result.Date_Of_Join.ToString("yyyy-MM-dd");
            ddl_role.SelectedValue = result.role_id.ToString();

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("select * from staff_master_vw where active_status=0 and society_id='" + society_id.Value + "'");
            if (txt_search.Text != "")
            {
                sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
            }
            Staff.Sql_Operation = sb.ToString();
            var result = bL_Staff.search_staff(Staff);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
        }

        protected void txt_contact_TextChanged(object sender, EventArgs e)
        {
            if (staff_id.Value != "")
                Staff.staff_id = Convert.ToInt32(staff_id.Value);
            Staff.Sql_Operation = "check_no";
            Staff.Contact_No =txt_contact.Text;
            var result = bL_Staff.contact_textchanged(Staff);
            //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + result.Sql_Result + "')", true);
            Label19.Text = result.Sql_Result;
        }
    }
}