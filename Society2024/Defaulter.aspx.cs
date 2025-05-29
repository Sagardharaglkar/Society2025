using BusinessLogic.MasterBL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society2024
{
    public partial class Defaulter : System.Web.UI.Page
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                filldrop();
                btn_search_Click(sender,e);
                
                date_before.Text = DateTime.Now.ToShortDateString();
            }
        }

        public void filldrop()
        {
            String sql_query1 = "Select *  from bedroom";
            BL_Login.fill_drop(drp_type, sql_query1, "bed", "bed_id");

        }



        protected void btn_send_email_Click(object sender, EventArgs e)
        {
            //Button btn = sender as Button;
            //GridViewRow Row = (GridViewRow)btn.NamingContainer;
            //string rowindex = GridView8.Rows[Row.RowIndex].Cells[1].Text;
            //int abc = Row.RowIndex;
            List<String> list = new List<String>();
            foreach (GridViewRow row in GridView8.Rows)
            {
                
                CheckBox chkBx = (CheckBox)row.FindControl("CheckBox1");
                if (chkBx.Checked==true)
                {
                    
                    Label email1 = (Label)row.FindControl("email");
                    
                    list.Add(email1.Text);
                    

                 
                }
               
            }

            //foreach (string email in list)
                txt_email.Text = string.Join(",", list);
        }

        protected void btn_send_sms_Click(object sender, EventArgs e)
        {
            List<String> list = new List<string>(); 
            foreach (GridViewRow row in GridView8.Rows)
            {

                CheckBox chkBx = (CheckBox)row.FindControl("CheckBox1");
                if (chkBx.Checked == true)
                {
                   
                    Label contact_no = (Label)row.FindControl("mobile_no");
                    list.Add(contact_no.Text);

                }
            }
            txt_email.Text = string.Join(",", list);
        }

       
        protected void select_all_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox select_all = sender as CheckBox;
            foreach (GridViewRow row in GridView8.Rows)
            {
                CheckBox chkBx = (CheckBox)row.FindControl("CheckBox1");
                if (select_all.Checked == true)
                    chkBx.Checked = true;
                else
                    chkBx.Checked = false;
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

            if (RadioButton1.Checked == true)
            {
                btn_send_email.Visible = true;
                btn_send_sms.Visible = false;
            }
            else
            {
                btn_send_email.Visible = false;
                btn_send_sms.Visible = true;
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton2.Checked == true)
            {
                btn_send_email.Visible = false;
                btn_send_sms.Visible = true;
            }
            else
            {
                btn_send_email.Visible = true;
                btn_send_sms.Visible = false;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append(" Select * from flat where society_id='" + society_id.Value + "'");

            sb.Append("select sum(due) as due, bed, unit, owner_name, email, pre_mob from maintainance where (society_id = '" + society_id.Value  + "' and due > 0 and gen_date <= '" + date_before.Text + "')" );
            if (drp_type.SelectedItem.Text != "select")
            {
                sb.Append(" and (bed='" + drp_type.SelectedItem.Text + "')");
            }

            if (txt_search.Text != "")
            {
                //sb.Append(" and " + search_field.SelectedValue + " like '" + txt_search.Text + "%'");
                 sb.Append( " and (unit like '" + txt_search.Text + "%'");
           
              
          
                sb.Append(" or email like '" + txt_search.Text + "%'");
            
                sb.Append(" or owner_name like '" + txt_search.Text + "%'");
           

                sb.Append(" or pre_mob like '" + txt_search.Text + "%')");

                sb.Append(" or due like '" + txt_search.Text + "%'");
            }
           

            sb.Append(" group by  bed, unit, owner_name, email, pre_mob, due");
            details.Sql_Operation = sb.ToString();
            var result = BL_Login.search_defaulter(details);
            if (result != null && result.Rows.Count > 0)
            {
                ViewState["dirState"] = result; 
                ViewState["sortdr"] = "Asc";
            }
            GridView8.DataSource = result;
            GridView8.DataBind();
        }

        protected void GridView8_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt!= null && dtrslt.Rows.Count > 0)
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
                GridView8.DataSource = dtrslt;
                GridView8.DataBind();


            }
        }
    }
}